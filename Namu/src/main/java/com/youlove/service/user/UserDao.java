package com.youlove.service.user;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.User;



public interface UserDao {
	
	public void addUser(User user) throws Exception ;

	public User getUser(Map<String,Object> map) throws Exception ;
	
	public String getCheckUser(String nickname) throws Exception;

	public int updateUser(Map<String,Object> map) throws Exception;
	
	public List<User> getUserList(Map<String,Object> map) throws Exception;
	
	
	
	
}