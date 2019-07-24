package com.youlove.service.planner;

import java.util.List;
import java.util.Map;

import com.youlove.common.Search;
import com.youlove.service.domain.Planner;
import com.youlove.service.domain.Route;
import com.youlove.service.domain.Schedule;

public interface PlannerService {

	//1. planner 
	public void addPlanner(Planner planner) throws Exception; //ok
	
	public Planner getPlanner(int plannerCode) throws Exception;  
	
	public void updatePlanner(Planner planner) throws Exception;
	
	public Map<String, Object> getPlannerList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> getAllPlannerList(Map<String, Object> map) throws Exception;
	
	//2. route 
	public void addRoute(Route route) throws Exception;	//ok
	
	public Route getRoute(int routeCode) throws Exception;  //getPlanner route area 
	
	public List<Route> getRouteList(int plannerCode) throws Exception;
	
	public List<String> getRouteCityName(int plannerCode) throws Exception;
	
	public List<String> getRouteLat(int plannerCode) throws Exception;
	
	public List<String> getRouteLng(int plannerCode) throws Exception;
	
	//3. schedule
	public void addSchedule(Schedule schedule) throws Exception;	//ok
	
	public List<Schedule> getScheduleList(int plannerCode) throws Exception;	//ok route, schedule 한번에

	public Schedule getSchedule(int scheCode) throws Exception;	//ok
	
//	public void updateSchedule(Schedule schedule) throws Exception;
	
	
}
