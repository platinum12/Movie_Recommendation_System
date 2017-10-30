package edu.sjsu.cmpe.datamining.model;

import java.util.Comparator;

public class MovieRatingComparator implements Comparator<MovieInfo> {
	boolean reverseOrder = false;
	
	public MovieRatingComparator(boolean reverseOrder) {
		this.reverseOrder = reverseOrder;
	}
	 
    @Override
    public int compare(MovieInfo e1, MovieInfo e2) {
    	if(!reverseOrder) {
    		if(e1.getAvgRating() < e2.getAvgRating()){
	            return -1;
	        } else {
	            return 1;
	        }
    	}else {
    		if(e1.getAvgRating() < e2.getAvgRating()){
	            return 1;
	        } else {
	            return -1;
	        }
    	}
    }
}
