package edu.sjsu.cmpe.datamining.model;

import java.sql.Timestamp;

public class UserMovies {
	
	private Integer id;
	private String username;
	private Integer movieId;
	private Timestamp watchedOn;
	
	public UserMovies() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public Integer getMovieId() {
		return movieId;
	}
	
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public Timestamp getWatchedOn() {
		return watchedOn;
	}

	public void setWatchedOn(Timestamp watchedOn) {
		this.watchedOn = watchedOn;
	}
}
