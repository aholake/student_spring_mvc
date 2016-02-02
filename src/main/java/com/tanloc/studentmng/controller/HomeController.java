package com.tanloc.studentmng.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tanloc.studentmng.model.User;
import com.tanloc.studentmng.service.StudentService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private StudentService studentService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		return new ModelAndView("home", "userForm", new User());
	}

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public ModelAndView manage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("manage-page");
		return model;
	}
}
