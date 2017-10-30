package edu.sjsu.cmpe.datamining.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.SessionFactory;

import edu.sjsu.cmpe.datamining.model.UserMovies;

public class UserMoviesDaoImpl implements UserMoviesDao {
	
	private SessionFactory sessionFactory;

	@Override
	public int addIfNotExists(String username, Integer movieId) {
		if(!checkIfExists(username, movieId)) {
			UserMovies userMovies = new UserMovies();
			userMovies.setUsername(username);
			userMovies.setMovieId(movieId);
			java.util.Date today = new java.util.Date();
			java.sql.Timestamp curTimestamp = new java.sql.Timestamp(today.getTime());
			userMovies.setWatchedOn(curTimestamp);
			getSessionFactory().getCurrentSession().save(userMovies);
			return 1;
		}
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	private boolean checkIfExists(String username, Integer movieId) {
		List<UserMovies> records = new ArrayList<UserMovies>();
		
		records = getSessionFactory().getCurrentSession().createQuery("from UserMovies where username=? AND movieId=?")
				.setParameter(0, username)
				.setParameter(1, movieId).list();
		return (records != null && !records.isEmpty());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UserMovies> getRecentMoviesWatchedByUser(String username, Integer maxResults) {
		List<UserMovies> records = null;
		
		records = getSessionFactory().getCurrentSession().createQuery("from UserMovies where username=? order by watchedOn DESC")
				.setParameter(0, username).setMaxResults(maxResults).list();
		
		return (List<UserMovies>) (records != null ? records : Collections.emptyList());
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
