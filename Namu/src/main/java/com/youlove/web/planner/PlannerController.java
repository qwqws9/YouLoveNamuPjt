package com.youlove.web.planner;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.service.domain.Route;
import com.youlove.service.domain.Schedule;
import com.youlove.service.domain.User;
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

		System.out.println("PlannerController ------addPlanner:GET start");

		return "forward:/planner/addPlanner.jsp";
	}
	
	@RequestMapping( value="addPlanner", method=RequestMethod.POST )
	public String addPlanner( @ModelAttribute("planner") Planner planner, @RequestParam("file") MultipartFile file, HttpSession session) throws Exception {

		System.out.println("PlannerController -----addPlanner:POST start");

		User user= (User)session.getAttribute("user");
		
		planner.setUser(user);
		System.out.println(user);
		String path="//Users//minikim//eclipse-workspace//YouLovePlanMini2//WebContent//resources//images//plannerImage";
		//String path="//Users//minikim//git//YouLovePlanMini//WebContent//resources//images//plannerImage";
		
		String fileName=file.getOriginalFilename();
		planner.setPlannerImage(fileName);
		FileOutputStream fileOutputStream;
		
		try {
			//nf.createNewFile();
			//fileOutputStream= new FileOutputStream(path+"\\"+fileName);
			fileOutputStream= new FileOutputStream(path+"//"+fileName);
			fileOutputStream.write(file.getBytes());
			fileOutputStream.close();
		}
		catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}	
		
		//planner.setDepartDate(planner.getDepartDate().replace("-", ""));
		System.out.println(planner);
		plannerService.addPlanner(planner);
		System.out.println("plannerController --------addPlanner:POST  end");
		return "forward:/planner/addRoute.jsp";
	}
	
	// 2. route
	@RequestMapping(value = "addRoute")
	public String addRoute(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("route") Route route) throws Exception{

		System.out.println("PlannerController :: addRoute start");
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
		
		Date date=null;
		
		try {
			date=dateFormat.parse("201908011000");     //getDepartDate 로 변경하기!!!!!
			
		}catch(ParseException e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(date);
		
		String[] cityNames = request.getParameterValues("cityName");
		String[] lats = request.getParameterValues("lat");
		String[] lngs = request.getParameterValues("lng");
		//String[] cityOrders = request.getParameterValues("cityOrder");
		String[] stayDays = request.getParameterValues("stayDay");
		
//		route.setPlannerCode(1);    //getPlannerCode로!!!!!!!!! 변경 
		route.setPlannerVer(1);


		for (int i = 0; i < cityNames.length; i++) {
		System.out.println(" city name : "+cityNames[i]+" lat: "+lats[i]+" lng : "+lngs[i]+" order : "+i+" stay day :"+stayDays[i]);
		System.out.println(cityNames.length+"번 addRoute !!!!!!");
		//Date start=2019-08-01;
		
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


	//일정작성 
	@RequestMapping(value = "addSchedule")
	public String addSchedule(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("schedule") Schedule schedule, @ModelAttribute("route") Route route) throws Exception{

		System.out.println("PlannerController :: addSchedule :POST start");
		//route.setRouteCode(10073);  ~~~route code route... 
		plannerService.addSchedule(schedule);

		return "forward:/planner/getScheduleList.jsp";
		}

}