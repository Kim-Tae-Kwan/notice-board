package com.kim.board;

import java.sql.*;
import java.util.*;

public class PostService {
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public ArrayList<PostDto> getAll() throws SQLException {

		String sql = "SELECT * FROM post order by create_date desc";
		ArrayList<PostDto> list = new ArrayList<PostDto>();
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PostDto post = new PostDto(rs);
				list.add(post);
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
	
	public ArrayList<PostDto> getAllBycatalogIdAndPage(int catalogId, int page) throws SQLException {
		String sql = "SELECT * FROM post where catalog_id = "
						+ catalogId + " order by create_date desc limit "
						+ (page - 1) * 5 + ",5";
		ArrayList<PostDto> list = new ArrayList<PostDto>();
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PostDto post = new PostDto(rs);
				list.add(post);
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
	
	public ArrayList<PostDto> getByPage(int page) throws SQLException {
		
		String sql = "SELECT * FROM post order by create_date desc limit "
						+ (page - 1) * 5 + ",5"; 
		ArrayList<PostDto> list = new ArrayList<PostDto>();
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PostDto post = new PostDto(rs);
				list.add(post);
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

	public PostDto getById(int postId) throws SQLException {

		String sql = "SELECT * FROM post where id=" + postId;
		PostDto post = null;
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				post = new PostDto(rs);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return post;
	}
	
	public void insert(PostDto post) throws SQLException {
		
		String sql = "insert into post (user_id, title, create_date, content, catalog_id) values("
						  + post.getUserId() + ",'" + post.getTitle() + "',now(),'" + post.getContent()
						  + "'," + post.getCatalogId() + ")";
		 
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

	public void update(PostDto post) throws SQLException {
		String sql = "UPDATE post SET title = '" + post.getTitle()
						+ "', content='" + post.getContent() + "' WHERE id = " + post.getId(); 
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

	public void deleteById(int postId) throws SQLException {

		String sql = "DELETE FROM post WHERE id =" + postId;
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
	
	public int getPageCount() throws SQLException {
		String sql = "SELECT COUNT(*) FROM post";
		int count = 0;
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				count = (int) Math.ceil(rs.getInt(1) / 5.0);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return count;
	}
}
