package com.kim.board;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserService {
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public ArrayList<UserDto> getAll() throws SQLException {

		String sql = "SELECT * FROM user order by id desc";
		ArrayList<UserDto> list = new ArrayList<UserDto>();
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserDto user = new UserDto(rs);
				list.add(user);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	public UserDto getById(int userId) throws SQLException {

		String sql = "SELECT * FROM user where id=" + userId;
		UserDto user = null;
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				user = new UserDto(rs);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return user;
	}

	public UserDto login(UserDto user) throws SQLException {

		try {
			String sql = "select * from user where email='" + user.getEmail() + "' and password='" + user.getPassword()
					+ "'";
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
			}
			return user;
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public void sign(UserDto user) throws SQLException {
		
		String sql = "INSERT INTO user (email, password, name) VALUES ('"
						+ user.getEmail() + "', '" + user.getPassword() + "', '"
						+ user.getName() + "')"; 

		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}
}
