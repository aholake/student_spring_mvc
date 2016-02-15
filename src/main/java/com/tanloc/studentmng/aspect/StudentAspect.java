package com.tanloc.studentmng.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class StudentAspect {
	@Before("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.getStudentList())")
	public void getStudentListBefore(JoinPoint joinPoint) {
		System.out.println("getStudentList() is running");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("*****");
	}

	@After("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.getStudentList())")
	public void getStudentListAfter(JoinPoint joinPoint) {
		System.out.println("getStudentList() is finished");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("****");
	}

	@AfterReturning(pointcut = "execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.getStudentList())", returning = "result")
	public void getStudentListAfterReturning(JoinPoint joinPoint, Object result) {
		System.out.println("getStudentList() is running");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("Method returned value is : " + result);
		System.out.println("*****");
	}

	@Before("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.deleteStudent(..))")
	public void deleteStudentBefore(JoinPoint joinPoint) {
		System.out.println("deleteStudent() is running");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("****");
	}

	@After("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.deleteStudent())")
	public void deleteStudentAfter(JoinPoint joinPoint) {
		System.out.println("deleteStudent() is finished");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("****");
	}

	@Before("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.getStudentById(..))")
	public void getStudentByIdBefore(JoinPoint joinPoint) {
		System.out.println("getStudentById() is running");
		System.out.println(joinPoint.getSignature().getName());
		System.out.println("****");
	}

	@After("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.getStudentById(..))")
	public void getStudentByIdAfter(JoinPoint joinPoint) {
		System.out.println("Finished getStudentById()");
		System.out.println(joinPoint.getSignature().getName());
		System.out.println("****");
	}

	@AfterReturning(pointcut = "execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.getStudentById(..))", returning = "result")
	public void getStudentByIdAfterReturning(JoinPoint joinPoint, Object result) {
		System.out.println("getStudentById() is running");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("Method returned value is : " + result);
		System.out.println("*****");
	}

	@Before("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.saveOrUpdateStudent(..))")
	public void saveOrUpdateBefore(JoinPoint joinPoint) {
		System.out.println("Executing saveOrUpdateStudent()");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("****");
	}

	@Before("execution(* com.tanloc.studentmng.serviceImpl.StudentServiceImpl.saveOrUpdateStudent(..))")
	public void saveOrUpdateAfter(JoinPoint joinPoint) {
		System.out.println("Finished saveOrUpdateStudent(..)");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("****");
	}
}
