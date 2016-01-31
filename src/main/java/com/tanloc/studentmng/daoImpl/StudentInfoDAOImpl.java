package com.tanloc.studentmng.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tanloc.studentmng.dao.StudentInfoDAO;
import com.tanloc.studentmng.model.StudentInfo;

@Repository
@Transactional
public class StudentInfoDAOImpl implements StudentInfoDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addStudentInfo(StudentInfo studentInfo) {
		// TODO Auto-generated method stub
		this.getCurrentSession().saveOrUpdate(studentInfo);
	}

	@Override
	public StudentInfo getStudentInfoById(int id) {
		StudentInfo studentInfo = (StudentInfo) this.getCurrentSession().get(StudentInfo.class, id);
		return studentInfo;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<StudentInfo> getStudentInfoList() {
		List<StudentInfo> list = this.getCurrentSession().createCriteria(StudentInfo.class).list();
		return list;
	}

	@Override
	public void deleteStudentInfo(int id) {
		Session session = this.getCurrentSession();
		StudentInfo studentInfo = (StudentInfo) session.get(StudentInfo.class, id);
		session.delete(studentInfo);
	}

	public Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}
}
