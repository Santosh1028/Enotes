package com.enotes.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseDB {
	private static Connection conn;

	public static Connection geConnection() throws ClassNotFoundException {

		if (conn == null) {
			try {

				Class.forName("com.mysql.cj.jdbc.Driver");

				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "root");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return conn;

	}

}
