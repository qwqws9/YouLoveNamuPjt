package com.youlove.web.planner;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Schedule;
import com.youlove.service.domain.User;
import com.youlove.common.FileNameUUId;
import com.youlove.common.Page;
import com.youlove.common.Search;
import com.youlove.service.domain.Planner;

import com.youlove.service.planner.PlannerService;
import com.youlove.service.user.UserService;

@Controller
@RequestMapping("/planner/*")
public class PlannerController {
	
	///Field
	@Autowired
	@Qualifier("plannerServiceImpl")
	private PlannerService plannerService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PlannerController(){
		System.out.println(this.getClass());
	}

	// 1. planner
	@RequestMapping( value="addPlanner", method=RequestMethod.GET )
	public String addPlanner() throws Exception {
		
		System.out.println("PlannerController ---------------addPlanner:GET");
		
		return "forward:/planner/addPlanner.jsp";
	}
	
	
	@RequestMapping( value="addPlanner", method=RequestMethod.POST )
	public String addPlanner( @ModelAttribute("planner") Planner planner, Model model,HttpSession session,  MultipartFile file,  HttpServletRequest request) throws Exception {

		System.out.println("PlannerController -------------addPlanner:POST start");

		User user= (User)session.getAttribute("user");
		
		planner.setPlannerWriter(user);
		System.out.println(user);
		
		if(user==null) {
			return "redirect:/user/loginView.jsp";
		}
		
		//String path="//Users//minikim//eclipse-workspace//YouLovePlanMini2//WebContent//resources//images//plannerImage";
		//String path="//Users//minikim//git//YouLovePlanMini//WebContent//resources//images//plannerImage";
		
//		String fileName=file.getOriginalFilename();
		
		String fileName = FileNameUUId.convert(file, "planner", request);
		planner.setPlannerImage(fileName);
//		FileOutputStream fileOutputStream;
		
//		try {
//			//nf.createNewFile();
//			//fileOutputStream= new FileOutputStream(path+"\\"+fileName);
//			fileOutputStream= new FileOutputStream(path+"//"+fileName);
//			fileOutputStream.write(file.getBytes());
//			fileOutputStream.close();
//		}
//		catch(FileNotFoundException e) {
//			e.printStackTrace();
//		}catch(IOException e) {
//			e.printStackTrace();
//		}	
		
		planner.setDepartDate(planner.getDepartDate().replace("-", ""));
		
		System.out.println(planner);
		plannerService.addPlanner(planner);
		//plannerService.getPlanner(planner.getPlannerCode());
		session.setAttribute("plannerCode", planner.getPlannerCode());
		System.out.println(planner.getPlannerCode());
		System.out.println("plannerController ----------------addPlanner:POST  end");
		return "forward:/planner/addRoute.jsp";
	}
	
	

	@RequestMapping( value="updatePlanner", method=RequestMethod.GET )
	public String updatePlanner( @RequestParam("plannerCode") int plannerCode , Model model ) throws Exception{

		System.out.println("plannerController ----------------updatePlanner:GET ");
		System.out.println(plannerCode);
		Planner planner = plannerService.getPlanner(plannerCode);
		
		model.addAttribute("planner", planner);

		return "forward:/planner/updatePlanner.jsp";
	}
	
	
	@RequestMapping( value="updatePlanner", method=RequestMethod.POST )
	public String updatePlanner( @ModelAttribute("planner") Planner planner, Model model,HttpSession session,  
			MultipartFile file,  HttpServletRequest request, HttpServletResponse response)  throws Exception{

		System.out.println("plannerController ----------------updatePlanner:POST ");
		
		
	System.out.println(file);
		String fileName = FileNameUUId.convert(file, "planner", request);
		System.out.println("1");
		planner.setPlannerImage(fileName);
		System.out.println("2");
		planner.setDepartDate(planner.getDepartDate().replace("-", ""));
		System.out.println("3");
		System.out.println(planner);
		
		session.setAttribute("plannerCode", planner.getPlannerCode());
		System.out.println("4");
		System.out.println(planner.getPlannerCode());

		plannerService.updatePlanner(planner);
		
		return "forward:/planner/updateRoute.jsp";
	
	}
	
