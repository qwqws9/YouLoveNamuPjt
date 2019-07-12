package com.youlove.service.messageimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Message;
import com.youlove.service.message.MessageDao;



@Repository("messageDaoImpl")
public class MessageDaoImpl implements MessageDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public MessageDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMessage(Message message) throws Exception {
		
	}
	@Override
	public void getMessage(Message message) throws Exception {
		
	}
	@Override
	public void getMessageList(Message message) throws Exception {
		
	}
	@Override
	public void deleteMessage(Message message) throws Exception {
		
	}
	
		
}