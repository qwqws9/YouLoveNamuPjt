package com.youlove.service.chatbotimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.chatbot.ChatbotDao;
import com.youlove.service.chatbot.ChatbotService;
import com.youlove.service.domain.Chatbot;

@Service("chatbotServiceImpl")
public class ChatbotServiceImpl implements ChatbotService{
	
	@Autowired
	@Qualifier("chatbotDaoImpl")
	private ChatbotDao chatbotDao;
	
	//Constructor
	public ChatbotServiceImpl() {
		System.out.println(this.getClass());
	}

	public Chatbot getChatbot(String keyword) throws Exception{
		
		return chatbotDao.getChatbot(keyword);
	}

}
