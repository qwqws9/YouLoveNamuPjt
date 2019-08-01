package com.youlove.service.user;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.Friend;
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Police;
import com.youlove.service.domain.User;



public interface UserDao {
	
	public void addUser(User user) throws Exception ;

	public User getUser(Map<String,Object> map) throws Exception ;
	
	public String getCheckUser(String nickname) throws Exception;

	public int updateUser(Map<String,Object> map) throws Exception;
	
	public List<User> getUserList(Map<String,Object> map) throws Exception;
	
	public List<Pay> getPayList(int userCode) throws Exception;
	
	public int addPay(Pay pay) throws Exception;
	
	public List<Friend> getFriendList(Friend friend) throws Exception;
	
	public int addFriendMemo(Friend friend) throws Exception;
	
	public int inviteUser(Friend friend) throws Exception;
	
	public int addPolice(Police police) throws Exception;
	
	public List<Police> getPoliceList() throws Exception;
	
	public int updatePolice(Police police) throws Exception;
	
	public List<User> searchUser(User user) throws Exception;
	
}