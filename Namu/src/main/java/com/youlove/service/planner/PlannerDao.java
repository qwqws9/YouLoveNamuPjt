package com.youlove.service.planner;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Schedule;
import com.youlove.common.Search;
import com.youlove.service.domain.Planner;

import java.util.List;
import java.util.Map;


public interface PlannerDao {

	// 1. planner
	public void addPlanner(Planner planner) throws Exception;
	
	public Planner getPlanner(int plannerCode) throws Exception;
	
	public void updatePlanner(Planner planner) throws Exception;

	public void deletePlanner(int plannerCode) throws Exception;
	
	public List<Planner> getPlannerList(Map<String, Object> map)  throws Exception;
	
	public int getAllTotalCount(Map<String, Object> map) throws Exception;
	
	public int getAllTotalCount(Search search) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;

	
	public List<Planner> getAllPlannerList(Map<String, Object> map) throws Exception;
	
	public List<Planner> getAllPlannerList(Search search) throws Exception;
	
	//2. route
	public void addRoute(Route route) throws Exception ;
	
	public Route getRoute(int routeCode) throws Exception;
	
	public void deleteRoute(int plannerCode) throws Exception;
	
	public List<Route> getRouteList(int plannerCode) throws Exception;
	
	public List<Route> getRouteCityName(int plannerCode) throws Exception;
	
	public List<Route> getRouteLat(int plannerCode) throws Exception;
	
	public List<Route> getRouteLng(int plannerCode) throws Exception;
	
	
	//3.schedule
	public void addSchedule(Schedule schedule) throws Exception ;
	
	public Schedule getSchedule(int scheCode)  throws Exception;
	
	public void deleteSchedule(int plannerCode) throws Exception;
	
	public List<Schedule> getScheduleList(int plannerCode) throws Exception;
	
//	public void updateSchedule(Schedule schedule) throws Exception;
}

