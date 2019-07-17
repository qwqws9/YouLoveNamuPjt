package com.youlove.service.guide;

import java.util.List;

import com.youlove.service.domain.City;

public interface GuideService {
	
	public City getCity(String cityName) throws Exception ;
	
	public List<City> getCityList(String value) throws Exception ;

}
