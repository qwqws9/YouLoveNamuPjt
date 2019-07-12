package com.youlove.service.messageimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Message;
import com.youlove.service.message.MessageDao;
import com.youlove.service.message.MessageService;

@Service("messageServiceImpl")
public class MessageServiceImpl implements MessageService{
	
	//Field
	@Autowired
	@Qualifier("messageDaoImpl")
	private MessageDao messageDao;
	public void setCommunityDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	
	//Constructor
	public MessageServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getMessageList(Message message) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	


}
