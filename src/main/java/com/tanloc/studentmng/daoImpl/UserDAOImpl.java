package com.tanloc.studentmng.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tanloc.studentmng.dao.UserDAO;
import com.tanloc.studentmng.model.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		Session session = getCurrentSession();
		User user = (User) session.get(User.class, id);
		session.delete(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		List<User> list = getCurrentSession().createCriteria(User.class).list();
		return list;
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		User user = (User) getCurrentSession().get(User.class, id);
		return user;
	}

	public Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}
}
