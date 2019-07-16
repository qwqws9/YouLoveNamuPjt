package com.youlove.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.common.FileNameUUId;
import com.youlove.service.domain.User;
import com.youlove.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/loginView",method=RequestMethod.GET)
	public String loginView(HttpServletRequest request,Model model) throws Exception{
		
		System.out.println("/user/loginView : GET");
		System.out.println(request.getRealPath("/"));
		
		model.addAttribute("boardCode1",5);
		model.addAttribute("detailCode1","12345");
		
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
	public String addUserA(@ModelAttribute User user, MultipartFile profileImage) throws Exception {
		
		System.out.println("/user/addUser : POST");
		
		String fileName = FileNameUUId.convert(profileImage,"profileImage");
		
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
	public String logout(HttpSession session) throws Exception {
		
		System.out.println("/user/logout");
		
		session.removeAttribute("user");
		
		return "/";
	}
	
	
	
}
