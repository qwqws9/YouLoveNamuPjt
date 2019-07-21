package com.youlove.service.domain;

import java.util.List;

public class Tour {
	
	private String tourId;
	private String tourName;
	private String tourThumb;
	private String tourShortDesc;
	private String tourLoc;
	private String hashtag;
	
	//하단에 보여줄 페이징 숫자
	private int  pageCount;
	//하단에 보여줄 스타트 숫자
	private int firstPageNum;
	
	
	private String keyword;
	//현재 보고있는 페이지
	private int pageNum;
	
	private boolean nextBtn;
	
	// 디테일 조회시 필요한 필드
	private String countryTour;
	private String cityTour;
	private String address;
	//private String tourId;
	//private String tourName;
	private String longDesc;
	private String costTour;
	private String wayTour;
	private String openTour;
	//private String tourShortDesc;
	private String closeTour;
	private double latTour;
	private double lngTour;
	private List<String> spotImage;
	
	private String cost;
	private String checkin;
	private String checkout;
	
	
	
	
	
	
	
	
	
	
	
	
	
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

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getCountryTour() {
		return countryTour;
	}

	public void setCountryTour(String countryTour) {
		this.countryTour = countryTour;
	}

	public String getCityTour() {
		return cityTour;
	}

	public void setCityTour(String cityTour) {
		this.cityTour = cityTour;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongDesc() {
		return longDesc;
	}

	public void setLongDesc(String longDesc) {
		this.longDesc = longDesc;
	}

	public String getCostTour() {
		return costTour;
	}

	public void setCostTour(String costTour) {
		this.costTour = costTour;
	}

	public String getWayTour() {
		return wayTour;
	}

	public void setWayTour(String wayTour) {
		this.wayTour = wayTour;
	}

	public String getOpenTour() {
		return openTour;
	}

	public void setOpenTour(String openTour) {
		this.openTour = openTour;
	}

	public String getCloseTour() {
		return closeTour;
	}

	public void setCloseTour(String closeTour) {
		this.closeTour = closeTour;
	}

	public double getLatTour() {
		return latTour;
	}

	public void setLatTour(double latTour) {
		this.latTour = latTour;
	}

	public double getLngTour() {
		return lngTour;
	}

	public void setLngTour(double lngTour) {
		this.lngTour = lngTour;
	}

	public List<String> getSpotImage() {
		return spotImage;
	}

	public void setSpotImage(List<String> spotImage) {
		this.spotImage = spotImage;
	}

	public int getFirstPageNum() {
		return firstPageNum;
	}

	public void setFirstPageNum(int firstPageNum) {
		this.firstPageNum = firstPageNum;
	}

	
	
	

	@Override
	public String toString() {
		return "Tour [tourId=" + tourId + ", tourName=" + tourName + ", tourThumb=" + tourThumb + ", tourShortDesc="
				+ tourShortDesc + ", tourLoc=" + tourLoc + ", hashtag=" + hashtag + ", pageCount=" + pageCount
				+ ", firstPageNum=" + firstPageNum + ", keyword=" + keyword + ", pageNum=" + pageNum + ", nextBtn="
				+ nextBtn + ", countryTour=" + countryTour + ", cityTour=" + cityTour + ", address=" + address
				+ ", longDesc=" + longDesc + ", costTour=" + costTour + ", wayTour=" + wayTour + ", openTour="
				+ openTour + ", closeTour=" + closeTour + ", latTour=" + latTour + ", lngTour=" + lngTour
				+ ", spotImage=" + spotImage + "]";
	}

	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTourName() {
		return tourName;
	}
	public void setTourName(String tourName) {
		this.tourName = tourName;
	}
	public boolean isNextBtn() {
		return nextBtn;
	}
	public void setNextBtn(boolean nextBtn) {
		this.nextBtn = nextBtn;
	}
	
	public String getTourId() {
		return tourId;
	}
	public void setTourId(String tourId) {
		this.tourId = tourId;
	}
	public String getTourThumb() {
		return tourThumb;
	}
	public void setTourThumb(String tourThumb) {
		this.tourThumb = tourThumb;
	}
	public String getTourShortDesc() {
		return tourShortDesc;
	}
	public void setTourShortDesc(String tourShortDesc) {
		this.tourShortDesc = tourShortDesc;
	}
	public String getTourLoc() {
		return tourLoc;
	}
	public void setTourLoc(String tourLoc) {
		this.tourLoc = tourLoc;
	}
	
	

}
