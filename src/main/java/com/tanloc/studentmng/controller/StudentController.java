package com.tanloc.studentmng.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanloc.studentmng.model.Student;
import com.tanloc.studentmng.service.StudentService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/getStudentList")
	public @ResponseBody List<Student> getListStudent(@RequestParam("page") int page) {
		return this.studentService.getStudentList();
	}

	@RequestMapping(value = "/getStudent/{id}")
	public @ResponseBody Student getStudent(@PathVariable("id") int id) {
		Student student = this.studentService.getStudentById(id);
		return student;
	}
	
}
