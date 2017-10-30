package edu.sjsu.cmpe.datamining.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import edu.sjsu.cmpe.datamining.dao.MovieInfoDao;
import edu.sjsu.cmpe.datamining.dao.MovieRecommendationDao;
import edu.sjsu.cmpe.datamining.dao.UserDao;
import edu.sjsu.cmpe.datamining.dao.UserMoviesDao;
import edu.sjsu.cmpe.datamining.model.MovieInfo;
import edu.sjsu.cmpe.datamining.model.MovieRatingComparator;
import edu.sjsu.cmpe.datamining.model.MovieRecommendation;
import edu.sjsu.cmpe.datamining.model.User;
import edu.sjsu.cmpe.datamining.model.UserMovies;

public class MovieRecoService {

	private UserDao userDao;
	private MovieInfoDao movieInfoDao;
	private UserMoviesDao userMoviesDao;
	private MovieRecommendationDao movieRecoDao;
	
	public Collection<MovieInfo> getAllMovies() {
		return movieInfoDao.findAllMovies();
	}
	
	public MovieInfo findMovieById(int movieId) {
		return movieInfoDao.findMovieById(movieId);
	}
	
	public Collection<MovieInfo> getTopMoviesByGenre(String genre) {
		int topMovieSize = 10;
		Collection<MovieInfo> topMovies = movieInfoDao.findTopMoviesByGenre(genre, topMovieSize);
		return topMovies;
	}
	
	public boolean markMovieWatchedForUser(String username, int movieId) {
		int recordsTouched = userMoviesDao.addIfNotExists(username, movieId);
		return (recordsTouched > 0);
	}
	
	/**
	 * Returns recommended movies for specified Movie (movieId)
	 * @param movieId
	 * @return
	 */
	public Collection<MovieInfo> getRecommendedMovies(int movieId, int maxResults) {
		List<MovieRecommendation> recoMovies = movieRecoDao.getRecommendedMovies(movieId, maxResults);
		List<Integer> recoMovieIds = new ArrayList<Integer>();
		for(MovieRecommendation curMovieReco : recoMovies) {
			recoMovieIds.add(curMovieReco.getRecoMovieId());
		}
		List<MovieInfo> movieInfoList = movieInfoDao.getAllFromMovieIds(recoMovieIds);
		return movieInfoList;
	}
	
	public Collection<MovieInfo> getSuggestedMovies(String username, int maxResults) {
		// Get upto maxResults of previous watched movies by given username.
		List<UserMovies> recentlyWatchedMovies = userMoviesDao.getRecentMoviesWatchedByUser(username, maxResults);
		
		// Collect movies in set first, to naturally remove the duplicates.
		Set<MovieInfo> suggestedMovies = new HashSet<MovieInfo>();
		
		// Collect all the top 'maxResults' movies of the Genre of previously watched movies and combine them into one set.
		for(UserMovies userMovie : recentlyWatchedMovies) {
			int movieId = userMovie.getMovieId();
			MovieInfo movie = movieInfoDao.findMovieById(movieId);
			List<String> movieGenres = movie.getGenres();
			List<MovieInfo> movies = (List<MovieInfo>) movieInfoDao.findTopMoviesByGenre(movieGenres, maxResults);
			suggestedMovies.addAll(movies);
		}
		
		// Form a list  of Set, for easy sorting etc.
		List<MovieInfo> suggestedMovieList = new ArrayList<MovieInfo>(suggestedMovies);
		
		// Sort above collection by their avgRating DESC order and get top 'maxResults' movies from it.
		Collections.sort(suggestedMovieList, new MovieRatingComparator(true/*reverse order*/));
		
		// Return the top 'maxResults' number of movies.
		List<MovieInfo> finalSuggestedMovies = null;
		if(suggestedMovieList.size() >= maxResults) {
			finalSuggestedMovies = suggestedMovieList.subList(0, maxResults);
		}else {
			finalSuggestedMovies = suggestedMovieList;
		}
		
		return finalSuggestedMovies;
	}
	
	public User getUser(String username) {
		User user = userDao.findByUserName(username);
		return user;
	}
	
	public User createUser(String username, String password) {
		User newUser = userDao.addNewUser(username, password);
		return newUser;
	}
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public MovieInfoDao getMovieInfoDao() {
		return movieInfoDao;
	}

	public void setMovieInfoDao(MovieInfoDao movieInfoDao) {
		this.movieInfoDao = movieInfoDao;
	}

	public UserMoviesDao getUserMoviesDao() {
		return userMoviesDao;
	}

	public void setUserMoviesDao(UserMoviesDao userMoviesDao) {
		this.userMoviesDao = userMoviesDao;
	}

	public MovieRecommendationDao getMovieRecoDao() {
		return movieRecoDao;
	}

	public void setMovieRecoDao(MovieRecommendationDao movieRecoDao) {
		this.movieRecoDao = movieRecoDao;
	}
	
}
