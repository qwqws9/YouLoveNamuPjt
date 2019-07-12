package com.youlove.service.user;

import com.youlove.service.domain.User;



public interface UserDao {
	
	public void addUser(User user) throws Exception ;

	public User getUser(String info) throws Exception ;
	
	public String getCheckUser(String nickname) throws Exception;

	

	
	
	
	
}