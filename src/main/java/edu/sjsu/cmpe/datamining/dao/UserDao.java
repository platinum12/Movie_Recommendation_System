package edu.sjsu.cmpe.datamining.dao;

import edu.sjsu.cmpe.datamining.model.User;

public interface UserDao {

	User findByUserName(String username);
	User addNewUser(String username, String password);
}