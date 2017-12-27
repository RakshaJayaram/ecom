package com.niit.daoImpl;


import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.dao.UserDao;
import com.niit.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	static Logger log = Logger.getLogger(UserDaoImpl.class.getName());
	
	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	public UserDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	// Inserting User details into database
	@Transactional
	public void insertUser(User user) {
		log.info("Before inserting user");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.persist(user);
		session.getTransaction().commit();
		log.info("User inserted successfully");
	}

	public User getUserByUserId(String email) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		User user = null;
		try {
			transaction = session.getTransaction();
			transaction.begin();
			Query query = session.createQuery("from User where email='" + email + "'");
			user = (User) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}

	public boolean checkUserExistence(String email) {
		User user = getUserByUserId(email);
		if (user != null && user.getEmail().equals(email)) {
			return true;
		} else {
			return false;
		}
	}

}
