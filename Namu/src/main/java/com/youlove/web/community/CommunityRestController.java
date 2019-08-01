package com.youlove.web.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.common.Search;
import com.youlove.service.community.CommunityDao;
import com.youlove.service.community.CommunityService;
import com.youlove.service.domain.Community;



@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	//setter Method ���� ����
		
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{commonProperties['uploadPathThunbNail']}")
	String uploadPathThumbNail;
	@Value("#{commonProperties['uploadPathContent']}")
	String uploadPathContent;
	
	
	@RequestMapping(value="json/bestCommunityList",method=RequestMethod.POST)
	public Map<String, Object> addCommunity(@RequestBody Search search)throws Exception{
		System.out.println("\nCommunityController:::getCommunityList() ����:::");
		Map<String,Object> map = new HashMap<String, Object>();
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		map.put("search", search);
		List<Community> list = communityDao.getCommunityBestList(map);
		map.put("list", list);
		
		System.out.println("\nCommunityController:::addCommunity() ��:::");
		return map;
	} 
	
	@RequestMapping(value="json/getCommunity",method=RequestMethod.POST)
	public ModelAndView getCommunity(@ModelAttribute("community") Community community)throws Exception {
		System.out.println("\nCommunityController:::getCommunity() ����:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/community/getCommunity.jsp");
		
		
		System.out.println("\nCommunityController:::getCommunity() ��:::");
		return modelAndView;
	}

	@RequestMapping(value="json/getCommunityList/{communityBoard}",method=RequestMethod.POST)
	public Map<String, Object> getCommunityList(@RequestBody Search search,@PathVariable int communityBoard)throws Exception {
		System.out.println("\nCommunityRestController:::json/getCommunityList() 시작:::");
		System.out.println("currentPage = "+search.getCurrentPage());
		System.out.println("pageSize = "+search.getPageSize());
		System.out.println("end = "+search.getEndRowNum());
		System.out.println("start = "+search.getStartRowNum());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("communityBoard", communityBoard);
		map.put("search", search);
		map = communityService.getCommunityList(map);
		
		
		System.out.println("\nCommunityRestController:::json/getCommunityList() 끝:::");
		return map;
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