package com.tanloc.studentmng.dao;

import java.util.List;

import com.tanloc.studentmng.model.User;

public interface UserDAO {
	public void addUser(User user);

	public void deleteUser(int id);

	public List<User> getUserList();

	public User getUserById(int id);

	public boolean isExist(User user);
}
