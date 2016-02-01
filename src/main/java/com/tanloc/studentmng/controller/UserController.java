package com.tanloc.studentmng.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tanloc.studentmng.model.Status;
import com.tanloc.studentmng.model.User;
import com.tanloc.studentmng.service.UserSevice;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserSevice userSevice;

	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
	public @ResponseBody User getUser(@PathVariable("id") int id) {
		return userSevice.getUserById(id);
	}

	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public ModelAndView checkLogin(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("userForm") User user) {
		ModelAndView model = new ModelAndView();
		if (userSevice.isExist(user)) {
			model.setViewName("redirect:/manage");
			request.getSession().setAttribute("user", user);
		} else {
			model.setViewName("home");
			model.addObject("status", new Status(true, "The password that you entered is not correct!"));
		}
		return model;
	}
}
