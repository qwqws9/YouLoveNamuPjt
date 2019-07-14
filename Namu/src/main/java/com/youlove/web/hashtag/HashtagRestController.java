package com.youlove.web.hashtag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.domain.Hashtag;
import com.youlove.service.hashtag.HashtagService;




@RestController
@RequestMapping("/hashtag/*")
public class HashtagRestController {
	
	///Field
	@Autowired
	@Qualifier("hashtagServiceImpl")
	private HashtagService hashtagService;
		
	public HashtagRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{commonProperties['uploadPathThunbNail']}")
	String uploadPathThunbNail;
	@Value("#{commonProperties['uploadPathContent']}")
	String uploadPathContent;
	
	
	@RequestMapping(value="json/addHashtag",method=RequestMethod.POST)
	public ModelAndView addHashtag()throws Exception{
		System.out.println("\nHashtagController:::addHashtag() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		
		
		System.out.println("\nHashtagController:::addHashtag() 끝:::");
		return modelAndView;
	} 
	

	
}//end of class













