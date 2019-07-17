package com.youlove.service.communityimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.common.Search;
import com.youlove.service.community.CommunityDao;
import com.youlove.service.community.CommunityService;
import com.youlove.service.domain.Community;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService{
	
	//Field
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	//Constructor
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCommunity(Community community) throws Exception {
		communityDao.addCommunity(community);
	}
	@Override
	public Community getCommunity(int communityCode) throws Exception {
		Community community = communityDao.getCommunity(communityCode);
		communityDao.countCommunity(community);
		return communityDao.getCommunity(communityCode);
	}
	@Override
	public Map<String, Object> getCommunityList(Map<String,Object> map) throws Exception {
		Search search = (Search) map.get("search");
		List<Community> list = communityDao.getCommunityList(map);
		List<Community> bestlist = communityDao.getCommunityBestList(map);
		int totalCount = communityDao.getTotalCount(search);
		
		map.put("bestlist", bestlist);
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	@Override
	public void updateCommunity(Community community) throws Exception {
		communityDao.updateCommunity(community);
	}

	@Override
	public void deleteCommunity(int communityCode) throws Exception {
		communityDao.deleteCommunity(communityCode);
	}

	@Override
	public void countCommunity(int communityCode) throws Exception {
	}





}
