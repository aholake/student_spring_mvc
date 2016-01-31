package com.tanloc.studentmng.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanloc.studentmng.model.TestModel;
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

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public @ResponseBody TestModel abc() {
		return new TestModel(10, "Vo Tan Loc");
	}
}
