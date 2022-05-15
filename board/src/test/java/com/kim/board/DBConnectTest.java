package com.kim.board;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.junit.Test;

public class DBConnectTest {

	Logger log = Logger.getLogger(this.getClass());
	@Test
	public void test() throws SQLException {
		assertNotNull(DBConnect.getConnection());
		PostService postService = new PostService();
		ArrayList<PostDto> list = postService.getAll();
		log.info(list.size());
		
	}

}
