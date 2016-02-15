package com.tanloc.studentmng.controller;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView manage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		if(request.getSession().getAttribute("user") == null) {
			model.setViewName("redirect:/");
		} else {
			model.setViewName("manage-page");
		}
		return model;
	}
}
