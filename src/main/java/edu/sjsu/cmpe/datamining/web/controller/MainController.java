package edu.sjsu.cmpe.datamining.web.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.cmpe.datamining.dao.MovieInfoDao;
import edu.sjsu.cmpe.datamining.model.MovieInfo;
import edu.sjsu.cmpe.datamining.model.User;
import edu.sjsu.cmpe.datamining.service.MovieRecoService;

@Controller
public class MainController {
	
	static final String pageTitle = "Welcome to Movie Recommendation Web Application";
	static final String pageMessage = "Project for SJSU Computer Engineering - Data Mining Course - FALL 2014";
	static final String projByString = "Richa Lakhe, Huzefa, Akshaar, Anisha";
	static int MAX_RECO_MOVIES = 10; // max number of Recommended movies shown to user.
	static int MAX_SUGGEST_MOVIES = 10; // max number of Suggested movies shown to user.
	
	@Autowired
	MovieRecoService movieRecoService;
	
	@Autowired
	MovieInfoDao movieInfoDao;

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		
		// Find if user is logged-in. If he is, pass that info to jsp page
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication != null ? authentication.getName() : null;
		boolean isLoggedIn = username != null ? (!username.equalsIgnoreCase("anonymousUser")) : false;
		if(isLoggedIn) {
			model.addObject("isLoggedIn", isLoggedIn);
			model.addObject("username", username);
		}

