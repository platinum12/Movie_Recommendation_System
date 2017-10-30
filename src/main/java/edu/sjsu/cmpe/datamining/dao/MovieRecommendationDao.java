package edu.sjsu.cmpe.datamining.dao;

import java.util.List;

import edu.sjsu.cmpe.datamining.model.MovieRecommendation;

public interface MovieRecommendationDao {
	
	List<MovieRecommendation> getRecommendedMovies(int movieId, int maxResults);
}
