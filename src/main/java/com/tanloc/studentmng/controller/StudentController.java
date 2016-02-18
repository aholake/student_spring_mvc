package com.tanloc.studentmng.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanloc.studentmng.model.Status;
import com.tanloc.studentmng.model.Student;
import com.tanloc.studentmng.model.StudentInfo;
import com.tanloc.studentmng.service.StudentInfoService;
import com.tanloc.studentmng.service.StudentService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	private StudentService studentService;

	@Autowired
	private StudentInfoService studentInfoService;

	@RequestMapping(value = "/getList")
	public @ResponseBody List<Student> getListStudent() {
		return this.studentService.getStudentList();
	}

	@RequestMapping(value = "/get/{id}")
	public @ResponseBody Student getStudent(@PathVariable("id") int id) {
		Student student = this.studentService.getStudentById(id);
		return student;
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Status saveOrUpdate(@RequestBody Student student) {
		logger.info("Save or Update: " + student.getStudentInfo());
		StudentInfo mInfo = student.getStudentInfo();
		mInfo.setStudent(student);
		student.setStudentInfo(mInfo);
		try {
			studentService.saveOrUpdateStudent(student);
			return new Status(false, null);
		} catch (Exception e) {
			return new Status(true, e.toString());
		}
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public @ResponseBody Status deleteStudent(@PathVariable("id") int id) {
		try {
			logger.info("ID: "+id);
			studentService.deleteStudent(id);
			return new Status(false, null);
		} catch (Exception e) {
			return new Status(true, e.toString());
		}
	}
}
