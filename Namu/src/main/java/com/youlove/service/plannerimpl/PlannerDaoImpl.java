package com.youlove.service.plannerimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Planner;
import com.youlove.service.planner.PlannerDao;

@Repository("plannerDaoImpl")
public class PlannerDaoImpl implements PlannerDao{

	public PlannerDaoImpl() {
		System.out.println(this.getClass());
	}

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public void addPlanner(Planner planner) throws Exception {
		sqlSession.insert("PlannerMapper.addPlanner", planner);
		
	}@Override
	public void addRoute(Route route) throws Exception {
		sqlSession.insert("PlannerMapper.addRoute", route);
	}
	
}
