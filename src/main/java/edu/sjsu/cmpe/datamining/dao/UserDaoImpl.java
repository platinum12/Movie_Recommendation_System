package edu.sjsu.cmpe.datamining.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.SessionFactory;

import edu.sjsu.cmpe.datamining.model.User;
import edu.sjsu.cmpe.datamining.model.UserRole;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();

		users = getSessionFactory().getCurrentSession().createQuery("from User where username=?")
				.setParameter(0, username).list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}
	
	public User addNewUser(String username, String password) {
		String encPassword = null;
		
		encPassword = DigestUtils.md5Hex(password);
		User newUser = new User();
		newUser.setEnabled(true);
		newUser.setUsername(username);
		newUser.setPassword(encPassword);
		getSessionFactory().getCurrentSession().save(newUser);
		
		Set<UserRole> roles = new HashSet<UserRole>();
		// Add admin and user roles for this new user.
		UserRole adminRole = new UserRole();
		adminRole.setRole("ROLE_ADMIN");
		adminRole.setUser(newUser);
		getSessionFactory().getCurrentSession().save(adminRole);
		roles.add(adminRole);
		
		// Add admin and user roles for this new user.
		UserRole userRole = new UserRole();
		userRole.setRole("ROLE_USER");
		userRole.setUser(newUser);
		getSessionFactory().getCurrentSession().save(userRole);
		roles.add(userRole);
		return newUser;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}