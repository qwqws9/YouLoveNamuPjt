package com.youlove.web.planner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
	

		@RequestMapping(value = "/json/getRouteList", method = RequestMethod.POST)
		public HashMap<String, Object> getRouteList(HttpServletRequest request, @RequestParam HashMap<String, Object> requestParam) throws Exception {
			
		
			String contextPath = request.getContextPath();
			
			HashMap<String, Object> rmap = new HashMap<String, Object>();
			
			
			rmap.put("TYPE_SELECT", requestParam.get("typeSelect"));
			rmap.put("CALENDAR_SELECT", requestParam.get("calendarSelect"));
			rmap.put("start", requestParam.get("start"));
			rmap.put("end", requestParam.get("end"));
			
			// 결과정보를 저장할 HashMap
			HashMap<String, Object> responseBody = new HashMap<String, Object>();

			// 조회 목록을 저장할 List
			//List<HashMap<String, Object>> rlist = plannerService.getRouteList(searchMap, contextPath); ////!!!!확
			
			// 반환할 HashMap에 결과 List 저장
			//responseBody.put("rlist", rlist);
			
			return responseBody;
		}
		
		// 일정등록
		@RequestMapping(value = "/planner/addSchedule", method = RequestMethod.POST)
		public HashMap<String, Object> addSchedule(@RequestBody HashMap<String, Object> requestParam){
			 HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			try{
				//plannerService.addSchedule(requestParam);       //method 만들기1!!!!!
				resultMap.put("result", "SUCCESS");
			}catch(Exception e){
				resultMap.put("result", "FAIL");
				resultMap.put("errorMsg", e.getMessage());
			}

			return resultMap;
		}

	}

