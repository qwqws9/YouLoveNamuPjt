package com.youlove.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	
	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) throws Exception {
		
		System.out.println("/user/json/login");
		
		User dbUser = userService.getUser(user.getUserId());
		
		if(dbUser != null) {
			if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			}
		}
		
		return dbUser;
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
		
		Map<String,Object> map = new HashMap<>();
		
		String number = RandomNumber.getRandom();
		String content = "YouLovePlan 회원가입 인증번호는 " + number +" 입니다.";
		String title = "[YouLove]회원가입 인증메일";
		
		map.put("checkNum", number);
		
		if(target.equals("email")) {
			CheckEmailTransfer.gmailSend(title, content, receiver);
		
			map.put("target", "email");
		
		}else if(target.equals("phone")) {
			boolean result = CheckSMSTransfer.smsSend(smsId, smsKey, content, receiver);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
