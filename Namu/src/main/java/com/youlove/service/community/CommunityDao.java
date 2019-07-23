package com.youlove.service.community;

import java.util.List;
import java.util.Map;

import com.youlove.common.Search;
import com.youlove.service.domain.Community;

public interface CommunityDao {

	public void addCommunity(Community community) throws Exception;
	
	public Community getCommunity(int communityCode) throws Exception;
	
	public List<Community> getCommunityList(Map<String,Object> map) throws Exception;
	
	public List<Community> getCommunityBestList(Map<String,Object> map) throws Exception;
	
	public void updateCommunity(Community community) throws Exception;
	
	public void deleteCommunity(int communityCode) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;

	public void countCommunity(Community community) throws Exception;
	
	public List<Community> getCommunityRelated (Map<String,Object> map) throws Exception;
}
	
