package com.tanloc.studentmng.service;

import java.util.List;

import com.tanloc.studentmng.model.User;

public interface UserSevice {
	public void addUser(User user);

	public void deleteUser(int id);

	public List<User> getUserList();

	public User getUserById(int id);

	public boolean isExist(User user);
}
