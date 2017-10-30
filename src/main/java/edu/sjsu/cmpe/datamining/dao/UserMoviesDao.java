package edu.sjsu.cmpe.datamining.dao;

import java.util.List;

import edu.sjsu.cmpe.datamining.model.UserMovies;

public interface UserMoviesDao {
	int addIfNotExists(String username, Integer movieId);
	List<UserMovies> getRecentMoviesWatchedByUser(String username, Integer maxResults);
}
