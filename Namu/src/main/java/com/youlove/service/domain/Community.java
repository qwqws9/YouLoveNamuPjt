package com.youlove.service.domain;


//==>ȸ�������� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean
public class Community {
	
	///Field
	private int communityCode;
	private String communityBoard;
	private String communityTitle;
	private String communityContent;
	private String communityDate;
	private String communityThumbnail;
	private String openRange;
	private int views;
	private int writer;
	private int likes;
	private String hashtag;
	private int comment;
	private String city;

	
	
	///Constructor
	public Community(){
	}
	
	//Method
	public int getCommunityCode() {
		return communityCode;
	}
	public void setCommunityCode(int communityCode) {
		this.communityCode = communityCode;
	}
	
	public String getCommunityBoard() {
		return communityBoard;
	}
	public void setCommunityBoard(String communityBoard) {
		this.communityBoard = communityBoard;
	}
	
	public String getCommunityTitle() {
		return communityTitle;
	}
	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}
	
	public String getCommunityContent() {
		return communityContent;
	}
	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
		
	}
	public String getCommunityDate() {
		return communityDate;
	}
	public void setCommunityDate(String communityDate) {
		this.communityDate = communityDate;
	}
	
	public String getCommunityThumbnail() {
		return communityThumbnail;
	}
	public void setCommunityThumbnail(String communityThumbnail) {
		this.communityThumbnail = communityThumbnail;
	}
	
	public String getOpenRange() {
		return openRange;
	}
	public void setOpenRange(String openRange) {
		this.openRange = openRange;
	}

	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}

	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}

	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "CommunityDomain [communityCode=" + communityCode + ", communityBoard=" + communityBoard + ", communityTitle="
				+ communityTitle + ", communityContent=" + communityContent + ", communityDate=" + communityDate
				+ ", communityThumbnail=" + communityThumbnail + ", openRange=" + openRange + ", views=" + views
				+ ", writer=" + writer + ", likes=" + likes + ", hashtag=" + hashtag + ", comment=" + comment
				+ ", city=" + city + "]";
	}
	
	
	
	
}