	@RequestMapping( value="getPlanner", method=RequestMethod.GET )
	public String getPlanner( @RequestParam("plannerCode") int plannerCode ,Model model) throws Exception {
		
		System.out.println("PlannerRestController--------getPlanner:GET");
		//Business Logic
		Planner planner = plannerService.getPlanner(plannerCode);
		//Route route = plannerService.getRoute(plannerCode);
//		Schedule schedule = plannerService.getScheduleList(plannerCode);
		
		String page=null;
		
		model.addAttribute("planner", planner);
		//model.addAttribute("route", route);
//		model.addAttribute("schedule", schedule);
		
		return "forward:/planner/getPlanner.jsp";
		}
	@RequestMapping( value="getPlannerList")
	public String getPlannerList(@ModelAttribute("planner") Planner planner, @ModelAttribute("search") Search search,Model model ,HttpSession session ) throws Exception {
		
	System.out.println("PlannerRestController------------------getPlannerList");
	int pageUnit = 10;
	int pageSize = 10;
	
	if(search.getCurrentPage() ==0 ){
		search.setCurrentPage(1);
	}
	search.setPageSize(pageSize);
	System.out.println("search ??? :"+search);
	
		User user= (User)session.getAttribute("user");
		int userCode=user.getUserCode();
		planner.setPlannerWriter(user);
		System.out.println("userCode?:"+userCode);
	
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userCode", userCode);
		map = plannerService.getPlannerList(map);
	
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("today", com.youlove.common.DateFormat.today());
		System.out.println(search);
		System.out.println(map.get("list"));
	
		return "forward:/planner/getPlannerList.jsp";
	}
	
