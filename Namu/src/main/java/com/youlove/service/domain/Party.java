package com.youlove.service.domain;

import java.sql.Date;


public class Party {
	
	///Field
	private int partyCode;
	private String partyTitle;
	private String partyContent;
	private String partyStart;
	private String partyEnd;
	private String partyPeople;
	private String partyWriter;
	private String partyRecruitment;
	private double latitude;
	private double longitude;
	private int tour;
	private int country;
	private int city;
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

	public String getPartyWriter() {
		return partyWriter;
	}

	public void setPartyWriter(String partyWriter) {
		this.partyWriter = partyWriter;
	}

	public int getTour() {
		return tour;
	}

	public void setTour(int tour) {
		this.tour = tour;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
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

	@Override
	public String toString() {
		return "Party [partyCode=" + partyCode + ", partyTitle=" + partyTitle + ", partyContent=" + partyContent
				+ ", partyStart=" + partyStart + ", partyEnd=" + partyEnd + ", partyPeople=" + partyPeople
				+ ", partyWriter=" + partyWriter + ", partyRecruitment=" + partyRecruitment + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", tour=" + tour + ", country=" + country + ", city=" + city
				+ ", regDate=" + regDate + "]";
	}

	
	
}