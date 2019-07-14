package com.youlove.service.guide;

import java.util.List;

import com.youlove.service.domain.Tour;

public interface WishBeenService {

	
	public List<Tour> initTour() throws Exception;
	
	public List<Tour> selectPageNum(Tour tour) throws Exception;

	public Tour selectPageDetail(String tourId) throws Exception;
	
	
}

