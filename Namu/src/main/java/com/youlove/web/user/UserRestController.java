package com.youlove.web.user;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.codehaus.jackson.map.util.JSONPObject;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.common.FileNameUUId;
import com.youlove.common.RandomNumber;
import com.youlove.common.api.CheckEmailTransfer;
import com.youlove.common.api.CheckSMSTransfer;
import com.youlove.common.api.NaverCaptcha;
import com.youlove.service.domain.User;
import com.youlove.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{apiProperties['smsKey']}")
	String smsKey;
	
	@Value("#{apiProperties['smsId']}")
	String smsId;
	
	@Value("#{apiProperties['captchaId']}")
	String captchaId;
	
	@Value("#{apiProperties['captchaSecret']}")
	String captchaSecret;
	
	@Value("#{commonProperties['captchaPath']}")
	String captchaPath;
	
	
	@RequestMapping(value="json/getUser", method=RequestMethod.POST)
	public User getUser(@RequestBody Map<String,Object> map) throws Exception {
		
		System.out.println("/user/json/getUser");
		
		User user = userService.getUser(map);
	
		
		return user;
	}

	
	
	
	
	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) throws Exception {
		
		System.out.println("/user/json/login");
		
		Map<String,Object> map = new HashMap<>();
		map.put("login", user.getUserId());
		
		User dbUser = userService.getUser(map);
		
		if(dbUser != null) {
			if( user.getPassword().equals(dbUser.getPassword())){
			//session.setAttribute("user", dbUser);
			
			}else {
				dbUser = null;
			}
		}
		
	
		
		return dbUser;
	}
	
	@RequestMapping(value="json/findInfo", method=RequestMethod.POST)
	public User findInfo(@RequestBody Map<String,Object> req) throws Exception {
		
		System.out.println("/user/json/findInfo");
		
		System.out.println(req.get("name") + "1");
		System.out.println(req.get("email") + "2");
		System.out.println(req.get("phone") + "3");
		System.out.println(req.get("target") + "4");
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("findInfo", req.get("name"));
		
		if(req.get("phone") == "") {
			map.put("email", req.get("email"));
		}else {
			map.put("phone", req.get("phone"));
		}
		
		User dbUser = userService.getUser(map);
		
		if(req.get("target").equals("id") ) {
			dbUser.setPassword("");
		}else {
			String pass = RandomStringUtils.randomAlphabetic(10);
			map.clear();
			map.put("userCode", dbUser.getUserCode());
			map.put("target", "password");
			map.put("value", pass);
			userService.updateUser(map);
			dbUser.setPassword(pass);
		}
		
		
		
		return dbUser;
	}
	
	@RequestMapping(value="json/findInfoCheck", method=RequestMethod.POST)
	public boolean findInfoCheck(@RequestBody User user) throws Exception {
		
		System.out.println("/user/json/findInfoCheck");
		
		Map<String,Object> map = new HashMap<>();
		map.put("findInfo", user.getName());
		
		if(user.getPhone() == null || user.getPhone().equals("")) {
			map.put("email", user.getEmail());
		}else {
			map.put("phone", user.getPhone());
		}
		
		User dbUser = userService.getUser(map);
		
		
		return dbUser == null ? false : true;
	}
	
	
	@RequestMapping(value="json/checkNick/{nick}", method=RequestMethod.GET)
	public boolean checkNick(@PathVariable String nick) throws Exception {
		
		System.out.println("/user/json/checkNick/{nick}");
		
		System.out.println(nick);
		
		boolean	result = userService.getCheckUser(nick);
		
		
		
		return result;
	}
	
	@RequestMapping(value="json/sendNum", method=RequestMethod.POST)
	public Map<String,Object> sendNum(@RequestBody Map<String, Object> param) throws Exception {
		
		System.out.println("/user/json/sendNum");
		
		String target = (String)param.get("target");
		System.out.println(target);
		String receiver = (String)param.get("receiver");
		System.out.println(receiver);
		
		
		//param.get("position") 요청 보내는곳
		Map<String,Object> map = new HashMap<>();
		
		String number = RandomNumber.getRandom();
		String content = "YouLovePlan 회원가입 인증번호는 " + number +" 입니다.";
		String title = "[YouLove]회원가입 인증메일";
		
		map.put("checkNum", number);
		
		if(target.equals("email")) {
			CheckEmailTransfer.gmailSend(title, content, receiver);
		
			map.put("target", "email");
		
		}else if(target.equals("phone")) {
//			boolean result = CheckSMSTransfer.smsSend(smsId, smsKey, content, receiver);
			boolean result = true;
			System.out.println(result);
			if(result == true) {
				map.put("target", "phone");
			}else {
				map.put("target", "error");
			}
			
		}
		return map;
	}
	
	@RequestMapping(value="/json/createCaptcha", method=RequestMethod.POST)
	public Map<String, Object> createCaptcha() throws Exception{
		
		StringBuffer str = NaverCaptcha.createKey(captchaId, captchaSecret);
		JSONObject json = new JSONObject();
		JSONParser parse = new JSONParser();
		json = (JSONObject)parse.parse(str.toString());
		String key = (String)json.get("key");
		
		String image = NaverCaptcha.requestImage(captchaId, captchaSecret,key);
		
		Map<String, Object> map = new HashMap<>();
		map.put("image", image);
		map.put("key", key);
		
		return map;
		
	}
	
	@RequestMapping(value="/json/compareCaptcha", method=RequestMethod.POST)
	public boolean compareCaptcha(@RequestBody Map<String,Object> map) throws Exception{
		
		String key = (String)map.get("key");
		String userKey = (String)map.get("userKey");
		StringBuffer str = NaverCaptcha.compareCaptcha(captchaId, captchaSecret, key, userKey);
		JSONObject json = new JSONObject();
		JSONParser parse = new JSONParser();
		json = (JSONObject)parse.parse(str.toString());
		boolean result = (boolean)json.get("result");
		
		return result;
		
	}
	
	@RequestMapping(value="/json/updateImg/{userCode}", method=RequestMethod.POST)
	public User updateImg(MultipartFile file,HttpServletRequest request,@PathVariable String userCode,Map<String,Object> map,HttpSession session) throws Exception{
		
		if(!file.isEmpty() && file != null){
			String fileName = FileNameUUId.convert(file, "profile", request);
			System.out.println(fileName + "         파일이름 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			map.put("userCode", userCode);
			map.put("target", "img");
			map.put("value", fileName);
		}
//		
		
		boolean result = userService.updateUser(map);
		User user;
		
		if(result == true) {
			session.removeAttribute("user");
			map.clear();
			map.put("userCode", Integer.parseInt(userCode));
			user = userService.getUser(map);
			session.setAttribute("user", user);
			
		}else {
			user = null;
		}
		
		return user;
		
	}
	
	
	
	@RequestMapping(value="/json/updateUser", method=RequestMethod.POST)
	public User updateUser(@RequestBody Map<String,Object> map,HttpSession session) throws Exception{
		
		
		
		boolean result = userService.updateUser(map);
		User user;
		
		if(result == true) {
			session.removeAttribute("user");
			String userCode = (String)map.get("userCode");
			map.clear();
			map.put("userCode", Integer.parseInt(userCode));
			user = userService.getUser(map);
			session.setAttribute("user", user);
			
		}else {
			user = null;
		}
		
		return user;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
