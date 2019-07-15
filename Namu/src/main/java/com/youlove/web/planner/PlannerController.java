package com.youlove.web.planner;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
import com.youlove.service.domain.Planner;

import com.youlove.service.planner.PlannerService;

@Controller
@RequestMapping("/planner/*")
public class PlannerController {
	
	///Field
	@Autowired
	@Qualifier("plannerServiceImpl")
	private PlannerService plannerService;
	
	
	public PlannerController(){
		System.out.println(this.getClass());
	}

	
	@RequestMapping( value="addPlanner", method=RequestMethod.POST )
	//@RequestMapping("/addRoute.do")
	public String addPlanner( @ModelAttribute("planner") Planner planner, HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PlannerController :: addPlanner start");

		//Business Logic	
		
		//plan.setManuDate(route.getManuDate().replace("-", ""));
		//routeService.addRoute(route);
		
		return "forward:/planner/addRoute.jsp";
	}
	
@RequestMapping(value = "addRoute")
public String addRoute(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("route") Route route) throws Exception{

	System.out.println("PlannerController :: addRoute start");
	
	String[] cityNames = request.getParameterValues("cityName");
	String[] lats = request.getParameterValues("lat");
	String[] lngs = request.getParameterValues("lng");
	//String[] cityOrders = request.getParameterValues("cityOrder");
	String[] stayDays = request.getParameterValues("stayDay");
	
	route.setPlannerCode(1);
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

	plannerService.addRoute(route);
	}

	return "forward:/planner/getSchedule.jsp";
		
	}

//@RequestMapping(value="getInterestedEventList")
//public String getRouteList(@RequestParam int plannerCode, Model model) throws Exception {
//	System.out.println("PlannerRestController--------getRouteList");
//	
//	List<Route> list = plannerService.getRouteList(plannerCode);
//	model.addAttribute("routeList", list);
//	
//	return "forward:/planner/getRoute.jsp";
	
//}

}