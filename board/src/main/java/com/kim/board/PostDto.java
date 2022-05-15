package com.kim.board;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PostDto {
	private int id;
	private int userId;
	private String title;
	private String createDate;
	private String deleteDate;
	private String content;
	private int catalogId;
	
	public PostDto(){}
	
	public PostDto(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setUserId(rs.getInt("user_id"));
		setTitle(rs.getString("title"));
		setCreateDate(rs.getString("create_date"));
		setDeleteDate(rs.getString("delete_date"));
		setContent(rs.getString("content"));
		setCatalogId(rs.getInt("catalog_id"));
	}
	
	public int getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
