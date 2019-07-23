package com.youlove.web.timeline;

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
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.User;
import com.youlove.service.timeline.TimelineService;
import com.youlove.service.user.UserService;

@Controller
@RequestMapping("/timeline/*")
public class TimelineController {
	
	
	@Autowired
	@Qualifier("timelineServiceImpl")
	private TimelineService timelineService;
	
	
	public TimelineController() {
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping(value="/getTimelineList",method=RequestMethod.GET)
	public String getTimelineList(HttpSession session,Model model) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		List<Timeline> list = timelineService.getTimelineList(user);
		
		model.addAttribute("list",list);
		//System.out.println(list.toString());
		
		return "forward:/timeline/getTimelineList.jsp";
	}
	
	
	
	
	
	
	
	
}
