package com.youlove.service.planner;

import com.youlove.service.domain.Planner;
import com.youlove.service.domain.Route;

public interface PlannerService {

	public void addPlanner(Planner planner) throws Exception;
	
	public void addRoute(Route route) throws Exception;
}
