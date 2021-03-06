package com.kim.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class DBConnect {
	private static Connection conn;
	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/kim";
	private static String user = "user01";
	private static String password = "1234";
	private static Logger log = Logger.getLogger("com.bit.util.DBServer");
	
	private DBConnect() {}
	
	public static void setUrl(String url) {
		DBConnect.url = url;
	}
	
	public static Connection getConnection() throws SQLException {
		
		if(conn == null || conn.isClosed()) {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				log.error("드라이버 라이브러리 확인할 것!");
			}
			conn = DriverManager.getConnection(url , user, password);
		}
		
		return conn;
	}
}
