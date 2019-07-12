package com.youlove.service.message;

import com.youlove.service.domain.Message;

public interface MessageService {
	
	public void addMessage(Message message) throws Exception;
	
	public void getMessage(Message message) throws Exception;
	
	public void getMessageList(Message message) throws Exception;
	
	public void deleteMessage(Message message) throws Exception;
	
}