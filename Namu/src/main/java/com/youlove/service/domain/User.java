package com.youlove.service.domain;

import java.sql.Date;

public class User {
	
	private int userCode;
	private String token;
	private String profileAuth;
	private String role;
	private String nickname;
	private String email;
	private String phone;
	private String name;
	private String password;
	private String birth;
	private String gender;
	private String profileImg;
	private String introduce;
	private Date regDate;
	private String startBlock;
	private String endBlock;
	//로그인시 판별위한 필드
	private String userId;
	//세션
	private String sessionNo;
	
	
	
	public String getSessionNo() {
		return sessionNo;
	}
	public void setSessionNo(String sessionNo) {
		this.sessionNo = sessionNo;
	}
	public User(int userCode) {
		this.userCode = userCode;
	}
	public User() {
	}
	
	
	
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getProfileAuth() {
		return profileAuth;
	}
	public void setProfileAuth(String profileAuth) {
		this.profileAuth = profileAuth;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(String startBlock) {
		this.startBlock = startBlock;
	}
	public String getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(String endBlock) {
		this.endBlock = endBlock;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "User [userCode=" + userCode + ", token=" + token + ", profileAuth=" + profileAuth + ", role=" + role
				+ ", nickname=" + nickname + ", email=" + email + ", phone=" + phone + ", name=" + name + ", password="
				+ password + ", birth=" + birth + ", gender=" + gender + ", profileImg=" + profileImg + ", introduce="
				+ introduce + ", regDate=" + regDate + ", startBlock=" + startBlock + ", endBlock=" + endBlock
				+ ", userId=" + userId + "]";
	}

	
	
}
