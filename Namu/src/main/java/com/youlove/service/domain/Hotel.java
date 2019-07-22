package com.youlove.service.domain;

public class Hotel {
	
	private String hotelId;
	private String hotelName;
	private String hotelThumb;
	private String hotelShortDesc;
	private String hotelLoc;
	private String price;
	
	private String keyword;
	
	private String checkin;
	private String checkout;
	
	private String adult;
	private String children;
	
	
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getHotelThumb() {
		return hotelThumb;
	}
	public void setHotelThumb(String hotelThumb) {
		this.hotelThumb = hotelThumb;
	}
	public String getHotelShortDesc() {
		return hotelShortDesc;
	}
	public void setHotelShortDesc(String hotelShortDesc) {
		this.hotelShortDesc = hotelShortDesc;
	}
	public String getHotelLoc() {
		return hotelLoc;
	}
	public void setHotelLoc(String hotelLoc) {
		this.hotelLoc = hotelLoc;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getAdult() {
		return adult;
	}
	public void setAdult(String adult) {
		this.adult = adult;
	}
	public String getChildren() {
		return children;
	}
	public void setChildren(String children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "Hotel [hotelId=" + hotelId + ", hotelName=" + hotelName + ", hotelThumb=" + hotelThumb
				+ ", hotelShortDesc=" + hotelShortDesc + ", hotelLoc=" + hotelLoc + ", price=" + price + ", keyword="
				+ keyword + ", checkin=" + checkin + ", checkout=" + checkout + ", adult=" + adult + ", children="
				+ children + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
