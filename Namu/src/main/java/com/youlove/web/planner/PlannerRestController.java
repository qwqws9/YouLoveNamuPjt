package com.youlove.web.planner;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.service.domain.Schedule;
import com.youlove.service.domain.User;
import com.youlove.service.domain.Wallet;
import com.youlove.common.FileNameUUId;
import com.youlove.common.Search;
import com.youlove.service.domain.Planner;
import com.youlove.service.domain.Police;
import com.youlove.service.domain.Route;
import com.youlove.service.planner.PlannerService;

@RestController
@RequestMapping("/planner/*")
public class PlannerRestController {
	public PlannerRestController() {
		System.out.println(this.getClass());
	}

	@Autowired
	@Qualifier("plannerServiceImpl")
	private PlannerService plannerService;
	
	@RequestMapping(value = "json/getAllPlannerList" ,method = RequestMethod.POST)
	public Map<String, Object> getAllPlannerList( @RequestBody Search search ) throws Exception {
		
		System.out.println("PlannerRestController------------------getAllPlannerList:post ");
		
		search.setPageSize(3);
		System.out.println(search);
				
		Map<String, Object> map = plannerService.getAllPlannerList(search);
		
		String message = "ok";
		
		List<Planner> list = (List<Planner>) map.get("list");
		if(list.size()<1) {
			message = "no";
		}
		map.put("message", message);
		System.out.println(map);		
		System.out.println("message????????????????"+message);
		return map;
	}
	
	@RequestMapping(value = "json/getBestPlannerList" ,method = RequestMethod.POST)
	public Map<String, Object> getBestPlannerList() throws Exception {
		
		System.out.println("PlannerRestController------------------getPlannerList:post ");
		Search search = new Search();
		
		search.setPageSize(3);
		System.out.println(search);
				
		Map<String, Object> map = plannerService.getBestPlannerList(search);
		String message = "success";
		
		List<Planner> list = (List<Planner>) map.get("list");
		
		map.put("message", message);
		System.out.println(map);		
		System.out.println("message????????????????"+message);
		return map;
	}

	@RequestMapping( value="json/getRouteList/{plannerCode}", method=RequestMethod.GET)
	public  List<Map<String, Object>> getRouteList(@PathVariable int plannerCode) throws Exception{
	
	System.out.println("PlannerRestController------------------getRouteList");
	 List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
       List rlist = new ArrayList();
       String city = "";
       String lat = "";
       String lng = "";
       int cityOrder;
       int stayDay;

       rlist =  plannerService.getRouteList(plannerCode);
          for(int i=0; i<rlist.size(); i++){   
             Map<String, Object> map = new HashMap<String, Object>();
             city = ((Route) rlist.get(i)).getCityName();   
             lat = ((Route) rlist.get(i)).getLat();
             lng = ((Route) rlist.get(i)).getLng();
             cityOrder=((Route) rlist.get(i)).getCityOrder();
             stayDay=((Route) rlist.get(i)).getStayDay();

             map.put("city", city);
             map.put("lat", lat);
             map.put("lng", lng);
             map.put("cityOrder",cityOrder);
             map.put("stayDay",stayDay);
            
             result.add(map);           
           }
  return result;
 }
	
	@RequestMapping(value="json/getRouteCityName/{plannerCode}", method=RequestMethod.GET)
	public List<String> getRouteCityName(@PathVariable int plannerCode) throws Exception {
		System.out.println("PlannerRestController----------------getRouteCityName : GET");
		
		List<String> data=plannerService.getRouteCityName(plannerCode);
		
		System.out.println(data);
		return data;

	}
	@RequestMapping(value="json/getRouteLat/{plannerCode}", method=RequestMethod.GET)
	public List<String> getRouteLat(@PathVariable int plannerCode) throws Exception {
		List<String> data2=plannerService.getRouteLat(plannerCode);
		System.out.println("PlannerRestController-------------------getRouteLat:GET");
		System.out.println(data2);
		return data2;

	}
	@RequestMapping(value="json/getRouteLng/{plannerCode}", method=RequestMethod.GET)
	public List<String> getRouteLng(@PathVariable int plannerCode) throws Exception {
		List<String> data3=plannerService.getRouteLng(plannerCode);
		System.out.println("PlannerRestController-------------------getRouteLng:GET");
		System.out.println(data3);
		return data3;
	}

