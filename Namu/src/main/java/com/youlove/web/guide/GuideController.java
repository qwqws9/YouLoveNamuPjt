package com.youlove.web.guide;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.youlove.service.comment.CommentService;
import com.youlove.service.domain.Comment;
import com.youlove.service.domain.Hotel;
import com.youlove.service.domain.Tour;
import com.youlove.service.guide.GuideService;
import com.youlove.service.guide.WishBeenService;

@Controller
@RequestMapping("/guide/*")
public class GuideController {
	
	public GuideController() {
		System.out.println(this.getClass());
	}
	
	
	@Autowired
	@Qualifier("guideServiceImpl")
	private GuideService guideService;
	
	@Autowired
	@Qualifier("wishBeenServiceImpl")
	private WishBeenService wishBeenService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@RequestMapping("/initTour")
	public String initTour(Model model) throws Exception {
		
		List<Tour> list = wishBeenService.initTour();
		
		model.addAttribute("tourList", list);
		
		return "/guide/initTour.jsp";
	}
	
	@RequestMapping(value = "/selectTourDetail/{tourId}")
	public String selectTourDetail(@PathVariable String tourId, Tour tour, Model model, Map<String, Object> map) throws Exception {
		
		System.out.println("/selectTourDetail ");
		
		tour = wishBeenService.selectPageDetail(tourId);
		
		//map.put("boardCode", 5);
		//map.put("detailCode", tour.getTourId());
		//List<Comment> list = commentService.getComment(map);
		model.addAttribute("boardCode",5);
		model.addAttribute("detailCode",tour.getTourId());
		//model.addAttribute("comment",list);
		model.addAttribute("tour",tour);
		return "forward:/guide/tourDetail.jsp";
	}
	
	@RequestMapping(value = "/selectTourDetail/{tourId}/{cost}/{checkin}/{checkout}")
	public String selectTourDetail(@PathVariable String tourId,@PathVariable String cost
			,@PathVariable String checkin,@PathVariable String checkout, Tour tour, Model model) throws Exception {
	
		System.out.println("/selectTourDetail ");
		
		System.out.println("+++++++++++++++++++++++++++++++++");
		System.out.println(cost);
		
		System.out.println("+++++++++++++++++++++++++++++++++");
		
		tour = wishBeenService.selectPageDetail(tourId,cost,checkin,checkout);
		
		//map.put("boardCode", 5);
		//map.put("detailCode", tour.getTourId());
		//List<Comment> list = commentService.getComment(map);
		model.addAttribute("boardCode",5);
		model.addAttribute("detailCode",tour.getTourId());
		//model.addAttribute("comment",list);
		model.addAttribute("tour",tour);
		return "forward:/guide/tourDetail.jsp";
	}
	
	
	@RequestMapping("/initHotel")
	public String initHotel(Model model,Hotel hotel) throws Exception {
		hotel.setKeyword("init");
		
		List<Hotel> list = wishBeenService.initHotel(hotel);
		
		model.addAttribute("hotelList", list);
		
		return "forward:/guide/initHotel.jsp";
	}
	
	@RequestMapping("/searchFlight")
	public String searchFlight() throws Exception {
		
		
		return "forward:/guide/searchFlight.jsp";
	}
	

}
