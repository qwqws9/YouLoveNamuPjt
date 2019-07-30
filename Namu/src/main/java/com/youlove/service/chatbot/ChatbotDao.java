package com.youlove.service.chatbot;

import com.youlove.service.domain.Chatbot;

public interface ChatbotDao {
	
	//keyword로 정보 select one
	public Chatbot getChatbot(String keyword) throws Exception;
	
}
