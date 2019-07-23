package com.youlove.service.domain;

import java.sql.Date;

public class Planner {

	///Field
	private int plannerCode;
	private int plannerVer;
	private String plannerName;
	private String departDate;
	private String plannerImage;
	private User plannerWriter;
	private String member;
	private String privacy;
	private String status;
	private String isGroup;
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

	public int getPlannerVer() {
		return plannerVer;
	}

	public void setPlannerVer(int plannerVer) {
		this.plannerVer = plannerVer;
	}

	
	public String getPlannerName() {
		return plannerName;
	}

	public void setPlannerName(String plannerName) {
		this.plannerName = plannerName;
	}

	
	public String getDepartDate() {
		return departDate;
	}

	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}

	public String getPlannerImage() {
		return plannerImage;
	}

	public void setPlannerImage(String plannerImage) {
		this.plannerImage = plannerImage;
	}

	public User getPlannerWriter() {
		return plannerWriter;
	}

	public void setPlannerWriter(User plannerWriter) {
		this.plannerWriter = plannerWriter;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIsGroup() {
		return isGroup;
	}

	public void setIsGroup(String isGroup) {
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
		return "Planner [plannerCode=" + plannerCode + ", plannerVer=" + plannerVer +", plannerName=" + plannerName + ", departDate=" + departDate
				+ ", plannerImage=" + plannerImage + ", plannerWriter=" + plannerWriter + ", member=" + member + ", privacy=" + privacy
				+ ", status=" + status + ", isGroup=" + isGroup + ", boardCode=" + boardCode + ", regDate=" + regDate
				+ "]";
	}

}
