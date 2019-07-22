package com.youlove.web.guide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.service.domain.City;
import com.youlove.service.domain.Flight;
import com.youlove.service.domain.Hotel;
import com.youlove.service.domain.Tour;
import com.youlove.service.guide.GuideService;
import com.youlove.service.guide.WishBeenService;

@RestController
@RequestMapping("/guide/*")
public class GuideRestController {
	
	public GuideRestController() {
		System.out.println(this.getClass());
	}

	@Autowired
	@Qualifier("guideServiceImpl")
	private GuideService guideService;
	
	@Autowired
	@Qualifier("wishBeenServiceImpl")
	private WishBeenService wishBeenService;
	
	/*
	 *  	국가명 or 도시명 으로  정보조회
	 */
	@RequestMapping("/json/getCity")
	public List<City> getCity(@RequestBody City city) throws Exception {
		
		System.out.println("/json/getCity");
		
		List<City> list = guideService.getCity(city);
		
		return list;
	}
	
	/*
			******** getCityList 사용법  ************
			
			/json/getCityList/{value}
			 * {all}		전체 정보조회
			 * {country} 	국가 리스트  조회
			
	
	 */
	@RequestMapping("/json/getCityList/{value}")
	public List<City> getCityList(@PathVariable String value) throws Exception {
		
		
		System.out.println("/json/getCityList");
		System.out.println("들어온 값 : "+value);
		
		return guideService.getCityList(value);
	}

	
	
	@RequestMapping(value = "/json/selectTourPage", method=RequestMethod.POST)
	public List<Tour> selectTourPage(@RequestBody Tour tour) throws Exception {
		
		System.out.println("/json/selectTourPage : POST");
		
		List<Tour> list = wishBeenService.selectPageNum(tour);
		
		return list;
	}
	
	//컨트롤러로 이사함..
//	@RequestMapping(value = "/json/selectTourDetail", method=RequestMethod.POST)
//	public Tour selectTourDetail(@RequestBody Tour tour) throws Exception {
//		
//		System.out.println("/json/selectTourDetail : POST");
//		
//		tour = wishBeenService.selectPageDetail(tour);
//		
//		return tour;
//	}
	
	
	@RequestMapping(value = "/json/searchHotel", method=RequestMethod.POST)
	public List<Hotel> searchHotel(@RequestBody Hotel hotel) throws Exception {
		
		System.out.println("/json/searchHotel : POST");
		
		List<Hotel> list = wishBeenService.initHotel(hotel);
		
		
		return list;
	}
	
	
	@RequestMapping(value = "/json/searchFlight", method=RequestMethod.POST)
	public List<Flight> searchFlight(@RequestBody Flight flight) throws Exception {
		
		System.out.println("/json/searchFlight : POST");
		
		List<Flight> list = wishBeenService.searchFlight(flight);
		
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
