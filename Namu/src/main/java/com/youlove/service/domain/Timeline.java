package com.youlove.service.domain;

public class Timeline {
	
	private int timelineCode;
	private User fromUser;
	private User toUser;
	private String timeDate;
	
	private String inviteCode;
	
	private String protocol;
	private int commentCode;
	
	//private String accept;
	
	private int boardCode;
	private int detailCode;
	

	
	
	

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public int getDetailCode() {
		return detailCode;
	}

	public void setDetailCode(int detailCode) {
		this.detailCode = detailCode;
	}

	public int getCommentCode() {
		return commentCode;
	}

	public String getInviteCode() {
		return inviteCode;
	}

	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
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
				+ ", timeDate=" + timeDate + ", inviteCode=" + inviteCode + ", protocol=" + protocol + ", commentCode="
				+ commentCode + ", boardCode=" + boardCode + ", detailCode=" + detailCode + "]";
	}

	
	

}
