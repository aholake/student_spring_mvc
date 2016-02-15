package com.tanloc.studentmng.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class UserAspect {
	@Before("execution(* com.tanloc.studentmng.serviceImpl.UserServiceImpl.addUser(..))")
	public void addUserBefore() {
		System.out.println("Executing Add User");
	}

	@After("execution(* com.tanloc.studentmng.serviceImpl.UserServiceImpl.addUser(..))")
	public void addUserAfter() {
		System.out.println("Finished Add User");
	}

	@Before("execution(* com.tanloc.studentmng.serviceImpl.UserServiceImpl.deleteUser(..))")
	public void deleteUserBefore() {
		System.out.println("Executing deleteUser()");
	}

	@After("execution(* com.tanloc.studentmng.serviceImpl.UserServiceImpl.deleteUser(..))")
	public void deleteUserAfter() {
		System.out.println("Finished deleteUser()");
	}

	@Before("execution(* com.tanloc.studentmng.serviceImpl.UserServiceImpl.isExist(..))")
	public void isExistBefore() {
		System.out.println("Executing isExist()");
	}

	@After("execution(* com.tanloc.studentmng.serviceImpl.UserServiceImpl.isExist(..))")
	public void isExistAfter() {
		System.out.println("Finished isExist()");
	}
}
