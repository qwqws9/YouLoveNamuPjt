package com.youlove.web.chatbot;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chatbot/*")
public class ChatRestController {
	
	//@Autowired
	//@Qualifier
	//private ChatbotService chatbotService;
	public ChatRestController() {
		System.out.println("챗봇 생성자");
	}
	
	

}
