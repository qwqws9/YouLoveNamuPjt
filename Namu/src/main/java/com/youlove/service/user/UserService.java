package com.youlove.service.user;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.Friend;
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Police;
import com.youlove.service.domain.User;


public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(Map<String,Object> map) throws Exception;
	
	public boolean getCheckUser(String nickname) throws Exception;
	
	public boolean updateUser(Map<String,Object> map) throws Exception;
	
	public List<User> getUserList(Map<String,Object> map) throws Exception;
	
	public List<Pay> getPayList(int userCode) throws Exception;
	
	public boolean addPay(Pay pay) throws Exception;
	
	public List<Friend> getFriendList(Friend friend) throws Exception;
	
	public boolean addFriendMemo(Friend friend) throws Exception;
	
	public boolean inviteUser(Friend friend) throws Exception;
	
	public boolean addPolice(Police police) throws Exception;
	
	public List<Police> getPoliceList() throws Exception;
	
	public boolean updatePolice(Police police) throws Exception;
	
	public List<User> searchUser(User user) throws Exception;
	
}

