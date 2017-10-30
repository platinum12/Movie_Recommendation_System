package edu.sjsu.cmpe.datamining.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;

import edu.sjsu.cmpe.datamining.model.MovieInfo;
import edu.sjsu.cmpe.datamining.model.MovieRatingComparator;
import edu.sjsu.cmpe.datamining.model.UserMovies;

public class MovieInfoDaoImpl implements MovieInfoDao {
	
	private SessionFactory sessionFactory;
	
	@Override
	@SuppressWarnings("unchecked")
	public Collection<MovieInfo> findAllMovies() {
		List<MovieInfo> movies = new ArrayList<MovieInfo>();
		
		movies = getSessionFactory().getCurrentSession().createQuery("from MovieInfo").list();
		return movies;
	}

	@Override
	@SuppressWarnings("unchecked")
	public Collection<MovieInfo> findAllMoviesByName(String movieName) {
		List<MovieInfo> movies = new ArrayList<MovieInfo>();
		
		movies = getSessionFactory().getCurrentSession().createQuery("from MovieInfo where name=?")
				.setParameter(0, movieName).list();
		return movies;
	}

	@SuppressWarnings("unchecked")
	@Override
	public MovieInfo findMovieById(Integer movieId) {
		MovieInfo movieInfo = null;
		List<MovieInfo> movies = getSessionFactory().getCurrentSession().createQuery("from MovieInfo where id=?")
				.setParameter(0, movieId).list();
		if(movies != null && !movies.isEmpty()) {
			movieInfo = movies.get(0);
		}
		return movieInfo;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MovieInfo> getAllFromMovieIds(List<Integer> movieIds) {
		if(movieIds == null || movieIds.isEmpty()) {
			return Collections.emptyList();
		}
		List<MovieInfo> records = new ArrayList<MovieInfo>();
		
		String movieIdsStr = movieIds.toString();
		String movieIdsInCsv = movieIdsStr.replace("[", "(").replace("]", ")");
		String query = "from MovieInfo where id in " + movieIdsInCsv + " order by avgRating DESC ";
		records = getSessionFactory().getCurrentSession().createQuery(query).list();
		
		return (List<MovieInfo>) (records != null ? records : Collections.emptyList());
	}

	@Override
	public Collection<MovieInfo> findAllMoviesByGenre(String genre) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<MovieInfo> findTopMoviesByGenre(List<String> genres, int listSize) {
		Set<MovieInfo> topMovies = new HashSet<MovieInfo>();
		if(genres == null || genres.isEmpty()) {
			return Collections.emptyList();
		}
		
		// Collect max 'listSize' movies from all the Genres.
		for(String curGenre : genres) {
			List<MovieInfo> moviesForGenre = (List<MovieInfo>) findTopMoviesByGenre(curGenre, listSize);
			topMovies.addAll(moviesForGenre);
		}
		
		List<MovieInfo> topMovieList = new ArrayList<MovieInfo>(topMovies);
		
		// Sort them (DESC) by avgRating.
		Collections.sort(topMovieList, new MovieRatingComparator(true/*reverse order*/));
		
		// return the first 'listSize' number of movies.
		return topMovieList.subList(0, topMovieList.size()>listSize ? listSize : topMovieList.size());
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Collection<MovieInfo> findTopMoviesByGenre(String genre, int listSize) {
		List<MovieInfo> topMovies = new ArrayList<MovieInfo>();
		
		genre = genre.toLowerCase();
		String whereCondition = "";
		switch(genre) {
		case "action":
			whereCondition = "genreAction = 1";
			break;
		case "adventure":
			whereCondition = "genreAdventure = 1";
			break;
		case "animation":
			whereCondition = "genreAnimation = 1";
			break;
		case "childrens":
			whereCondition = "genreChildrens = 1";
			break;
		case "comedy":
			whereCondition = "genreComedy = 1";
			break;
		case "crime":
			whereCondition = "genreCrime = 1";
			break;
		case "documentary":
			whereCondition = "genreDocumentary = 1";
			break;
		case "drama":
			whereCondition = "genreDrama = 1";
			break;
		case "fantasy":
			whereCondition = "genreFantasy = 1";
			break;
		case "filmnoir":
			whereCondition = "genreFilmNoir = 1";
			break;
		case "horror":
			whereCondition = "genreHorror = 1";
			break;
		case "musical":
			whereCondition = "genreMusical = 1";
			break;
		case "mystery":
			whereCondition = "genreMystery = 1";
			break;
		case "romance":
			whereCondition = "genreRomance = 1";
			break;
		case "scifi":
			whereCondition = "genreSciFi = 1";
			break;
		case "thriller":
			whereCondition = "genreThriller = 1";
			break;
		case "war":
			whereCondition = "genreWar = 1";
			break;
		case "western":
			whereCondition = "genreWestern = 1";
			break;
		default:
			whereCondition = "1 = 0";
			break;
		}
		String query = "from MovieInfo where " + whereCondition + " order by avgRating DESC ";
		topMovies = getSessionFactory().getCurrentSession().createQuery(query).setMaxResults(listSize).list();
		return (Collection<MovieInfo>) (topMovies != null ? topMovies : Collections.emptyList());
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