		model.setViewName("hello");
		return model;

	}
	
	@RequestMapping(value = { "/about**"}, method = RequestMethod.GET)
	public ModelAndView aboutUsPage() {

		ModelAndView model = new ModelAndView();
		
		// Find if user is logged-in. If he is, pass that info to jsp page
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication != null ? authentication.getName() : null;
		boolean isLoggedIn = username != null ? (!username.equalsIgnoreCase("anonymousUser")) : false;
		if(isLoggedIn) {
			model.addObject("isLoggedIn", isLoggedIn);
		}
				
		model.setViewName("about");
		return model;

	}
	
	@RequestMapping(value = { "/app/visualizations**"}, method = RequestMethod.GET)
	public ModelAndView visualizationsPage() {

		ModelAndView model = new ModelAndView();
		
		// Find if user is logged-in. If he is, pass that info to jsp page
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication != null ? authentication.getName() : null;
		boolean isLoggedIn = username != null ? (!username.equalsIgnoreCase("anonymousUser")) : false;
		if(isLoggedIn) {
			model.addObject("isLoggedIn", isLoggedIn);
		}
		
		model.setViewName("visualizations");
		return model;

	}

	@RequestMapping(value = {"/app/genre**"}, method = RequestMethod.GET)
	public ModelAndView adminPage(@RequestParam(value = "genre", required = false) String genre) {

		ModelAndView model = new ModelAndView();
		model.addObject("title", pageTitle);
		model.addObject("message", pageMessage);
		model.addObject("projectBy", projByString);
		Collection<MovieInfo> movieList = movieRecoService.getAllMovies(); 
		model.addObject("movieList", movieList);
		model.addObject("genre",genre);
		
		// If genre is specified, also show the recommend movies list
		if(genre != null && !genre.isEmpty()) {
			Collection<MovieInfo> topMovieList = movieRecoService.getTopMoviesByGenre(genre); 
			model.addObject("topMovieList", topMovieList);
			// Scine genre is specified in url, set a flag indicating same,
			// so on the jsp we know that we need to show the carousel div.
			model.addObject("showCarousel", "true");
		}
		
		// Find if user is logged-in. If he is, pass that info to jsp page
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication != null ? authentication.getName() : null;
		boolean isLoggedIn = username != null ? (!username.equalsIgnoreCase("anonymousUser")) : false;
		if(isLoggedIn) {
			model.addObject("isLoggedIn", isLoggedIn);
		}
		
		model.setViewName("genre");

		return model;
	}
	
	@RequestMapping(value = {"/app/top-movies**"}, method = RequestMethod.GET)
	public ModelAndView topMoviesPage(@RequestParam("genre") String genre) {

		ModelAndView model = new ModelAndView();
		model.addObject("title", pageTitle);
		model.addObject("message", pageMessage);
		model.addObject("projectBy", projByString);
		model.addObject("genre", genre);
		Collection<MovieInfo> movieList = movieRecoService.getTopMoviesByGenre(genre); 
		model.addObject("movieList", movieList);
		model.setViewName("top-movies");

		return model;
	}
	
	@RequestMapping(value = {"/app/watch-movie**"}, method = RequestMethod.GET)
	public ModelAndView watchMoviePage(@RequestParam("movie-id") Integer movieId) {

		ModelAndView model = new ModelAndView();
		model.addObject("title", pageTitle);
		model.addObject("message", pageMessage);
		model.addObject("projectBy", projByString);
		model.addObject("movieId", movieId);
		
		// Verify if movieId is there, else redirect to warning page
		if(movieId == null || movieId < 0) {
			model.addObject("errorMsg", "Pelase select a Genre to watch a movie. Please Press 'BACK' button to go back");
			model.setViewName("select-movie-warning");
			return model;
		}
		
		// Find info about the movie user wants to watch.
		MovieInfo movieInfo = movieRecoService.findMovieById(movieId);
		String movieName = movieInfo != null ? movieInfo.getName() : "";
		model.addObject("movie", movieName);
		
		// Find list of movies we want to recommend user (k-means based recommendation).
		Collection<MovieInfo> recoMovieInfoList = movieRecoService.getRecommendedMovies(movieId, MAX_RECO_MOVIES);
		model.addObject("recoMovies", recoMovieInfoList);
		
		// Find logged-in user and mark movie mark viewed in database.
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication != null ? authentication.getName() : "anonymous";
        boolean insertRecordSuccess = movieRecoService.markMovieWatchedForUser(username, movieId);
        model.addObject("isMarkedWatched", insertRecordSuccess);
        
        // Find list of movies we want to suggest to user (content-based suggestion).
        Collection<MovieInfo> suggestedMovieInfoList = movieRecoService.getSuggestedMovies(username, MAX_SUGGEST_MOVIES);
        model.addObject("suggestedMovies", suggestedMovieInfoList);
        
		// Find if user is logged-in. If he is, pass that info to jsp page
		String myUsername = authentication != null ? authentication.getName() : null;
		boolean isLoggedIn = myUsername != null ? (!myUsername.equalsIgnoreCase("anonymousUser")) : false;
		if(isLoggedIn) {
			model.addObject("isLoggedIn", isLoggedIn);
		}
        
        model.setViewName("watch-movie");
		return model;
	}
	
	@RequestMapping(value = {"/app/suggested-movie**"}, method = RequestMethod.GET)
	public ModelAndView suggestMoviePage() {
		
		ModelAndView model = new ModelAndView();
		
		// Find logged-in user 
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication != null ? authentication.getName() : "anonymous";
		
		// Find list of movies we want to suggest to user (content-based suggestion).
        Collection<MovieInfo> suggestedMovieInfoList = movieRecoService.getSuggestedMovies(username, MAX_SUGGEST_MOVIES);
        model.addObject("suggestedMovies", suggestedMovieInfoList);
        
        // Find if user is logged-in. If he is, pass that info to jsp page
        String myUsername = authentication != null ? authentication.getName() : null;
        boolean isLoggedIn = myUsername != null ? (!myUsername.equalsIgnoreCase("anonymousUser")) : false;
        if(isLoggedIn) {
        	model.addObject("isLoggedIn", isLoggedIn);
        }

        model.setViewName("suggested-movie");
        return model;
	}
	
	@RequestMapping(value = {"/signup**"}, method = RequestMethod.GET)
	public ModelAndView getSignUpPage(@RequestParam(value = "error-msg", required = false) String errorMsg) {

		ModelAndView model = new ModelAndView();
		model.addObject("title", pageTitle);
		model.addObject("message", pageMessage);
		model.addObject("projectBy", projByString);
		model.setViewName("signup");
		
		if(errorMsg != null && !errorMsg.isEmpty()) {
			model.addObject("errorMsg", errorMsg);
		}

		return model;
	}
	
	@RequestMapping(value = {"/signup**"}, method = RequestMethod.POST)
	public String postSignUpPage(HttpServletRequest request, 
	        HttpServletResponse response) {
		
		String errorMsg = "";

		ModelAndView model = new ModelAndView();
		model.addObject("title", pageTitle);
		model.addObject("message", pageMessage);
		model.addObject("projectBy", projByString);
		model.setViewName("signup");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPass = request.getParameter("confirmPass");
		String termsAccepted = request.getParameter("termsCheckbox");
		
		// Check if user has accepted the terms of use
		if(termsAccepted == null || !termsAccepted.equals("on")) {
			errorMsg = "Please Accept the Terms of Use!";
			// redirect to signup page again, with error msg.
			return "redirect:signup?error-msg="+errorMsg;
		}
		
		// Check if none of the above fields are null or empty
		if(username == null || username.isEmpty() ||
		   password == null || password.isEmpty() ||
		   confirmPass == null || confirmPass.isEmpty()) {
			model.addObject("errorMsg","One or more fields are empty!");
			errorMsg = "One or more fields are empty!";
			
			// redirect to signup page again, with error msg.
			return "redirect:signup?error-msg="+errorMsg;
		}
		
		// Check if password is same as confirmed password
		if(!password.equals(confirmPass)) {
			model.addObject("errorMsg","Both passwords should match!");
			errorMsg = "Both passwords should match!";
			
			// redirect to signup page again, with error msg.
			return "redirect:signup?error-msg="+errorMsg;
		}
		
		// Check if username already exists
		User existingUser = movieRecoService.getUser(username);
		if(existingUser != null) {
			errorMsg = "Username already exists. Please choose another name.";
			// redirect to signup page again, with error msg.
			return "redirect:signup?error-msg="+errorMsg;
		}
		
		// Since validations passed, create user account in database.
		User newUser = movieRecoService.createUser(username, password);
		
		// Redirect to genre page since user is now registered.
		return "redirect:/app/genre";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

}