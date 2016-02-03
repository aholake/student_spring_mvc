package com.tanloc.studentmng.service;

import java.util.List;

import com.tanloc.studentmng.model.StudentInfo;

public interface StudentInfoService {
	public void saveOrUpdateStudentInfo(StudentInfo studentInfo);

	public StudentInfo getStudentInfoById(int id);

	public List<StudentInfo> getStudentInfoList();

	public void deleteStudentInfo(int id);
}
