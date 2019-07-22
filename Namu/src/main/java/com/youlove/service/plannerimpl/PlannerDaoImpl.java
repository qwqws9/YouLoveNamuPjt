package com.youlove.service.plannerimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Schedule;
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
	
	//1. planner
	@Override
	public void addPlanner(Planner planner) throws Exception {
		sqlSession.insert("PlannerMapper.addPlanner", planner);		
	}
	@Override
	public Planner getPlanner(int plannerCode) throws Exception {
			return sqlSession.selectOne("PlannerMapper.getPlanner", plannerCode);
		}
	
	@Override
	public void updatePlanner(Planner planner) throws Exception {
		sqlSession.update("PlannerMapper.updatePlanner", planner);
	}
	
	//2. route 
	@Override
	public void addRoute(Route route) throws Exception {
		sqlSession.insert("PlannerMapper.addRoute", route);
	}

	@Override
	public Route getRoute(int routeCode) throws Exception {
		return sqlSession.selectOne("PlannerMapper.getRoute",routeCode);
	}

	@Override
	public List<Route> getRouteList(int plannerCode) throws Exception {
		return sqlSession.selectList("PlannerMapper.getRouteList",plannerCode);
	}
	
	@Override
	public List<Route> getRouteCityName(int plannerCode) throws Exception {
		return sqlSession.selectList("PlannerMapper.getRouteCityName",plannerCode);
	}
	@Override
	public List<Route> getRouteLat(int plannerCode) throws Exception {
		return sqlSession.selectList("PlannerMapper.getRouteLat",plannerCode);
	
	}
	@Override
	public List<Route> getRouteLng(int plannerCode) throws Exception {
		return sqlSession.selectList("PlannerMapper.getRouteLng",plannerCode);
	
	}
	
	//3. schedule
	@Override
	public void addSchedule(Schedule schedule) throws Exception {
		sqlSession.insert("PlannerMapper.addSchedule", schedule);
	}
	
	@Override
	public List<Schedule> getScheduleList(int plannerCode) throws Exception {
		return sqlSession.selectList("PlannerMapper.getScheduleList",plannerCode);
	}
	
	public Schedule getSchedule(int scheCode)  throws Exception{
		return sqlSession.selectOne("PlannerMapper.getSchedule",scheCode);
	}
}
