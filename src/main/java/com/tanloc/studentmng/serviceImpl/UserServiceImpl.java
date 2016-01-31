package com.tanloc.studentmng.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tanloc.studentmng.dao.UserDAO;
import com.tanloc.studentmng.model.User;
import com.tanloc.studentmng.service.UserSevice;

@Service
@Transactional
public class UserServiceImpl implements UserSevice {
	@Autowired
	private UserDAO userDAO;

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDAO.addUser(user);
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		userDAO.deleteUser(id);
	}

	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return userDAO.getUserList();
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return userDAO.getUserById(id);
	}

	@Override
	public boolean isExist(User user) {
		// TODO Auto-generated method stub
		return userDAO.isExist(user);
	}
}
