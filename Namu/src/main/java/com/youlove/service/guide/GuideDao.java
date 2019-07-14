package com.youlove.service.guide;

import java.util.Map;

import com.youlove.service.domain.City;

public interface GuideDao {
	
	public City getCity(String cityName) throws Exception ;

}
