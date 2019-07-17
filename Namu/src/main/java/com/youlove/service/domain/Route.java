package com.youlove.service.domain;

import java.util.Date;


public class Route {
	
	///Field
	private int plannerCode;
	private int plannerVer;
	private int routeNo;
	
	private String cityName;
	private String lat;
	private String lng;
	private int stayDay;
	private int cityOrder;
	
	private Date startDate;
	private Date endDate;
	
	
	///Constructor
	public Route(){
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public String getLng() {
		return lng;
	}


	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getPlannerCode() {
		return plannerCode;
	}


	public void setPlannerCode(int plannerCode) {
		this.plannerCode = plannerCode;
	}


	public int getPlannerVer() {
		return plannerVer;
	}


	public void setPlannerVer(int plannerVer) {
		this.plannerVer = plannerVer;
	}


	public int getRouteNo() {
		return routeNo;
	}


	public void setRouteNo(int routeNo) {
		this.routeNo = routeNo;
	}


	public String getCityName() {
		return cityName;
	}


	public void setCityName(String cityName) {
		this.cityName = cityName;
	}


	public int getStayDay() {
		return stayDay;
	}


	public void setStayDay(int stayDay) {
		this.stayDay = stayDay;
	}


	public int getCityOrder() {
		return cityOrder;
	}


	public void setCityOrder(int cityOrder) {
		this.cityOrder = cityOrder;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	@Override
	public String toString() {
		return "Route [plannerCode=" + plannerCode + ", plannerVer=" + plannerVer + ", routeNo=" + routeNo
				+ ", cityName=" + cityName + ", lat=" + lat + ", lng=" + lng + ", stayDay=" + stayDay + ", cityOrder="
				+ cityOrder + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}



}

	