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
	private User writer;
	private City city;
	private String communityHashtag; 
	private Hashtag communityHashtagCode;
	
	
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

	public User getWriter() {
		return writer;
	}

	public void setWriter(User writer) {
		this.writer = writer;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getCommunityHashtag() {
		return communityHashtag;
	}

	public void setCommunityHashtag(String communityHashtag) {
		this.communityHashtag = communityHashtag;
	}

	public Hashtag getCommunityHashtagCode() {
		return communityHashtagCode;
	}

	public void setCommunityHashtagCode(Hashtag communityHashtagCode) {
		this.communityHashtagCode = communityHashtagCode;
	}

	@Override
	public String toString() {
		return "Community [communityCode=" + communityCode + ", communityBoard=" + communityBoard + ", communityTitle="
				+ communityTitle + ", communityContent=" + communityContent + ", communityDate=" + communityDate
				+ ", communityThumbnail=" + communityThumbnail + ", openRange=" + openRange + ", views=" + views
				+ ", writer=" + writer + ", city=" + city + ", communityHashtag=" + communityHashtag + ", communityhashtagCode=" + communityHashtagCode + "]";
	}


	
	
	
	
}