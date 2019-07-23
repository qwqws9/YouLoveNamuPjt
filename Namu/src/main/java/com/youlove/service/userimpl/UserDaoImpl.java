package com.youlove.service.userimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Pay;
import com.youlove.service.domain.User;
import com.youlove.service.user.UserDao;


@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}

	public User getUser(Map<String,Object> map) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", map);
	}
	
	public String getCheckUser(String nickname) throws Exception {
		return sqlSession.selectOne("UserMapper.getCheckUser", nickname);
	}

	@Override
	public int updateUser(Map<String, Object> map) throws Exception {
			
		return sqlSession.update("UserMapper.updateUser",map);
	}

	@Override
	public List<User> getUserList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", map);
	}

	@Override
	public List<Pay> getPayList(int userCode) throws Exception {
		return sqlSession.selectList("UserMapper.getPayList",userCode);
	}

	@Override
	public int addPay(Pay pay) throws Exception {
		return sqlSession.insert("UserMapper.addPay",pay);
	}
	
	
}