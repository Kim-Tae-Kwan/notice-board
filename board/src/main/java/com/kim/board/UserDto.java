package com.kim.board;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDto {
	private int id;
	private String email;
	private String password;
	private String name;
	
	public UserDto() {}
	
	public UserDto(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setEmail(rs.getString("email"));
		setPassword(rs.getString("password"));
		setName(rs.getString("name"));
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
