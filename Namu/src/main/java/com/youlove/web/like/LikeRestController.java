package com.youlove.web.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.domain.Hashtag;
import com.youlove.service.domain.Like;
import com.youlove.service.hashtag.HashtagService;
import com.youlove.service.like.LikeService;




@RestController
@RequestMapping("/like/*")
public class LikeRestController {
	
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
		
	public LikeRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="json/addLike",method=RequestMethod.POST)
	public boolean addLike(@RequestBody Like like)throws Exception{
		System.out.println("json/addLike 시작:::");
		
		likeService.addLike(like);
		
		
		return true;
	} 
	
	@RequestMapping(value="json/deleteLike",method=RequestMethod.POST)
	public boolean deleteLike(@RequestBody Like like)throws Exception{
		System.out.println("json/deleteLike 시작:::");
		
		likeService.deleteLike(like);
		
		
		return true;
	} 
	

	
}//end of class













