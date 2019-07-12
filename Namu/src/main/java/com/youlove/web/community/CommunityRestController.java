package com.youlove.web.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.community.CommunityService;
import com.youlove.service.domain.Community;



//==> 회원관리 Controller
@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method 구현 않음
		
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="json/addCommunity",method=RequestMethod.POST)
	public ModelAndView addCommunity(@ModelAttribute("community") Community community)throws Exception{
		System.out.println("\nCommunityController:::addCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/addCommunity.jsp");
		
		
		
		
		
		System.out.println("\nCommunityController:::addCommunity() 끝:::");
		return modelAndView;
	} 
	
	@RequestMapping(value="json/getCommunity",method=RequestMethod.POST)
	public ModelAndView getCommunity(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::getCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunity.jsp");
		
		
		System.out.println("\nCommunityController:::getCommunity() 끝:::");
		return modelAndView;
	}

	@RequestMapping(value="json/getCommunityList",method=RequestMethod.POST)
	public ModelAndView getCommunityList(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::getCommunityList() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunityList.jsp");
		
		
		System.out.println("\nCommunityController:::getCommunityList() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="json/updateCommunity",method=RequestMethod.POST)
	public ModelAndView updateCommunity(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::updateCommunity() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/updateCommunity.jsp");
		
		
		System.out.println("\nCommunityController:::updateCommunity() 끝:::");
		return modelAndView;
	}

}