	@RequestMapping( value="json/getScheduleList/{plannerCode}", method=RequestMethod.GET) 
	public  List<Map<String, Object>> getScheduleList( @PathVariable int plannerCode) throws Exception{
	
	System.out.println("PlannerRestController------------------getScheduleList");
	
	//plannerCode 받아오기
	//plannerCode=((Integer)session.getAttribute("plannerCode")).intValue();
	System.out.println(plannerCode);
	 
	 List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
	 List rlist = new ArrayList();
	 List slist = new ArrayList();
    
     String title = "";
     Date start;
     Date end;
     String color = "";
     Boolean allDay;
     rlist =  plannerService.getRouteList(plannerCode);
		for(int i=0; i<rlist.size(); i++){   
	     	Map<String, Object> map = new HashMap<String, Object>();
	        title = ((Route) rlist.get(i)).getCityName();   
	        start = ((Route) rlist.get(i)).getStartDate();
	        end = ((Route) rlist.get(i)).getEndDate();
	        int cityOrder=((Route) rlist.get(i)).getCityOrder();
	        allDay= true;
//	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			Calendar cal=Calendar.getInstance();
//			cal.setTime(start);
//			
	        //hard coding...... 방법 알아보기.
	        if(cityOrder==1){color="#CCCC66";}
	        if(cityOrder==2){color="#66CCFF";}
	        if(cityOrder==3){color="#9999FF";}
	        if(cityOrder==4){color="#D3FFCE";}
	        if(cityOrder==5){color="#FFC7C6";}
	        if(cityOrder==6){color="#98DDDE";}
	        if(cityOrder==7){color="#FFD954";}
	        if(cityOrder==8){color="#003A70";}
	        if(cityOrder==9){color="#FFF38C";}
	        if(cityOrder==10){color="#F08080";}
	        map.put("title", title);
	        map.put("start", start);
	        map.put("end", end);
	        map.put("color", color);
	        map.put("id",title);
	        map.put("allDay", allDay);
	        result.add(map);           
	     	}
       
		slist =  plannerService.getScheduleList(plannerCode);
       	for(int j=0; j<slist.size(); j++){   

       	 Map<String, Object> map2 = new HashMap<String, Object>();
         title = ((Schedule) slist.get(j)).getScheName();   
         String starts = ((Schedule) slist.get(j)).getScheDay()+" "+((Schedule) slist.get(j)).getTimeHour()+":"+((Schedule) slist.get(j)).getTimeMin() +":00";
        System.out.println(starts);
         int scheCode=((Schedule) slist.get(j)).getScheCode();
         color= ((Schedule) slist.get(j)).getColor();   
         allDay= false;
         ////////////////////////////////////////
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		Date date=null;
 		
 		try {
 			date=dateFormat.parse(starts); 
 		}catch(ParseException e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(date);

         ////////////////////////////////////////
         map2.put("title", title);
         map2.put("start", starts);
         map2.put("id",scheCode);
         map2.put("color", color);
         map2.put("allDay", allDay);
         result.add(map2);  
   	}

  return result;
}

	@RequestMapping( value="getScheduleList", method=RequestMethod.POST) 
	public  List<Map<String, Object>> getScheduleList(HttpSession session) throws Exception{
	
	
	System.out.println("PlannerRestController------------------getScheduleList :post");
	
	//plannerCode 받아오기
	int plannerCode=((Integer)session.getAttribute("plannerCode")).intValue();
	System.out.println(plannerCode);
	 
	 List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
	 List rlist = new ArrayList();
	 List slist = new ArrayList();
    
     String title = "";
     Date start;
     Date end;
     String color = "";
     Boolean allDay;
     rlist =  plannerService.getRouteList(plannerCode);
     System.out.println(plannerCode);
     System.out.println(rlist.size());
		for(int i=0; i<rlist.size(); i++){   
	     	Map<String, Object> map = new HashMap<String, Object>();
	        title = ((Route) rlist.get(i)).getCityName();   
	        start = ((Route) rlist.get(i)).getStartDate();
	        end = ((Route) rlist.get(i)).getEndDate();
	        int cityOrder=((Route) rlist.get(i)).getCityOrder();
	        //allDay= ((Route) rlist.get(i)).getAllDay();
	        allDay=true;
	        //hard coding...... 방법 알아보기.
	        if(cityOrder==1){color="#CCCC66";}
	        if(cityOrder==2){color="#66CCFF";}
	        if(cityOrder==3){color="#9999FF";}
	        if(cityOrder==4){color="#D3FFCE";}
	        if(cityOrder==5){color="#FFC7C6";}
	        if(cityOrder==6){color="#98DDDE";}
	        if(cityOrder==7){color="#FFD954";}
	        if(cityOrder==8){color="#003A70";}
	        if(cityOrder==9){color="#FFF38C";}
	        if(cityOrder==10){color="#F08080";}
	        map.put("title", title);
	        map.put("start", start);
	        map.put("end", end);
	        map.put("color", color);
	        map.put("id",title);
	        map.put("allDay", allDay);
	        result.add(map);           
	     	}
       
		slist =  plannerService.getScheduleList(plannerCode);
       	for(int j=0; j<slist.size(); j++){   

       	 Map<String, Object> map2 = new HashMap<String, Object>();
         title = ((Schedule) slist.get(j)).getScheName();   
         String starts = ((Schedule) slist.get(j)).getScheDay()+" "+((Schedule) slist.get(j)).getTimeHour()+":"+((Schedule) slist.get(j)).getTimeMin() +":00";
         int scheCode=((Schedule) slist.get(j)).getScheCode();
         color= ((Schedule) slist.get(j)).getColor(); 
         //allDay= ((Schedule) slist.get(j)).getAllDay();
         allDay=false;
         System.out.println(starts);
         ///////////////////////////////////////////////
         
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  		Date date=null;
  		
  		try {
  			date=dateFormat.parse(starts); 
  		}catch(ParseException e) {
 			e.printStackTrace();
 		}
 		Calendar cal=Calendar.getInstance();
 		cal.setTime(date);
 		///////////////////////////////////////////////////////////////
         map2.put("title", title);
         map2.put("start", starts);
         map2.put("id",scheCode);
         map2.put("color", color);
         map2.put("allDay", allDay);
         result.add(map2);  
   	}

  return result;
}
		// 일정등록
//		@RequestMapping(value = "/planner/addSchedule", method = RequestMethod.POST)
//		public HashMap<String, Object> addSchedule(@RequestBody HashMap<String, Object> requestParam){
//			 HashMap<String, Object> resultMap = new HashMap<String, Object>();
//			
//			try{
//				//plannerService.addSchedule(requestParam);       //method 만들기1!!!!!
//				resultMap.put("result", "SUCCESS");
//			}catch(Exception e){
//				resultMap.put("result", "FAIL");
//				resultMap.put("errorMsg", e.getMessage());
//			}
//
//			return resultMap;
//		}
	
	// event id 로 get
	@RequestMapping( value="json/getSchedule/{scheCode}", method=RequestMethod.GET )
	public Schedule getSchedule( @PathVariable int scheCode) throws Exception{
		
		System.out.println("plannerController------------------------getSchedule: GET");
		Schedule schedule=plannerService.getSchedule(scheCode);
	 
		return plannerService.getSchedule(scheCode);
		}

	 
	@RequestMapping(value = "/json/updateSchedule/{scheCode}", method = RequestMethod.POST)
	public boolean updateSchedule(@PathVariable int scheCode,@RequestBody Schedule schedule) throws Exception{

		System.out.println("plannerController------------------------updateSchedule: POST");
		schedule.setScheDay((schedule.getScheDay()).substring(0, 10));
		boolean result =plannerService.updateSchedule(schedule);
		
		return result;
	}
	
	@RequestMapping(value = "/json/updateSchedule2/{scheCode}", method = RequestMethod.POST)
	public boolean updateSchedule2(@PathVariable int scheCode,@RequestBody Schedule schedule) throws Exception{

		System.out.println("plannerController------------------------updateSchedule: POST");
		
		boolean result =plannerService.updateSchedule2(schedule);
		
		return result;
	}
	
	@RequestMapping(value="json/deleteSchedule/{scheCode}", method=RequestMethod.GET)
	public int deleteSchedule(@PathVariable int scheCode ,HttpSession session)throws Exception{
		System.out.println("plannerRestController -----------------------deleteSchedule:GET ");

		plannerService.deleteSchedule(scheCode);
	
		return scheCode;
	}
	
	@RequestMapping(value="json/deleteAllSchedule/{plannerCode}", method=RequestMethod.GET)
	public int deleteAllSchedule(@PathVariable int plannerCode ,HttpSession session)throws Exception{
		System.out.println("plannerRestController -----------------------deleteSchedule:GET ");

		plannerService.deleteAllSchedule(plannerCode);
	
		return plannerCode;
	}
	

	}

