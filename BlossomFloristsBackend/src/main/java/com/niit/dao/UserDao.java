package com.niit.dao;

import com.niit.model.User;

public interface UserDao {
	
	public void insertUser(User user);
	public User getUserByUserId(String email);
	public boolean checkUserExistence(String email);
}
