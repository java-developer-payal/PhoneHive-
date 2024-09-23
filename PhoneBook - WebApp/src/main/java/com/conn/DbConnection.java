package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	private static Connection conn;
	public static Connection getConn(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phoneBook_database", "root", "P@y@l123");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
