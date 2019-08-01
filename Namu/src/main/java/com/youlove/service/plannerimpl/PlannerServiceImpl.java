package com.youlove.service.plannerimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Schedule;
import com.youlove.common.Search;
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
	
		@Override
		public void updatePlanner(Planner planner) throws Exception {
			plannerDao.updatePlanner(planner);
		}
		
		@Override
		public void deletePlanner(int plannerCode) throws Exception {
			plannerDao.deletePlanner(plannerCode);
		}
		
		@Override
		public Map<String, Object> getPlannerList(Map<String, Object> map) throws Exception{
			List<Planner> list = plannerDao.getPlannerList(map);
			int totalCount = plannerDao.getTotalCount(map);
			map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("totalCount", new Integer(totalCount));
			return map;
		}
		
		@Override
		public Map<String, Object> getAllPlannerList(Map<String, Object> map) throws Exception{
			List<Planner> list = plannerDao.getAllPlannerList(map);
			int totalCount = plannerDao.getAllTotalCount(map);
			map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("totalCount", new Integer(totalCount));
			return map;
		}
		
		@Override
		public Map<String, Object> getAllPlannerList(Search search) throws Exception {

			List<Planner> list= plannerDao.getAllPlannerList(search);
			int totalCount = plannerDao.getAllTotalCount(search);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list );
			map.put("totalCount", new Integer(totalCount));
			
			return map;
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
		public void deleteRoute(int plannerCode) throws Exception {
			plannerDao.deleteRoute(plannerCode);
		}
		
		@Override
		public List<Route> getRouteList(int plannerCode) throws Exception {
			return plannerDao.getRouteList(plannerCode);
		}
		
		@Override
		public List<String> getRouteCityName(int plannerCode) throws Exception {

		    List<Route> cityList = plannerDao.getRouteCityName(plannerCode);
		    List<String> citys = new ArrayList<String>();
		    
		   for(int i=0;i<cityList.size();i++) {
			   citys.add(cityList.get(i).getCityName());
	   }
		    
		    System.out.println(citys);
		   
			return citys;
		}
		
		@Override
		public List<String> getRouteLng(int plannerCode) throws Exception {

			
		    List<Route> lngList = plannerDao.getRouteLng(plannerCode);
		   List<String> lngs = new ArrayList<String>();
		    
		   for(int i=0;i<lngList.size();i++) {
			   lngs.add(lngList.get(i).getLng());
	   }
		    
		    System.out.println(lngs);
		   
			return lngs;
		}
		
		@Override
		public List<String> getRouteLat(int plannerCode) throws Exception {
			
		   List<Route> latList = plannerDao.getRouteLat(plannerCode);
		   List<String> lats = new ArrayList<String>();
		    
		   for(int i=0;i<latList.size();i++) {
			   lats.add( latList.get(i).getLat());
	   }
		    
		    System.out.println(lats);
		   
			return lats;
		}

		//3.schedule
		@Override
		public void addSchedule(Schedule schedule) throws Exception {
			plannerDao.addSchedule(schedule);
		}

		public Schedule getSchedule(int scheCode) throws Exception{
			return plannerDao.getSchedule(scheCode);
		}
		
		@Override
		public void deleteSchedule(int scheCode) throws Exception {
			plannerDao.deleteSchedule(scheCode);
		}
		
		@Override
		public List<Schedule> getScheduleList(int plannerCode) throws Exception{
			return plannerDao.getScheduleList(plannerCode);
		}
			
	
}
