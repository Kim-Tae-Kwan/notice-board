package com.kim.board;

public class Login {
	private int userId;
	private String userName = "";
	private Boolean result = false;
	
	public void init() {
		userId = 0;
		userName = "";
		result = false;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
}
