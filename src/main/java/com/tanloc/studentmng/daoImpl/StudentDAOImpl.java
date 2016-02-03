package com.tanloc.studentmng.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tanloc.studentmng.dao.StudentDAO;
import com.tanloc.studentmng.model.Student;

@Repository
@Transactional
public class StudentDAOImpl implements StudentDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveOrUpdateStudent(Student student) {
		this.getCurrentSession().saveOrUpdate(student);
	}

	@Override
	public Student getStudentById(int id) {
		Student student = (Student) this.getCurrentSession().get(Student.class, id);
		return student;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> getStudentList() {
		List<Student> list = this.getCurrentSession().createCriteria(Student.class).list();
		return list;
	}

	@Override
	public void deleteStudent(int id) {
		// TODO Auto-generated method stub
		Session session = this.getCurrentSession();
		Student student = (Student) this.getCurrentSession().get(Student.class, id);
		session.delete(student);
	}

	public Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}

}
