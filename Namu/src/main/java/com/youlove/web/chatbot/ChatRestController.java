package com.youlove.web.chatbot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.service.chatbot.ChatbotService;
import com.youlove.service.domain.Chatbot;

@RestController
@RequestMapping("/chatbot/*")
public class ChatRestController {
	
	@Autowired
	@Qualifier("chatbotServiceImpl")
	private ChatbotService chatbotService;
	
	public ChatRestController(){
		System.out.println(this.getClass());
	}
	
	
	  @RequestMapping(value="json/getChatbot", method=RequestMethod.POST)
	  public String getChatbot(@RequestBody Chatbot chatbot) throws Exception{
		  
		 String keyword = chatbot.getKeyword();
		 
		 if(keyword.trim().length() <0) {
			 // 잘못들어온것
			 return "실패";
		 }else {
			 System.out.println(keyword);
			 
			 // 서비스 -> 다오(db) -> 조건절에  keyword 을 like 또는 == 비교해서 출력값 string 값만 리턴해주면  
			 return "성공"; // 리턴된값  return 해주면
		 }
	


	 
	  
	  }
	 
	
	
	

}
