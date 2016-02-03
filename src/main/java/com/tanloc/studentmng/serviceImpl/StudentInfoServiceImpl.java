package com.tanloc.studentmng.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tanloc.studentmng.dao.StudentInfoDAO;
import com.tanloc.studentmng.model.StudentInfo;
import com.tanloc.studentmng.service.StudentInfoService;

@Service
@Transactional
public class StudentInfoServiceImpl implements StudentInfoService {
	@Autowired
	private StudentInfoDAO studentInfoDAO;

	@Override
	public void saveOrUpdateStudentInfo(StudentInfo studentInfo) {
		studentInfoDAO.saveOrUpdateStudentInfo(studentInfo);
	}

	@Override
	public StudentInfo getStudentInfoById(int id) {
		return studentInfoDAO.getStudentInfoById(id);
	}

	@Override
	public List<StudentInfo> getStudentInfoList() {
		return studentInfoDAO.getStudentInfoList();
	}

	@Override
	public void deleteStudentInfo(int id) {
		studentInfoDAO.deleteStudentInfo(id);
	}
}
