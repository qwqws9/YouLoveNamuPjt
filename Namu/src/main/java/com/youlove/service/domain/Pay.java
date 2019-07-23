package com.youlove.service.domain;

import java.sql.Date;

public class Pay {
	
	private int paymentCode;
	private User paymentUser;
	private Date paymentDate;
	private String paymentPrice;
	
	private String paymentOption;
	private String hotelName;
	private String hotelAddress;
	private String hotelImage;
	private String hotelCode;
	
	private String startDate;
	private String endDate;
	
	private String startWay;
	private String endWay;
	private String flightTime;
	
	private String returnStartWay;
	private String returnEndWay;
	private String returnFlightTime;
	
	
	
	public int getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}
	public User getPaymentUser() {
		return paymentUser;
	}
	public void setPaymentUser(User paymentUser) {
		this.paymentUser = paymentUser;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(String paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getHotelAddress() {
		return hotelAddress;
	}
	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}
	public String getHotelImage() {
		return hotelImage;
	}
	public void setHotelImage(String hotelImage) {
		this.hotelImage = hotelImage;
	}
	public String getHotelCode() {
		return hotelCode;
	}
	public void setHotelCode(String hotelCode) {
		this.hotelCode = hotelCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartWay() {
		return startWay;
	}
	public void setStartWay(String startWay) {
		this.startWay = startWay;
	}
	public String getEndWay() {
		return endWay;
	}
	public void setEndWay(String endWay) {
		this.endWay = endWay;
	}
	public String getFlightTime() {
		return flightTime;
	}
	public void setFlightTime(String flightTime) {
		this.flightTime = flightTime;
	}
	public String getReturnStartWay() {
		return returnStartWay;
	}
	public void setReturnStartWay(String returnStartWay) {
		this.returnStartWay = returnStartWay;
	}
	public String getReturnEndWay() {
		return returnEndWay;
	}
	public void setReturnEndWay(String returnEndWay) {
		this.returnEndWay = returnEndWay;
	}
	public String getReturnFlightTime() {
		return returnFlightTime;
	}
	public void setReturnFlightTime(String returnFlightTime) {
		this.returnFlightTime = returnFlightTime;
	}
	@Override
	public String toString() {
		return "Pay [paymentCode=" + paymentCode + ", paymentUser=" + paymentUser + ", paymentDate=" + paymentDate
				+ ", paymentPrice=" + paymentPrice + ", paymentOption=" + paymentOption + ", hotelName=" + hotelName
				+ ", hotelAddress=" + hotelAddress + ", hotelImage=" + hotelImage + ", hotelCode=" + hotelCode
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", startWay=" + startWay + ", endWay=" + endWay
				+ ", flightTime=" + flightTime + ", returnStartWay=" + returnStartWay + ", returnEndWay=" + returnEndWay
				+ ", returnFlightTime=" + returnFlightTime + "]";
	}
	
	

}
