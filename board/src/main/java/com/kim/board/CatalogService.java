package com.kim.board;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogService {
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	public ArrayList<CatalogDto> getAll() throws SQLException {

		String sql = "SELECT * FROM catalog order by id";
		ArrayList<CatalogDto> list = new ArrayList<CatalogDto>();
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CatalogDto catalog = new CatalogDto(rs);
				list.add(catalog);
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
	
	public CatalogDto getById(int userId) throws SQLException {

		String sql = "SELECT * FROM catalog where id=" + userId;
		CatalogDto catalog = null;
		try {
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				catalog = new CatalogDto(rs);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return catalog;
	}
	
	public void insert(String name) throws SQLException {
		String sql = "INSERT INTO catalog (name) VALUES ('"
						+ name + "')";
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
