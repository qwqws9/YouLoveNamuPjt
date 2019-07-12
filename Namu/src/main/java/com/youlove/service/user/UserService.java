package com.youlove.service.user;

import com.youlove.service.domain.User;


public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String info) throws Exception;
	
	public boolean getCheckUser(String nickname) throws Exception;
	
	
	
}