package com.youlove.web.user;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.common.DateFormat;
import com.youlove.common.FileNameUUId;
import com.youlove.common.RandomNumber;
import com.youlove.common.api.CheckEmailTransfer;
import com.youlove.common.api.CheckSMSTransfer;
import com.youlove.common.api.NaverCaptcha;
import com.youlove.service.domain.Friend;
import com.youlove.service.domain.Hotel;
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Police;
import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.User;
import com.youlove.service.timeline.TimelineService;
import com.youlove.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("timelineServiceImpl")
	private TimelineService timelineService;
	
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
	
	
	
		@RequestMapping(value="json/addPolice",method=RequestMethod.POST)
		public boolean addPolice(@RequestBody Police police) throws Exception{
			
			System.out.println("/user/json/addPolice");
			
			police.setPoliceDate(DateFormat.minute());
			boolean result = userService.addPolice(police);
			
			return result;
		}
		
		@RequestMapping(value="json/updatePolice",method=RequestMethod.POST)
		public boolean updatePolice(@RequestBody Police police) throws Exception{
			
			System.out.println("/user/json/updatePolice");
			
			boolean result = userService.updatePolice(police);
			
			return result;
		}
		
		
	
	
	
	
	@RequestMapping(value="json/multipleAdd",method=RequestMethod.POST)
	public List<User> multipleAdd(@RequestBody Map<String,String> map,Timeline timeline,Friend friend) throws Exception{
		
		System.out.println("/user/json/multipleAdd");
		List<User> list = new ArrayList<User>();
		boolean continueGo = true;
		System.out.println("여러명 친구 : "+map.get("multipleUser"));
		String[] mul = map.get("multipleUser").split("#");
		String sessionUser = map.get("sessionUser");
		for(int i = 1; i< mul.length; i++) {
			if(sessionUser.equals(mul[i])) {
				continue;
			}else {
				System.out.println("222222222222222222222222222222222222");
				continueGo = true;
				//이미 등록된 친구인지 판별
				friend.setUserCode(Integer.parseInt(sessionUser));
				friend.setFriendRole("1");
				List<Friend> friendList = userService.getFriendList(friend);
				
				for(Friend f : friendList) {
					
					if(Integer.parseInt(mul[i]) == f.getFriendCode().getUserCode() ) {
						continueGo = false;
						break;
					}
				}
				
				if(continueGo) {
					System.out.println("3333333333333333333333333333333333333");
					//타임라인에 신청중인지 판별
					List<Timeline> timelineList = timelineService.getTimelineList(new User(Integer.parseInt(sessionUser)));
					
					for(Timeline t : timelineList) {
						//프로토콜이 2(친구) 이면서     초대 수락여부를 선택하지 않은 타임라인 중
						if(t.getProtocol().equals("2") && t.getInviteCode().equals("0")) {
							// 초대 메시지를 보낸 유저가 타임라인 보낸유저 이거나 타임라인 받은 유저 이면 ( 수락 대기중이므로 버튼 비활성화 )
							if(t.getFromUser().getUserCode() == Integer.parseInt(mul[i]) || t.getToUser().getUserCode() == Integer.parseInt(mul[i])  ) {
								continueGo = false;
								break;
							}
						}
					}
				}
				if(continueGo) {
					System.out.println("444444444444444444444444444444444444444444");
					timeline.setFromUser(new User(Integer.parseInt(sessionUser)));
					timeline.setToUser(new User(Integer.parseInt(mul[i])));
					timeline.setProtocol(map.get("protocol"));
					timeline.setTimeDate(DateFormat.minute());
					timelineService.addTimeline(timeline);
					list.add(new User(Integer.parseInt(mul[i])));
				}
			}
			
		}
		return list;
	}
	
	
	
	
	// 초대한유저,받는유저,롤 넣어주기
	@RequestMapping(value="json/inviteUser",method=RequestMethod.POST)
	public boolean inviteUser(@RequestBody Friend friend) throws Exception{
		
		System.out.println("/user/json/inviteUser");
		
		boolean result = userService.inviteUser(friend);
		
		return result;
	}
	
	
	
	@RequestMapping(value="json/addFriendMemo",method=RequestMethod.POST)
	public boolean addFriendMemo(@RequestBody Friend friend) throws Exception{
		
		System.out.println("/user/json/addFriendMemo");
		if(friend.getMemo() == null || friend.getMemo().length() == 0) {
			friend.setMemo(" ");
		}
		boolean result = userService.addFriendMemo(friend);
		
		return result;
	}
	
	
	
	// 1 친구 2 동행 3 일행
	// 조회시 세션 유저코드 + 검색할 Role 번호 넘겨주기
	@RequestMapping(value="json/getFriend",method=RequestMethod.POST)
	public List<Friend> getFriend(@RequestBody Friend friend) throws Exception{
		
		System.out.println("/user/json/getFriend");
		
		System.out.println("+++++++++++++++++++++++++");
		System.out.println(friend.toString());
		System.out.println("+++++++++++++++++++++++++");
		
		List<Friend> list = userService.getFriendList(friend);
		
		return list;
	}
	
	
	
	
	@RequestMapping(value="json/addPay",method=RequestMethod.POST)
	public boolean addPay(@RequestBody Pay pay) throws Exception{
		
		boolean result = userService.addPay(pay);
		
		return result;
	}
	
	
	
	@RequestMapping(value="json/getUser", method=RequestMethod.POST)
	public List<User> getUser(@RequestBody User user) throws Exception {
		
		System.out.println("/user/json/getUser");
		
		List<User> listUser = userService.searchUser(user);
	
		
		return listUser;
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
	public Map<String,Object> sendNum(@RequestBody Map<String, Object> param,HttpServletRequest request) throws Exception {
		
		System.out.println("/user/json/sendNum");
		
		String target = (String)param.get("target");
		System.out.println(target);
		String receiver = (String)param.get("receiver");
		System.out.println(receiver);
		
		
		//param.get("position") 요청 보내는곳
		Map<String,Object> map = new HashMap<>();
		
		String number = RandomNumber.getRandom();
		//String content = "YouLovePlan 회원가입 인증번호는 " + number +" 입니다.";
		String content = number;
		String title = "[YouLovePlan] 인증메일 입니다";
		
		map.put("checkNum", number);
		
		if(target.equals("email")) {
			CheckEmailTransfer.gmailSend(title, content, receiver,request);
		
			map.put("target", "email");
		
		}else if(target.equals("phone")) {
			content = "[YouLovePlan] 요청하신 인증번호는 " + number + " 입니다.";
			boolean result = CheckSMSTransfer.smsSend(smsId, smsKey, content, receiver);
//			boolean result = true;
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
	public Map<String, Object> createCaptcha(HttpServletRequest request) throws Exception{
		
		StringBuffer str = NaverCaptcha.createKey(captchaId, captchaSecret);
		JSONObject json = new JSONObject();
		JSONParser parse = new JSONParser();
		json = (JSONObject)parse.parse(str.toString());
		String key = (String)json.get("key");
		
		String image = NaverCaptcha.requestImage(captchaId, captchaSecret,key,request);
		
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
	      String fileName = "defaultProfile.jpg";
	      if(!file.isEmpty() && file != null){
	        fileName = FileNameUUId.convert(file, "profile", request);
	         System.out.println(fileName + "         파일이름 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	        
	      }
	      
	      map.put("userCode", userCode);
	      map.put("target", "img");
	      map.put("value", fileName);
	      
	      
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
	
	
	//전체 회원조회
	@RequestMapping("json/getUserList")
	public List<User> getUserList(@RequestBody Map<String,Object> map) throws Exception {
		
		System.out.println("/user/json/getUserList");
		
		List<User> list = userService.getUserList(map);
		System.out.println(list.toString());
		return list;
	}
	
	
	// 접근 제한
	@RequestMapping(value ="json/setUserBlock", method=RequestMethod.POST)
	public boolean setUserBlock(@RequestBody User user) throws Exception {
		
		
		
		System.out.println("/user/json/setUserBlock");
		
		System.out.println(user.toString());
		System.out.println("---------------------");
		
		if(!user.getStartBlock().equals("0")) {
			user = DateFormat.block(user);
		}else {
			user.setStartBlock(null);
			user.setEndBlock(null);
		}
		System.out.println("---------------------");
		System.out.println(user.getStartBlock());
		System.out.println(user.getEndBlock());
		System.out.println("---------------------");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("target", "block");
		map.put("start", user.getStartBlock());
		map.put("end",user.getEndBlock());
		map.put("userCode", user.getUserCode());
		
		return userService.updateUser(map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
