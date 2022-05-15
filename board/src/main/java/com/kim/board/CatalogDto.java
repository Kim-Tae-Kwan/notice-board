package com.kim.board;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CatalogDto {
	private int id;
	private String name;
	
	public CatalogDto(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setName(rs.getNString("name"));
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
