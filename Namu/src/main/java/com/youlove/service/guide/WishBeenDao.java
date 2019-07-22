package com.youlove.service.guide;

import java.util.List;

import com.youlove.service.domain.Flight;
import com.youlove.service.domain.Hotel;
import com.youlove.service.domain.Tour;

public interface WishBeenDao {
	
	public List<Tour> initTour() throws Exception;
	
	public List<Tour> selectPageNum(Tour tour) throws Exception;
	
	public Tour selectPageDetail(String tourId) throws Exception;
	
	public Tour selectPageDetail(String tourId,String cost,String checkin,String checkout) throws Exception;

	public List<Hotel> initHotel(Hotel hotel) throws Exception;
	
	public List<Flight> searchFlight(Flight flight) throws Exception;
	
}
