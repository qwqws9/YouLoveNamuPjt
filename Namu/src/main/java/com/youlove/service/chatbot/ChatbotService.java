package com.youlove.service.chatbot;

import com.youlove.service.domain.Chatbot;

public interface ChatbotService {
	
	//keyword로 answer확인
	public Chatbot getChatbot(String keyword) throws Exception;
}
