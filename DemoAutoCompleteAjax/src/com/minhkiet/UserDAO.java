package com.minhkiet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;
	
	private ArrayList<User> users= null;
	private User user = null;
	
	public ArrayList<User> getAllUsers() {
		users = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllUsers()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				User user = new User(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9), rs.getString(10));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return users;
	}
	
	public User getUserById(int userId) {
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getUserById(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9), rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return user;
	}
	
	public int insertUser(User user) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_insertUser(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, user.getFullName());
			cstmt.setInt(2, user.getGender());
			cstmt.setDate(3, user.getBirthday());
			cstmt.setString(4, user.getPhoneNumber());
			cstmt.setString(5, user.getAddress());
			cstmt.setString(6, user.getUsername());
			cstmt.setString(7, user.getPassword());
			cstmt.setBoolean(8, user.getRole());
			cstmt.setString(9, user.getAvatar());
			result = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return result;
	}
	
	public int updateUser(User user) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_updateUser(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, user.getUserId());
			cstmt.setString(2, user.getFullName());
			cstmt.setInt(3, user.getGender());
			cstmt.setDate(4, user.getBirthday());
			cstmt.setString(5, user.getPhoneNumber());
			cstmt.setString(6, user.getAddress());
			cstmt.setString(7, user.getUsername());
			cstmt.setString(8, user.getPassword());
			cstmt.setBoolean(9, user.getRole());
			cstmt.setString(10, user.getAvatar());
			result = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return result;
	}
	
	public int deleteUser(int userId) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_deleteUser(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			result = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return result;
	}

	public User getUserByUsernamePassword(String username, String password) {
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getUserByUsernamePassword(?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, username);
			cstmt.setString(2, password);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9), rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return user;
	}
	
	public User getUserByUsername(String username) {
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getUserByUsername(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, username);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9), rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return user;
	}
	
	public ArrayList<User> searchUser(String keyword) {
		users = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_searchUser(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, keyword);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				User user = new User(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9), rs.getString(10));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return users;
	}
	
	
}
