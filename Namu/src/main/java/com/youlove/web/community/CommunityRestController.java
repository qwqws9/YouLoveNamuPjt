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



@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method ���� ����
		
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="json/addCommunity",method=RequestMethod.POST)
	public ModelAndView addCommunity(@ModelAttribute("community") Community community)throws Exception{
		System.out.println("\nCommunityController:::addCommunity() ����:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/addCommunity.jsp");
		
		
		
		
		
		System.out.println("\nCommunityController:::addCommunity() ��:::");
		return modelAndView;
	} 
	
	@RequestMapping(value="json/getCommunity",method=RequestMethod.POST)
	public ModelAndView getCommunity(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::getCommunity() ����:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunity.jsp");
		
		
		System.out.println("\nCommunityController:::getCommunity() ��:::");
		return modelAndView;
	}

	@RequestMapping(value="json/getCommunityList",method=RequestMethod.POST)
	public ModelAndView getCommunityList(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::getCommunityList() ����:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunityList.jsp");
		
		
		System.out.println("\nCommunityController:::getCommunityList() ��:::");
		return modelAndView;
	}
	
	@RequestMapping(value="json/updateCommunity",method=RequestMethod.POST)
	public ModelAndView updateCommunity(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::updateCommunity() ����:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/updateCommunity.jsp");
		
		
		System.out.println("\nCommunityController:::updateCommunity() ��:::");
		return modelAndView;
	}

}