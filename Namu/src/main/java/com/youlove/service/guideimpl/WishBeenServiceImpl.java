package com.youlove.service.guideimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Flight;
import com.youlove.service.domain.Hotel;
import com.youlove.service.domain.Tour;
import com.youlove.service.guide.WishBeenDao;
import com.youlove.service.guide.WishBeenService;

@Service("wishBeenServiceImpl")
public class WishBeenServiceImpl implements WishBeenService {
	
	@Autowired
	@Qualifier("wishBeenDaoImpl")
	private WishBeenDao wishBeenDao;

	@Override
	public List<Tour> initTour() throws Exception {
		return wishBeenDao.initTour();
	}

	@Override
	public List<Tour> selectPageNum(Tour tour) throws Exception {
		return wishBeenDao.selectPageNum(tour);
	}

	@Override
	public Tour selectPageDetail(String tourId) throws Exception {
		return wishBeenDao.selectPageDetail(tourId);
	}

	@Override
	public List<Hotel> initHotel(Hotel hotel) throws Exception {
		return wishBeenDao.initHotel(hotel);
	}

	@Override
	public List<Flight> searchFlight(Flight flight) throws Exception {
		return wishBeenDao.searchFlight(flight);
	}

	@Override
	public Tour selectPageDetail(String tourId, String cost,String checkin,String checkout) throws Exception {
		return wishBeenDao.selectPageDetail(tourId,cost,checkin,checkout);
	}


}
