package com.enotes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.enotes.pojo.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(User user) {
		boolean f = false;

		try {
			String query = "INSERT INTO `enotes`.`user` ( `name`, `email`, `password`) VALUES (?,?,?)";

			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());

			int i = psmt.executeUpdate();

			if (i == 1) {
				f = true;
			}

			else {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(User user) {
		User user2=null;

		try {
			String query = "select * from user where email=? and password=?";

			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getPassword());

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {
				user2 = new User();
				user2.setId(rs.getInt("id"));
				user2.setName(rs.getString("name"));
				user2.setEmail(rs.getString("email"));
				user2.setPassword(rs.getString("password"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user2;
	}
}
