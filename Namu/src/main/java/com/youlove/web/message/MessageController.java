package com.youlove.web.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.domain.Message;
import com.youlove.service.message.MessageService;



//==> 회원관리 Controller
@Controller
@RequestMapping("/message/*")
public class MessageController {
	
	///Field
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	//setter Method 구현 않음
		
	public MessageController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addMessage",method=RequestMethod.POST)
	public ModelAndView addMessage(@ModelAttribute("message") Message message)throws Exception{
		System.out.println("\nMessageController:::addMessage() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/message/addMessage.jsp");
		
		
		System.out.println("\nMessageController:::addMessage() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="getMessage",method=RequestMethod.POST)
	public ModelAndView getMessage(@ModelAttribute("message") Message message)throws Exception{
		System.out.println("\nMessageController:::getMessage() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/message/getMessage.jsp");
		
		
		System.out.println("\nMessageController:::getMessage() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="getMessageList",method=RequestMethod.POST)
	public ModelAndView getMessageList(@ModelAttribute("message") Message message)throws Exception{
		System.out.println("\nMessageController:::getMessageList() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/message/getMessageList.jsp");
		
		
		System.out.println("\nMessageController:::addMessage() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteMessage",method=RequestMethod.POST)
	public ModelAndView deleteMessage(@ModelAttribute("message") Message message)throws Exception{
		System.out.println("\nMessageController:::deleteMessage() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/message/deleteMessage.jsp");
		
		
		System.out.println("\nMessageController:::deleteMessage() 끝:::");
		return modelAndView;
	}
	
	
}