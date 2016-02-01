package com.tanloc.studentmng.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tanloc.studentmng.dao.StudentDAO;
import com.tanloc.studentmng.model.Student;
import com.tanloc.studentmng.service.StudentService;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDAO studentDAO;

	@Override
	public void addStudent(Student student) {
		studentDAO.addStudent(student);
	}

	@Override
	public Student getStudentById(int id) {
		return studentDAO.getStudentById(id);
	}

	@Override
	public List<Student> getStudentList() {
		// TODO Auto-generated method stub
		return studentDAO.getStudentList();
	}

	@Override
	public void deleteStudent(int id) {
		studentDAO.deleteStudent(id);
	}
	
}
