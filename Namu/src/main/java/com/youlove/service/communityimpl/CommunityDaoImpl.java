package com.youlove.service.communityimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.common.Search;
import com.youlove.service.community.CommunityDao;
import com.youlove.service.domain.Community;



@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public CommunityDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCommunity(Community community) throws Exception {
		this.sqlSession.insert("CommunityMapper.addCommunity",community);
	}
	@Override
	public Community getCommunity(int communityCode) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommunity", communityCode);
	}
	@Override
	public List<Community> getCommunityList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getCommunityList", search);
	}
	@Override
	public void updateCommunity(Community community) throws Exception {
		this.sqlSession.update("CommunityMapper.updateCommunity", community);
	}
	@Override
	public void deleteCommunity(Community community) throws Exception {
		this.sqlSession.delete("CommunityMapper.deleteCommunity", community);
	}
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getTotalCount", search);
	}
	
		
}