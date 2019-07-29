package com.youlove.service.timelineimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.User;
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


	@Override
	public List<Timeline> getTimelineList(User user) throws Exception {
		return timelineDao.getTimelineList(user);
	}


	@Override
	public boolean updateTimeline(Timeline timeline) throws Exception {
		int res = timelineDao.updateTimeline(timeline);
		boolean result = false;
		if(res != 0) {
			result = true;
		}
		return result;
	}

}

