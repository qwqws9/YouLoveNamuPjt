package com.youlove.service.communityimpl;

import java.util.List;
import java.util.Map;

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
	public List<Community> getCommunityList(Map<String,Object> map) throws Exception {
		Search search = (Search) map.get("search");
		System.out.println("여기는 Dao = "+search.getEndRowNum());
		System.out.println("여기는 Dao = "+search.getStartRowNum());
		map.put("endRowNum", search.getEndRowNum());
		map.put("startRowNum",search.getStartRowNum());
		map.put("searchCondition",search.getSearchCondition());
		map.put("searchKeyword",search.getSearchKeyword());
		return sqlSession.selectList("CommunityMapper.getCommunityList", map);
	}
	@Override
	public void updateCommunity(Community community) throws Exception {
		this.sqlSession.update("CommunityMapper.updateCommunity", community);
	}
	@Override
	public void deleteCommunity(int communityCode) throws Exception {
		this.sqlSession.delete("CommunityMapper.deleteCommunity", communityCode);
	}
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getTotalCount", search);
	}

	@Override
	public void countCommunity(Community community) throws Exception {
		this.sqlSession.update("CommunityMapper.countCommunity", community);
	}

	@Override
	public List<Community> getCommunityBestList(Map<String, Object> map) throws Exception {
		Search search = (Search) map.get("search");
		map.put("endRowNum", search.getEndRowNum());
		map.put("startRowNum",search.getStartRowNum());
		map.put("searchCondition",search.getSearchCondition());
		map.put("searchKeyword",search.getSearchKeyword());
		return sqlSession.selectList("CommunityMapper.getCommunityBestList", map);
	}

	@Override
	public List<Community> getCommunityRelated(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("CommunityMapper.getCommunityRelated", map);
	}

	
		
}