package com.youlove.service.planner;

import java.util.List;

import com.youlove.service.domain.Planner;
import com.youlove.service.domain.Route;

public interface PlannerService {

	//1. planner 
	public void addPlanner(Planner planner) throws Exception;
	
	public Planner getPlanner(int plannerCode) throws Exception;
	
	
	//2. route 
	public void addRoute(Route route) throws Exception;
	
	public Route getRoute(int routeCode) throws Exception;
	
	public List<Route> getRouteList(int plannerCode) throws Exception;
	
	
}
