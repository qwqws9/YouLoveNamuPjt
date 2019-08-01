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
public class ChatbotRestController {
	
	@Autowired
	@Qualifier("chatbotServiceImpl")
	private ChatbotService chatbotService;
	
	public ChatbotRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getChatbot", method=RequestMethod.POST)
	public Chatbot getChatbot(@RequestBody Chatbot chatbot) throws Exception{
	
		//keywordType ::::: 1-플래너 // 2-커뮤니티 // 3-동행
		//keyword ::::: client가 입력한 text값 
		String keywordType = chatbot.getKeywordType();
		System.out.println("keywordType : " + keywordType);
		String keyword = chatbot.getKeyword();
		System.out.println("keyword : " + keyword);
				
		System.out.println("chatbot : " + chatbot);
		
		if(keyword.trim().length() <=0) {
			 // 잘못들어온것
			System.out.println("키워드 없음");
			return chatbot;
		}else {
			System.out.println("json/getChatbot 정상 실행 :: ");
		 
			//service getChatbot 호출
			//Chatbot dbChatbot = chatbotService.getChatbot(chatbot);
			chatbotService.getChatbot(keyword);
			//chatbotService.getChatbot(keywordType);
			// 서비스 -> 다오(db) -> 조건절에  keyword 을 like 또는 == 비교해서 출력값 string 값만 리턴해주면 
			//Chatbot dbChatbot = (Chatbot) chatbotService.getChatbot(chatbotService.getChatbot(keyword));
						
			return chatbot;
		}	
	}
	
//	@RequestMapping(value="json/getChatbot", method=RequestMethod.POST)
//	public ModelAndView getChatbot(@ModelAttribute("chatbot") Chatbot chatbot) throws Exception{
//	
//		ModelAndView modelandView = new ModelAndView();
//		modelandView.setViewName("/chatbot/chatbot.jsp");
//		
//		System.out.println("json/getChatbot 정상 실행 :: ");
//		return modelandView;
//	}
}
