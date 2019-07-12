package com.youlove.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.youlove.service.domain.User;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="loginView",method=RequestMethod.GET)
	public String loginView() throws Exception{
		
		System.out.println("/user/loginView : GET");
		
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping(value="addUser", method= RequestMethod.GET)
	public String addUser() throws Exception {
		
		System.out.println("/user/addUser : GET");
		
		
		return "redirect:/user/addUser.jsp";
	}
	
	
	
}
