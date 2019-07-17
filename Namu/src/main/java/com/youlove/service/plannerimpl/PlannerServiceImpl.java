package com.youlove.service.plannerimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Planner;
import com.youlove.service.planner.PlannerDao;
import com.youlove.service.planner.PlannerService;
import com.youlove.service.user.UserDao;

@Service("plannerServiceImpl")
	public class PlannerServiceImpl implements PlannerService{
		
		@Autowired
		@Qualifier("plannerDaoImpl")
		private PlannerDao plannerDao;
		
		public void setPlannerDao(PlannerDao plannerDao) {
			this.plannerDao = plannerDao;
		}
		
		@Autowired
		@Qualifier("userDaoImpl")
		private UserDao userDao;
		
		public void setUserDao(UserDao userDao) {
			this.userDao = userDao;
		}
		
		public PlannerServiceImpl() {
			System.out.println(this.getClass());
			
		}

		//1. planner 
		@Override
		public void addPlanner(Planner planner) throws Exception {
			plannerDao.addPlanner(planner);
		}
		@Override
		public Planner getPlanner(int plannerCode) throws Exception {
			return plannerDao.getPlanner(plannerCode);
		}
	
		//2. route 
		@Override
		public void addRoute(Route route) throws Exception {
			plannerDao.addRoute(route);
		}

		@Override
		public Route getRoute(int routeCode) throws Exception {
			return plannerDao.getRoute(routeCode);
		}

		@Override
		public List<Route> getRouteList(int plannerCode) throws Exception {
			return plannerDao.getRouteList(plannerCode);
		}
	
		
		
		
}
