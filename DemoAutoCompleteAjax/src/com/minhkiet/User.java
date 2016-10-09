package com.minhkiet;

import java.sql.Date;

public class User {
	private int userId;
	private String fullName;
	private int gender;
	private Date birthday;
	private String phoneNumber;
	private String address;
	private String username;
	private String password;
	private boolean role;
	private String avatar;
	
	public User(int userId, String fullName, int gender, Date birthday, String phoneNumber, String address,
			String username, String password, boolean role, String avatar) {
		this.userId = userId;
		this.fullName = fullName;
		this.gender = gender;
		this.birthday = birthday;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.username = username;
		this.password = password;
		this.role = role;
		this.avatar = avatar;
	}

	public User(String fullName, int gender, Date birthday, String phoneNumber, String address, String username,
			String password, boolean role, String avatar) {
		this.fullName = fullName;
		this.gender = gender;
		this.birthday = birthday;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.username = username;
		this.password = password;
		this.role = role;
		this.avatar = avatar;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", fullName=" + fullName + ", gender=" + gender + ", birthday=" + birthday
				+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", username=" + username + ", password="
				+ password + ", role=" + role + ", avatar=" + avatar + "]";
	}
}
