package com.youlove.service.chatbotimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.chatbot.ChatbotDao;
import com.youlove.service.domain.Chatbot;

@Repository("chatbotDaoImpl")
public class ChatbotDaoImpl implements ChatbotDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//Constructor
	public ChatbotDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Chatbot getChatbot(String keyword) throws Exception{
		
		return sqlSession.selectOne("ChatbotMapper.getChatbot", keyword);
	}

}
