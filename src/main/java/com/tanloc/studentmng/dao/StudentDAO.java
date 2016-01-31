package com.tanloc.studentmng.dao;

import java.util.List;

import com.tanloc.studentmng.model.Student;

public interface StudentDAO {
	public void addStudent(Student student);

	public Student getStudentById(int id);

	public List<Student> getStudentList();

	public void deleteStudent(int id);
}
