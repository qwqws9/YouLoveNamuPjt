package com.youlove.web.timeline;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.common.DateFormat;
import com.youlove.service.domain.Timeline;
import com.youlove.service.timeline.TimelineService;

@RestController
@RequestMapping("/timeline/*")
public class TimelineRestController {
	
	@Autowired
	@Qualifier("timelineServiceImpl")
	private TimelineService timelineService;

	
	@RequestMapping("/json/addTimeline")
	public boolean addTimeline(@RequestBody Timeline timeline) throws Exception {
		
		System.out.println("/json/addTimeline");
		//현재시간 넣어줌
		timeline.setTimeDate(DateFormat.minute());
		
		timelineService.addTimeline(timeline);
		
		
		return true;
	}
}
