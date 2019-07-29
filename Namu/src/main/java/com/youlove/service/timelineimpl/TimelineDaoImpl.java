package com.youlove.service.timelineimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.User;
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


	@Override
	public List<Timeline> getTimelineList(User user) throws Exception {
		return sqlSession.selectList("TimelineMapper.getTimelineList",user);
	}


	@Override
	public int updateTimeline(Timeline timeline) throws Exception {
		return sqlSession.update("TimelineMapper.updateTimeline",timeline);
	}

	
	
	
}