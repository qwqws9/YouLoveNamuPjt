package com.youlove.service.domain;

import java.sql.Date;

public class Planner {

	///Field
	private int plannerCode;
	private String plannerName;
	private String startDate;
	private String plannerImage;
	private User user;
	private int member;
	private int privacy;
	private int status;
	private int isGroup;
	private int boardCode;
	private Date regDate;
	
	public Planner() {
	}

	public int getPlannerCode() {
		return plannerCode;
	}

	public void setPlannerCode(int plannerCode) {
		this.plannerCode = plannerCode;
	}

	public String getPlannerName() {
		return plannerName;
	}

	public void setPlannerName(String plannerName) {
		this.plannerName = plannerName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getPlannerImage() {
		return plannerImage;
	}

	public void setPlannerImage(String plannerImage) {
		this.plannerImage = plannerImage;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public int getPrivacy() {
		return privacy;
	}

	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIsGroup() {
		return isGroup;
	}

	public void setIsGroup(int isGroup) {
		this.isGroup = isGroup;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Planner [plannerCode=" + plannerCode + ", plannerName=" + plannerName + ", startDate=" + startDate
				+ ", plannerImage=" + plannerImage + ", user=" + user + ", member=" + member + ", privacy=" + privacy
				+ ", status=" + status + ", isGroup=" + isGroup + ", boardCode=" + boardCode + ", regDate=" + regDate
				+ "]";
	}

}
