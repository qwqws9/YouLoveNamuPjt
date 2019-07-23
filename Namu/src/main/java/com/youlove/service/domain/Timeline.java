package com.youlove.service.domain;

public class Timeline {
	
	private int timelineCode;
	private User fromUser;
	private User toUser;
	private String timeDate;
	
	private String accept;
	
	private String protocol;
	private int commentCode;
	
	//private String accept;
	
	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	
	
	

	public int getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}

	public int getTimelineCode() {
		return timelineCode;
	}

	public void setTimelineCode(int timelineCode) {
		this.timelineCode = timelineCode;
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

	public String getTimeDate() {
		return timeDate;
	}

	public void setTimeDate(String timeDate) {
		this.timeDate = timeDate;
	}

	public String getProtocol() {
		return protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	@Override
	public String toString() {
		return "Timeline [timelineCode=" + timelineCode + ", fromUser=" + fromUser + ", toUser=" + toUser
				+ ", timeDate=" + timeDate + ", protocol=" + protocol + "]";
	}
	
	
	
	

}
