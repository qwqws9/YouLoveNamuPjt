package com.youlove.service.domain;


public class Hashtag {
	
	///Field
	private int hashtagCode;
	private String hashtag;
	private int communityCode;
	private int partyCode;
	private int writer;

	///Constructor
	public Hashtag(){
	}
	
	//Method
	public int getHashtagCode() {
		return hashtagCode;
	}

	public void setHashtagCode(int hashtagCode) {
		this.hashtagCode = hashtagCode;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getCommunityCode() {
		return communityCode;
	}

	public void setCommunityCode(int communityCode) {
		this.communityCode = communityCode;
	}

	public int getPartyCode() {
		return partyCode;
	}

	public void setPartyCode(int partyCode) {
		this.partyCode = partyCode;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Hashtag [hashtagCode=" + hashtagCode + ", hashtag=" + hashtag + ", communityCode=" + communityCode
				+ ", partyCode=" + partyCode + ", writer=" + writer + "]";
	}
	
}