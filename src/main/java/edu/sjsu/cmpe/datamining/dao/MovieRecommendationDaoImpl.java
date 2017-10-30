package edu.sjsu.cmpe.datamining.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.SessionFactory;

import edu.sjsu.cmpe.datamining.model.MovieRecommendation;

public class MovieRecommendationDaoImpl implements MovieRecommendationDao {

	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MovieRecommendation> getRecommendedMovies(int movieId, int maxResults) {
		List<MovieRecommendation> recoMovies = new ArrayList<MovieRecommendation>();

		recoMovies = getSessionFactory().getCurrentSession().createQuery("from MovieRecommendation where movieId=?")
				.setParameter(0, movieId).setMaxResults(maxResults).list();

		return (List<MovieRecommendation>) (recoMovies != null ? recoMovies : Collections.emptyList());
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
