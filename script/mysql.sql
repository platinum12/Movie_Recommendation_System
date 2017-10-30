CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(60) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
CREATE TABLE `movie_info` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `release_date` varchar(50) NOT NULL,
  `movie_link` varchar(1024) DEFAULT NULL,
  `genre_unknown` int(11) DEFAULT NULL,
  `genre_action` int(11) DEFAULT NULL,
  `genre_adventure` int(11) DEFAULT NULL,
  `genre_animation` int(11) DEFAULT NULL,
  `genre_childrens` int(11) DEFAULT NULL,
  `genre_comedy` int(11) DEFAULT NULL,
  `genre_crime` int(11) DEFAULT NULL,
  `genre_documentary` int(11) DEFAULT NULL,
  `genre_drama` int(11) DEFAULT NULL,
  `genre_fantasy` int(11) DEFAULT NULL,
  `genre_filmnoir` int(11) DEFAULT NULL,
  `genre_horror` int(11) DEFAULT NULL,
  `genre_musical` int(11) DEFAULT NULL,
  `genre_mystery` int(11) DEFAULT NULL,
  `genre_romance` int(11) DEFAULT NULL,
  `genre_scifi` int(11) DEFAULT NULL,
  `genre_thriller` int(11) DEFAULT NULL,
  `genre_war` int(11) DEFAULT NULL,
  `genre_western` int(11) DEFAULT NULL,
  `avg_rating` float NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
  
CREATE TABLE `movie_reco` (
  `movie_id` int(11) NOT NULL,
  `reco_movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1
  
CREATE  TABLE user_movies (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  movie_id int(11) NOT NULL,
  watched_on DATETIME NOT NULL,
  PRIMARY KEY (id));