package edu.sjsu.cmpe.datamining.model;

import java.util.ArrayList;
import java.util.List;

public class MovieInfo {
	
	private Integer id;
	private String name;
	private String releaseDate;
	private String movieLink;
	private Integer genreUnknown;
	private Integer genreAction;
	private Integer genreAdventure;
	private Integer genreAnimation;
	private Integer genreChildrens;
	private Integer genreComedy;
	private Integer genreCrime;
	private Integer genreDocumentary;
	private Integer genreDrama;
	private Integer genreFantasy;
	private Integer genreFilmNoir;
	private Integer genreHorror;
	private Integer genreMusical;
	private Integer genreMystery;
	private Integer genreRomance;
	private Integer genreSciFi;
	private Integer genreThriller;
	private Integer genreWar;
	private Integer genreWestern;
	private Float avgRating;
	
	
	public MovieInfo() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getMovieLink() {
		return movieLink;
	}
	public void setMovieLink(String movieLink) {
		this.movieLink = movieLink;
	}
	public Integer getGenreUnknown() {
		return genreUnknown;
	}
	public void setGenreUnknown(Integer genreUnknown) {
		this.genreUnknown = genreUnknown;
	}
	public Integer getGenreAction() {
		return genreAction;
	}
	public void setGenreAction(Integer genreAction) {
		this.genreAction = genreAction;
	}
	public Integer getGenreAdventure() {
		return genreAdventure;
	}
	public void setGenreAdventure(Integer genreAdventure) {
		this.genreAdventure = genreAdventure;
	}
	public Integer getGenreAnimation() {
		return genreAnimation;
	}
	public void setGenreAnimation(Integer genreAnimation) {
		this.genreAnimation = genreAnimation;
	}
	public Integer getGenreChildrens() {
		return genreChildrens;
	}
	public void setGenreChildrens(Integer genreChildrens) {
		this.genreChildrens = genreChildrens;
	}
	public Integer getGenreComedy() {
		return genreComedy;
	}
	public void setGenreComedy(Integer genreComedy) {
		this.genreComedy = genreComedy;
	}
	public Integer getGenreCrime() {
		return genreCrime;
	}
	public void setGenreCrime(Integer genreCrime) {
		this.genreCrime = genreCrime;
	}
	public Integer getGenreDocumentary() {
		return genreDocumentary;
	}
	public void setGenreDocumentary(Integer genreDocumentary) {
		this.genreDocumentary = genreDocumentary;
	}
	public Integer getGenreDrama() {
		return genreDrama;
	}
	public void setGenreDrama(Integer genreDrama) {
		this.genreDrama = genreDrama;
	}
	public Integer getGenreFantasy() {
		return genreFantasy;
	}
	public void setGenreFantasy(Integer genreFantasy) {
		this.genreFantasy = genreFantasy;
	}
	public Integer getGenreFilmNoir() {
		return genreFilmNoir;
	}
	public void setGenreFilmNoir(Integer genreFilmNoir) {
		this.genreFilmNoir = genreFilmNoir;
	}
	public Integer getGenreHorror() {
		return genreHorror;
	}
	public void setGenreHorror(Integer genreHorror) {
		this.genreHorror = genreHorror;
	}
	public Integer getGenreMusical() {
		return genreMusical;
	}
	public void setGenreMusical(Integer genreMusical) {
		this.genreMusical = genreMusical;
	}
	public Integer getGenreMystery() {
		return genreMystery;
	}
	public void setGenreMystery(Integer genreMystery) {
		this.genreMystery = genreMystery;
	}
	public Integer getGenreRomance() {
		return genreRomance;
	}
	public void setGenreRomance(Integer genreRomance) {
		this.genreRomance = genreRomance;
	}
	public Integer getGenreSciFi() {
		return genreSciFi;
	}
	public void setGenreSciFi(Integer genreSciFi) {
		this.genreSciFi = genreSciFi;
	}
	public Integer getGenreThriller() {
		return genreThriller;
	}
	public void setGenreThriller(Integer genreThriller) {
		this.genreThriller = genreThriller;
	}
	public Integer getGenreWar() {
		return genreWar;
	}
	public void setGenreWar(Integer genreWar) {
		this.genreWar = genreWar;
	}
	public Integer getGenreWestern() {
		return genreWestern;
	}
	public void setGenreWestern(Integer genreWestern) {
		this.genreWestern = genreWestern;
	}
	public Float getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(Float avgRating) {
		this.avgRating = avgRating;
	}
	
	/**
	 * Return the Genres to which this movie belongs
	 * @return
	 */
	public List<String> getGenres() {
		List<String> genres = new ArrayList<String>();
		if(genreAction == 1) genres.add("Action");
		if(genreAdventure == 1) genres.add("Adventure");
		if(genreAnimation == 1) genres.add("Animation");
		if(genreChildrens == 1) genres.add("Childrens");
		if(genreComedy == 1) genres.add("Comedy");
		if(genreCrime == 1) genres.add("Crime");
		if(genreDocumentary == 1) genres.add("Documentary");
		if(genreDrama == 1) genres.add("Drama");
		if(genreFantasy == 1) genres.add("Fantasy");
		if(genreFilmNoir == 1) genres.add("FilmNoir");
		if(genreHorror == 1) genres.add("Horror");
		if(genreMusical == 1) genres.add("Musical");
		if(genreMystery == 1) genres.add("Mystery");
		if(genreRomance == 1) genres.add("Romance");
		if(genreSciFi == 1) genres.add("SciFi");
		if(genreThriller == 1) genres.add("Thriller");
		if(genreWar == 1) genres.add("War");
		if(genreWestern == 1) genres.add("Western");
		
		return genres;
	}
}
