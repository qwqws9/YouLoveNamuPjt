package com.youlove.service.domain;

import java.sql.Date;


public class Party {
	
	///Field
	private int partyCode;
	private String partyTitle;
	private String partyContent;
	private String partyStart;
	private String partyEnd;
	private double latitude;
	private double longitude;
	private String partyPeople;
	private User partyWriter;
	private String partyRecruitment;
	private String gender;
	private String age;
	private City city;
	private String hashtag; 
	private Hashtag partyHashtagCode;
	private Date regDate;

	///Constructor
	public Party(){
	}
	
	//Method
	public int getPartyCode() {
		return partyCode;
	}
	public void setPartyCode(int partyCode) {
		this.partyCode = partyCode;
	}

	public String getPartyTitle() {
		return partyTitle;
	}

	public void setPartyTitle(String partyTitle) {
		this.partyTitle = partyTitle;
	}

	public String getPartyContent() {
		return partyContent;
	}

	public void setPartyContent(String partyContent) {
		this.partyContent = partyContent;
	}

	public String getPartyStart() {
		return partyStart;
	}

	public void setPartyStart(String partyStart) {
		this.partyStart = partyStart;
	}

	public String getPartyEnd() {
		return partyEnd;
	}

	public void setPartyEnd(String partyEnd) {
		this.partyEnd = partyEnd;
	}

	public String getPartyPeople() {
		return partyPeople;
	}

	public void setPartyPeople(String partyPeople) {
		this.partyPeople = partyPeople;
	}

	public User getPartyWriter() {
		return partyWriter;
	}

	public void setPartyWriter(User partyWriter) {
		this.partyWriter = partyWriter;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public String getPartyRecruitment() {
		return partyRecruitment;
	}

	public void setPartyRecruitment(String partyRecruitment) {
		this.partyRecruitment = partyRecruitment;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPartyHashtag() {
		return hashtag;
	}

	public void setPartyHashtag(String partyHashtag) {
		this.hashtag = partyHashtag;
	}

	public Hashtag getPartyHashtagCode() {
		return partyHashtagCode;
	}

	public void setPartyHashtagCode(Hashtag partyHashtagCode) {
		this.partyHashtagCode = partyHashtagCode;
	}

	@Override
	public String toString() {
		return "Party [partyCode=" + partyCode + ", partyTitle=" + partyTitle + ", partyContent=" + partyContent
				+ ", partyStart=" + partyStart + ", partyEnd=" + partyEnd + ", partyPeople=" + partyPeople
				+ ", partyWriter=" + partyWriter + ", partyRecruitment=" + partyRecruitment + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", gender=" + gender + ", age=" + age +  ", city="
				+ city + ", regDate=" + regDate + ", hashtag=" + hashtag + ", partyHashtagCode="
				+ partyHashtagCode + "]";
	}

	

	
	
}