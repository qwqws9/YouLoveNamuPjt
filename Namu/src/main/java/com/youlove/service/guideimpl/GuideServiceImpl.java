package com.youlove.service.guideimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.City;
import com.youlove.service.guide.GuideDao;
import com.youlove.service.guide.GuideService;

@Service("guideServiceImpl")
public class GuideServiceImpl implements GuideService {

	@Autowired
	@Qualifier("guideDaoImpl")
	private GuideDao guideDao;

	@Override
	public City getCity(String cityName) throws Exception {
		return guideDao.getCity(cityName);
	}

	@Override
	public List<City> getCityList(String value) throws Exception {
		return guideDao.getCityList(value);
	}
}
