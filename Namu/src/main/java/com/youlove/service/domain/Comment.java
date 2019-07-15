package com.youlove.service.domain;

import java.sql.Date;

public class Comment {
	
	private int commentCode;
	private int boardCode;
	private int detailCode;
	private String commentContent;
	private int step;
	private int replyCode;
	private String commentDate;
	private String writerComment;
	
	

	
	public int getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
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
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getWriterComment() {
		return writerComment;
	}
	public void setWriterComment(String writerComment) {
		this.writerComment = writerComment;
	}
	@Override
	public String toString() {
		return "Comment [commentCode=" + commentCode + ", boardCode=" + boardCode + ", detailCode=" + detailCode
				+ ", commentContent=" + commentContent + ", step=" + step + ", replyCode=" + replyCode
				+ ", commentDate=" + commentDate + ", writerComment=" + writerComment + "]";
	}
	
	
	
	

}
