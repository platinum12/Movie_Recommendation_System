package edu.sjsu.cmpe.datamining.model;

public class MovieRecommendation {
	
	private Integer id;
	private Integer movieId;
	private Integer recoMovieId;
	
	public MovieRecommendation() {
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public Integer getRecoMovieId() {
		return recoMovieId;
	}

	public void setRecoMovieId(Integer recoMovieId) {
		this.recoMovieId = recoMovieId;
	}
}
