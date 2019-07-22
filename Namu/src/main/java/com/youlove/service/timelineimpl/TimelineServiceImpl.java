package com.youlove.service.timelineimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Timeline;
import com.youlove.service.timeline.TimelineDao;
import com.youlove.service.timeline.TimelineService;;


@Service("timelineServiceImpl")
public class TimelineServiceImpl implements TimelineService{
	
	@Autowired
	@Qualifier("timelineDaoImpl")
	private TimelineDao timelineDao;

	
	public TimelineServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addTimeline(Timeline timeline) throws Exception {
		timelineDao.addTimeline(timeline);
	}

}

