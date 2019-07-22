package com.youlove.web.timeline;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.service.domain.Timeline;

@RestController
@RequestMapping("/timeline/*")
public class TimelineRestController {

	
	@RequestMapping("/json/addTimeline")
	public boolean addTimeline(@RequestBody Timeline timeline) throws Exception {
		
		
		return true;
	}
}
