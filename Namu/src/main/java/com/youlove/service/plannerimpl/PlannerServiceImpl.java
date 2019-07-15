package com.youlove.service.plannerimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Planner;
import com.youlove.service.planner.PlannerDao;
import com.youlove.service.planner.PlannerService;

@Service("plannerServiceImpl")
	public class PlannerServiceImpl implements PlannerService{
		
		@Autowired
		@Qualifier("plannerDaoImpl")
		private PlannerDao plannerDao;
		
		public void setPlannerDao(PlannerDao plannerDao) {
			this.plannerDao = plannerDao;
		}
		
		public PlannerServiceImpl() {
			System.out.println(this.getClass());
			
		}

		@Override
		public void addPlanner(Planner planner) throws Exception {
			plannerDao.addPlanner(planner);
		}
		
		@Override
		public void addRoute(Route route) throws Exception {
			plannerDao.addRoute(route);
		}
		
}
