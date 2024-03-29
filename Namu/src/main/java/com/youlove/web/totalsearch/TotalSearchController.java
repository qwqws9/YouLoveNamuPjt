package com.youlove.web.totalsearch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.common.FileNameUUId;
import com.youlove.common.Search;
import com.youlove.service.community.CommunityService;
import com.youlove.service.domain.Community;
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.Tour;
import com.youlove.service.domain.User;
import com.youlove.service.guide.WishBeenDao;
import com.youlove.service.guide.WishBeenService;
import com.youlove.service.planner.PlannerService;
import com.youlove.service.timeline.TimelineService;
import com.youlove.service.user.UserService;

@Controller
@RequestMapping("/totalSearch/*")
public class TotalSearchController {
	
	@Autowired
	@Qualifier("wishBeenServiceImpl")
	private WishBeenService wishbeenService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("plannerServiceImpl")
	private PlannerService plannerService;
	
	
	public TotalSearchController() {
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping(value="/getTotalSearch",method=RequestMethod.POST)
	public String getTotalSearch(@ModelAttribute Search search,Model model,Tour tour,Map<String,Object> map,Map<String,Object> plannerMap ) throws Exception{
		
		System.out.println("getTotalSearch 들어옴 : " + search.getSearchKeyword());
		
		//관광지 정보
		tour.setKeyword(search.getSearchKeyword());
		tour.setPageNum(1);
		tour.setAddress("tour");
		//관광지 검색
		List<Tour> tourList = wishbeenService.selectPageNum(tour);
		if(tourList != null) {
			for(Tour t: tourList) {
				String cut= t.getTourShortDesc();
				if(cut.length() > 40) {
					cut = cut.substring(0, 40);
					cut += "........";
					t.setTourShortDesc(cut);
				}
			}
		}
		
		search.setSearchCondition("2");
		search.setPageSize(5);
		search.setCurrentPage(1);
		map.put("search", search);
		
		//게시물 검색
		map = communityService.getCommunityList(map);
		
		search.setSearchCondition(null);
		plannerMap.put("search", search);
		//플래너 검색
		plannerMap = plannerService.getAllPlannerList(plannerMap);
		model.addAttribute("plannerList",plannerMap.get("list"));
		
		
		model.addAttribute("communityList",map.get("list"));
		model.addAttribute("keyword",search.getSearchKeyword());
		model.addAttribute("tourList",tourList);
		
		
		
		
		return "forward:/totalsearch/getTotalSearch.jsp";
	}
	
	
	
	
	
	
	
	
}
