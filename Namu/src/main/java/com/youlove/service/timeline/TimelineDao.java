package com.youlove.service.timeline;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.User;



public interface TimelineDao {
	
	public int addTimeline(Timeline timeline) throws Exception;
	
	public List<Timeline> getTimelineList(User user) throws Exception;
	
	public int updateTimeline(Timeline timeline) throws Exception;
	
}