package com.youlove.service.domain;

public class Police {

	private int policeCode;
	
	private User fromUser;
	private User toUser;
	private int policeBoardCode;
	private int policeDetailCode;
	private String policeOption;
	private String policeContent;
	private String policeDate;
	private String processing;
	
	
	
	
	
	
	public String getProcessing() {
		return processing;
	}
	public void setProcessing(String processing) {
		this.processing = processing;
	}
	public String getPoliceDate() {
		return policeDate;
	}
	public void setPoliceDate(String policeDate) {
		this.policeDate = policeDate;
	}
	public int getPoliceCode() {
		return policeCode;
	}
	public void setPoliceCode(int policeCode) {
		this.policeCode = policeCode;
	}
	public User getFromUser() {
		return fromUser;
	}
	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}
	public User getToUser() {
		return toUser;
	}
	public void setToUser(User toUser) {
		this.toUser = toUser;
	}
	public int getPoliceBoardCode() {
		return policeBoardCode;
	}
	public void setPoliceBoardCode(int policeBoardCode) {
		this.policeBoardCode = policeBoardCode;
	}
	public int getPoliceDetailCode() {
		return policeDetailCode;
	}
	public void setPoliceDetailCode(int policeDetailCode) {
		this.policeDetailCode = policeDetailCode;
	}
	public String getPoliceOption() {
		return policeOption;
	}
	public void setPoliceOption(String policeOption) {
		this.policeOption = policeOption;
	}
	public String getPoliceContent() {
		return policeContent;
	}
	public void setPoliceContent(String policeContent) {
		this.policeContent = policeContent;
	}
	@Override
	public String toString() {
		return "Police [policeCode=" + policeCode + ", fromUser=" + fromUser + ", toUser=" + toUser
				+ ", policeBoardCode=" + policeBoardCode + ", policeDetailCode=" + policeDetailCode + ", policeOption="
				+ policeOption + ", policeContent=" + policeContent + "]";
	}
	
	
	
	
	
}