	@RequestMapping( value="getAllPlannerList")
	public String getAllPlannerList(@ModelAttribute("planner") Planner planner, @ModelAttribute("search") Search search,Model model ,HttpSession session ) throws Exception {
		
	System.out.println("PlannerRestController------------------getPlannerList");
	 
//		User user= (User)session.getAttribute("user");
//		int userCode=user.getUserCode();
//		planner.setUser(user);
//		System.out.println("userCode?:"+userCode);
		
		int pageUnit = 10;
		int pageSize = 10;
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("search ??? :"+search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		//map.put("userCode", user);
		map = plannerService.getAllPlannerList(map);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("today", com.youlove.common.DateFormat.today());
		System.out.println(search);
		System.out.println(map.get("list"));
		return "forward:/planner/getAllPlannerList.jsp";
	}
	
	// 2. route
	
	@RequestMapping( value="addRoute", method=RequestMethod.GET )
	public String addRoute(@RequestParam("plannerCode") int plannerCode, HttpSession session) throws Exception {

		System.out.println("PlannerController -------------------addRoute:GET ");
		
		return "forward:/planner/addRoute.jsp";
	}
	
	@RequestMapping(value = "addRoute", method=RequestMethod.POST)
	public String addRoute(HttpServletRequest request, HttpSession session,@ModelAttribute("route") Route route) throws Exception{

		System.out.println("PlannerController ----------------------- addRoute start");
		//session에 담긴 plannerCode 받아와서 set 
		int plannerCode=((Integer)session.getAttribute("plannerCode")).intValue();
		System.out.println(plannerCode);
		route.setPlannerCode(plannerCode);    
	
		//planner 버전 set 
		route.setPlannerVer(1);
		
		//departDate 받아와서 set 
		Planner planner=plannerService.getPlanner(plannerCode);
		String departDate=planner.getDepartDate();
		System.out.println(departDate);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date=null;
		
		try {
			date=dateFormat.parse(departDate);  
			
		}catch(ParseException e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(date);
		
		//addRoute jsp form value 배열에 담기. 
		String[] cityNames = request.getParameterValues("cityName");
		String[] lats = request.getParameterValues("lat");
		String[] lngs = request.getParameterValues("lng");
		//String[] cityOrders = request.getParameterValues("cityOrder");
		String[] stayDays = request.getParameterValues("stayDay");
		
		for (int i = 0; i < cityNames.length; i++) {
		System.out.println(" city name : "+cityNames[i]+" lat: "+lats[i]+" lng : "+lngs[i]+" order : "+i+" stay day :"+stayDays[i]);
		System.out.println(cityNames.length+"번 addRoute !!!!!!");
		
		route.setCityName(cityNames[i]);
		route.setLat(lats[i]);
		route.setLng(lngs[i]);
		route.setCityOrder(i+1);
		route.setStayDay(Integer.parseInt(stayDays[i]));
		//String startDate = dateFormat.format(cal.getTime());
		//cal.add(Calendar.DATE, Integer.parseInt(stayDays[i]));
		//String endDate = dateFormat.format(cal.getTime());
		route.setStartDate(cal.getTime());
		cal.add(Calendar.DATE, Integer.parseInt(stayDays[i]));
		route.setEndDate(cal.getTime());
		
		plannerService.addRoute(route);
		
		}

		return "forward:/planner/getScheduleList.jsp";
			
		}
	
	@RequestMapping(value="getRoute" , method= RequestMethod.GET)
	public String getRoute( @RequestParam("routeCode") int routeCode , Model model) throws Exception {
		
		System.out.println("PlannerRestController--------getRoute:GET");
		
		Route route = plannerService.getRoute(routeCode);

		model.addAttribute("route", route);
		
		return "forward:/planner/getScheduleList.jsp";
	}

	
	@RequestMapping( value="updateRoute", method=RequestMethod.GET )
	public String updateRoute(@RequestParam("plannerCode") int plannerCode, HttpSession session) throws Exception {

		System.out.println("PlannerController -------------------updateRoute:GET ");
		
		return "forward:/planner/updateRoute.jsp";  
	}
	
	@RequestMapping(value = "updateRoute", method=RequestMethod.POST)
	public String updateRoute( HttpServletRequest request, HttpSession session,@ModelAttribute("route") Route route,@ModelAttribute("schedule") Schedule schedule) throws Exception {
		
		System.out.println("PlannerController ----------------------- updateRoute start");
		
		int plannerCode=((Integer)session.getAttribute("plannerCode")).intValue();
		System.out.println("플래너 코드 :?"+plannerCode);
		route.setPlannerCode(plannerCode);    
		
		Planner planner=plannerService.getPlanner(plannerCode);
		
		//planner 버전 업그레이드 
		route.setPlannerVer(planner.getPlannerVer());  
		schedule.setPlannerVer(planner.getPlannerVer());  
		System.out.println("planner 버전???"+planner.getPlannerVer()
		+"route 버전 ??? "+route.getPlannerVer()+"schedule 버전 ??"+schedule.getPlannerVer());
		
		//departDate 받아와서 set 
		String departDate=planner.getDepartDate();
		System.out.println("여행출발일  :?"+departDate);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date=null;
		
		try {
			date=dateFormat.parse(departDate);   
			
		}catch(ParseException e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(date);
		
		//addRoute jsp form value 배열에 담기. 
		String[] cityNames = request.getParameterValues("cityName");
		String[] lats = request.getParameterValues("lat");
		String[] lngs = request.getParameterValues("lng");
		//String[] cityOrders = request.getParameterValues("cityOrder");
		String[] stayDays = request.getParameterValues("stayDay");
		
		for (int i = 0; i < cityNames.length; i++) {
		System.out.println(" city name : "+cityNames[i]+" lat: "+lats[i]+" lng : "+lngs[i]+" order : "+i+" stay day :"+stayDays[i]);
		System.out.println(cityNames.length+"번 addRoute !!!!!!");
		
		route.setCityName(cityNames[i]);
		route.setLat(lats[i]);
		route.setLng(lngs[i]);
		route.setCityOrder(i+1);
		route.setStayDay(Integer.parseInt(stayDays[i]));
		//String startDate = dateFormat.format(cal.getTime());
		//cal.add(Calendar.DATE, Integer.parseInt(stayDays[i]));
		//String endDate = dateFormat.format(cal.getTime());
		route.setStartDate(cal.getTime());
		cal.add(Calendar.DATE, Integer.parseInt(stayDays[i]));
		route.setEndDate(cal.getTime());
		
		plannerService.addRoute(route);
		}

		return "forward:/planner/getScheduleList.jsp";
			
		}
	

	//3. schedule 

	@RequestMapping(value = "addSchedule")
	public String addSchedule(HttpSession session, HttpServletRequest request, HttpServletResponse response,@ModelAttribute("schedule") Schedule schedule, @ModelAttribute("route") Route route) throws Exception{

		System.out.println("PlannerController------------------- addSchedule :POST start");
		//session에 담긴 plannerCode 받아와서 set
		int plannerCode=((Integer)session.getAttribute("plannerCode")).intValue();
		System.out.println(plannerCode);
		schedule.setPlannerCode(plannerCode);
		
		plannerService.addSchedule(schedule);

		return "forward:/planner/getScheduleList.jsp";
		}
	
}