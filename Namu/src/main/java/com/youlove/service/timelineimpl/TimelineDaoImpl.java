package com.youlove.service.timelineimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Timeline;
import com.youlove.service.timeline.TimelineDao;


@Repository("timelineDaoImpl")
public class TimelineDaoImpl implements TimelineDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public TimelineDaoImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addTimeline(Timeline timeline) throws Exception {
		sqlSession.insert("TimelineMapper.addTimeline",timeline);
	}

	
	
	
}