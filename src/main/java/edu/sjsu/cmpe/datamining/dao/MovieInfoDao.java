package edu.sjsu.cmpe.datamining.dao;

import java.util.Collection;
import java.util.List;

import edu.sjsu.cmpe.datamining.model.MovieInfo;

public interface MovieInfoDao {
	Collection<MovieInfo> findAllMovies();
	Collection<MovieInfo> findAllMoviesByName(String movieName);
	MovieInfo findMovieById(Integer movieId);
	Collection<MovieInfo> findAllMoviesByGenre(String genre);
	Collection<MovieInfo> findTopMoviesByGenre(String genre, int listSize);
	Collection<MovieInfo> findTopMoviesByGenre(List<String> genres, int listSize);
	List<MovieInfo> getAllFromMovieIds(List<Integer> movieIds);
}
