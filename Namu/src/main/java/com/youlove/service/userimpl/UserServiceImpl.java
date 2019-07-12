package com.youlove.service.userimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.User;
import com.youlove.service.user.UserDao;
import com.youlove.service.user.UserService;;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	public User getUser(String info) throws Exception {
		return userDao.getUser(info);
	}
	
	public boolean getCheckUser(String nickname) throws Exception {
		boolean result = true;
		if(userDao.getCheckUser(nickname) != null) {
			result = false;
		}
		
		return result;
		
	}

	
//	public boolean checkDuplication(String userId) throws Exception {
//		boolean result=true;
//		User user=userDao.getUser(userId);
//		if(user != null) {
//			result=false;
//		}
//		return result;
//	}
}