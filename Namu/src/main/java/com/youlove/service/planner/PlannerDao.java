package com.youlove.service.planner;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Planner;

public interface PlannerDao {

	// INSERT
	public void addPlanner(Planner planner) throws Exception;
	
	public void addRoute(Route route) throws Exception ;
	

}
