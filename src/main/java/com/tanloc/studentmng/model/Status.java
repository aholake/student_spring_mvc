package com.tanloc.studentmng.model;

public class Status {
	private boolean isError;
	private String message;

	public Status() {
		// TODO Auto-generated constructor stub
	}
	
	public Status(boolean isError, String message) {
		super();
		this.isError = isError;
		this.message = message;
	}

	public boolean isError() {
		return isError;
	}

	public void setError(boolean isError) {
		this.isError = isError;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}	
}
