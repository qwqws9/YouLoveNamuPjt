package com.youlove.service.domain;

public class Like {
	
	private int likeCode;
	private int boardCode;
	private int detailCode;
	private int commentCode;
	private User likeName;
	private int likeCount;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}
	
	public Like(int boardCode, int detailCode) {
		this.boardCode = boardCode;
		this.detailCode = detailCode;
				
	}
	
	public int getLikeCode() {
		return likeCode;
	}
	public void setLikeCode(int likeCode) {
		this.likeCode = likeCode;
	}
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
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}
	public User getLikeName() {
		return likeName;
	}
	public void setLikeName(User likeName) {
		this.likeName = likeName;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	@Override
	public String toString() {
		return "Like [likeCode=" + likeCode + ", boardCode=" + boardCode + ", detailCode=" + detailCode
				+ ", commentCode=" + commentCode + ", likeName=" + likeName + ", likeCount=" + likeCount + "]";
	}
	
	
	
	
	

}
