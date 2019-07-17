package com.youlove.web.hashtag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.domain.Hashtag;
import com.youlove.service.hashtag.HashtagService;




@Controller
@RequestMapping("/hashtag/*")
public class HashtagController {
	
	///Field
	@Autowired
	@Qualifier("hashtagServiceImpl")
	private HashtagService hashtagService;
	
	public HashtagController(){
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
	
	
	@RequestMapping(value="addHashtag",method=RequestMethod.POST)
	public int addHashtag(@ModelAttribute("hashtag") Hashtag hashtag)throws Exception{
		System.out.println("\nHashtagController:::addHashtag() 시작:::");
		System.out.println("Hashtag = "+hashtag);
		hashtagService.addHashtag(hashtag);
		
		
		System.out.println(hashtag.getCommunityCode());
		System.out.println("\nHashtagController:::addHashtag() 끝:::");
		return hashtag.getHashtagCode();
	} 
	
	
}//end of class













