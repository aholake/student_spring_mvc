package com.tanloc.studentmng.service;

import java.util.List;

import com.tanloc.studentmng.model.Student;

public interface StudentService {
	public void saveOrUpdateStudent(Student student);

	public Student getStudentById(int id);

	public List<Student> getStudentList();

	public void deleteStudent(int id);
}
