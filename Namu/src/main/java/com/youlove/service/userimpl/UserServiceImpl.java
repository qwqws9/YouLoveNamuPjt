package com.youlove.service.userimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Friend;
import com.youlove.service.domain.Pay;
import com.youlove.service.domain.Police;
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

	public User getUser(Map<String,Object> map) throws Exception {
		return userDao.getUser(map);
	}
	
	public boolean getCheckUser(String nickname) throws Exception {
		boolean result = true;
		if(userDao.getCheckUser(nickname) != null) {
			result = false;
		}
		
		return result;
		
	}

	@Override
	public boolean updateUser(Map<String, Object> map) throws Exception {
		System.out.println(map.toString() + "@@@@@@@@@@@@@@@@@@@@@@@@");
		int res = userDao.updateUser(map);
		boolean result = false;
		if(res != 0) {
			result = true;
		}
		return result;
	}

	@Override
	public List<User> getUserList(Map<String, Object> map) throws Exception {
		return userDao.getUserList(map);
	}

	@Override
	public List<Pay> getPayList(int userCode) throws Exception {
		return userDao.getPayList(userCode);
	}

	@Override
	public boolean addPay(Pay pay) throws Exception {
		int res = userDao.addPay(pay);
		boolean result = false;
		if(res != 0) {
			result = true;
		}
		return result;
	}

	@Override
	public List<Friend> getFriendList(Friend friend) throws Exception {
		return userDao.getFriendList(friend);
	}

	@Override
	public boolean addFriendMemo(Friend friend) throws Exception {
		int res = userDao.addFriendMemo(friend);
		boolean result = false;
		if(res != 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean inviteUser(Friend friend) throws Exception {
		int res = userDao.inviteUser(friend);
		boolean result = false;
		if(res != 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean addPolice(Police police) throws Exception {
		int res = userDao.addPolice(police);
		boolean result = false;
		if(res != 0) {
			result = true;
		}
		return result;
	}

	@Override
	public List<Police> getPoliceList() throws Exception {
		return userDao.getPoliceList();
	}

	@Override
	public boolean updatePolice(Police police) throws Exception {
		int res = userDao.updatePolice(police);
		boolean result = false;
		if(res != 0) {
			result = true;
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