package com.youlove.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.common.FileNameUUId;
import com.youlove.common.GetAge;
import com.youlove.service.domain.Friend;
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Timeline;
import com.youlove.service.domain.User;
import com.youlove.service.timeline.TimelineService;
import com.youlove.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("timelineServiceImpl")
	private TimelineService timelineService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	
	
	
	
	
	@RequestMapping(value="/getPayList",method=RequestMethod.GET)
	public String getPayList(HttpServletRequest request,Model model,Map<String,Object> map,HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		List<Pay> list = userService.getPayList(user.getUserCode());
		
		model.addAttribute("list",list);
		
		return "forward:/user/payList.jsp";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@ModelAttribute User user,HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam(required = false) boolean saveId,@RequestParam(required = false) boolean autoLogin) throws Exception{
		
		System.out.println("/user/login : POST");
		
		System.out.println(user.getUserId() + "  qweqwewqeqeqeqweqweqweqweqweqwe");
		
		Map<String,Object> map = new HashMap<>();
		map.put("login", user.getUserId());
		
		User dbUser = userService.getUser(map);
		
		
		session.setAttribute("user", dbUser);
		String sessionId = "";
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for(int i =0; i < cookies.length; i++) {
				Cookie js = cookies[i];
				if(js.getName().equals("JSESSIONID")) {
					sessionId = js.getValue();
				}
			}
		}
		map.clear();
		map.put("userCode", dbUser.getUserCode());
		map.put("target", "token");
		map.put("value", sessionId);
		userService.updateUser(map);
		Cookie c = new Cookie("users",dbUser.getNickname());
		//c.setDomain("http://192.168.0.13:8005");
		c.setMaxAge(365 * 24 * 60 * 60);
		c.setPath("/");
		response.addCookie(c);
		if(saveId) {
			c = new Cookie("saveId",dbUser.getEmail());
			c.setMaxAge(365 * 24 * 60 * 60);
			c.setPath("/");
			response.addCookie(c);
		}
		if(autoLogin) {
			c = new Cookie("autoLogin",dbUser.getEmail());
			c.setMaxAge(365 * 24 * 60 * 60);
			c.setPath("/");
			response.addCookie(c);
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/loginView",method=RequestMethod.GET)
	public String loginView(HttpServletRequest request,Model model,Map<String,Object> map,HttpSession session) throws Exception{
		
		System.out.println("/user/loginView : GET");
		Cookie[] cookie = request.getCookies();
		for(Cookie c : cookie) {
			if(c.getName().equals("autoLogin")) {
				map.put("login", c.getValue());
				User user = userService.getUser(map);
				session.setAttribute("user", user);
				return "/";
			}else if(c.getName().equals("saveId")) {
				model.addAttribute("saveId",c.getValue());
			}
		}
		
      	
		model.addAttribute("boardCode","5");
		model.addAttribute("detailCode","12345");
		
		
		return "forward:/user/loginView.jsp";
	}
	
	@RequestMapping(value="/addUser", method= RequestMethod.GET)
	public String addUser() throws Exception {
		
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUser.jsp";
	}
	
	@RequestMapping(value="/findInfo", method= RequestMethod.GET)
	public String findInfo() throws Exception {
		
		System.out.println("/user/findInfo : GET");
		
		return "redirect:/user/findInfo.jsp";
	}
	
	@RequestMapping(value="/addUser", method= RequestMethod.POST)
	public String addUserA(@ModelAttribute User user, MultipartFile profileImage,HttpServletRequest request) throws Exception {
		
		System.out.println("/user/addUser : POST");
		
		String fileName = FileNameUUId.convert(profileImage,"profile",request);
		
		if(fileName.equals("NotImage")) {
			fileName = "7877e8c81ac0a942265a9b65a049b784.jpg";
		}
		user.setProfileImg(fileName);
		
		String gender = user.getGender();
		
		if(gender.equals("1") || gender.equals("3")) {
			user.setGender("M");
		}else {
			user.setGender("F");
		}
		
		userService.addUser(user);
		
		//회원가입 성공 후 프로필미리보기 구현하기
		return "/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		System.out.println("/user/logout");
		
		Cookie[] cookies = request.getCookies();

		if(cookies != null){

			for(Cookie c : cookies) {
				if(c.getName().equals("autoLogin")) {
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
				}
			}
		}
		
		session.removeAttribute("user");
		
		return "/";
	}
	
	@RequestMapping("/getUser")
	public String getUser(HttpSession session) throws Exception {
		
		System.out.println("/user/getUser");
		
		//session.removeAttribute("user");
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping("/getUserList")
	public String getUserList(Model model,Map<String,Object> map) throws Exception {
		
		System.out.println("/user/getUserList");
		
		map.put("order", "1");
		map.put("role", "all");
		List<User> list = userService.getUserList(map);
		
		model.addAttribute("list",list);
		
		
		return "forward:/user/getUserList.jsp";
	}
	
	
	
	@RequestMapping("/searchUserClick/{userCode}")
	public String searchUserClick(@PathVariable int userCode,Map<String,Object> map,Model model,HttpSession session,Friend friend) throws Exception {
		
		System.out.println("/user/searchUserClick");
		
		map.put("userCode", userCode);
		
		User user = userService.getUser(map);
		
		//나이
		String birth = user.getBirth();
		int age = GetAge.getAge(Integer.parseInt(birth.substring(0, 2))+1900, Integer.parseInt(birth.substring(2, 4)), Integer.parseInt(birth.substring(4, 6)));
		user.setBirth(age+"세");
		
		//성별
		String gender = user.getGender();
		if(gender.equals("M")) {
			user.setGender("남자");
		}else {
			user.setGender("여자");
		}
		
		
		model.addAttribute("userForm",user);
		
		int sessionCode = ((User)session.getAttribute("user")).getUserCode();
		// 자기자신을 조회시 모든 버튼 비활성화
		if(sessionCode == userCode) {
			model.addAttribute("thisUser","true");
		}else {

			//이미 등록된 친구인지 판별
			friend.setUserCode(sessionCode);
			friend.setFriendRole("1");
			List<Friend> list = userService.getFriendList(friend);
			
			for(Friend f : list) {
				
				if(userCode == f.getFriendCode().getUserCode() ) {
					System.out.println("내가 클릭한 유저 코드"+userCode);
					System.out.println("여기는 위랑 같아야함"+f.getFriendCode().getUserCode());
					model.addAttribute("friendAl","true");
				}
			}
			
			
			//타임라인에 신청중인지 판별
			List<Timeline> timeline = timelineService.getTimelineList(new User(sessionCode));
			
			for(Timeline t : timeline) {
				//프로토콜이 2(친구) 이면서     초대 수락여부를 선택하지 않은 타임라인 중
				if(t.getProtocol().equals("2") && t.getInviteCode().equals("0")) {
					// 초대 메시지를 보낸 유저가 타임라인 보낸유저 이거나 타임라인 받은 유저 이면 ( 수락 대기중이므로 버튼 비활성화 )
					if(t.getFromUser().getUserCode() == userCode || t.getToUser().getUserCode() == userCode  ) {
						model.addAttribute("timelineFriend","true");
					}
				}
			}
		}
		
		
		
		return "forward:/user/searchUserClick.jsp";
	}
	
	
}
