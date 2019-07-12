package com.youlove.service.community;

import java.util.List;

import com.youlove.common.Search;
import com.youlove.service.domain.Community;

public interface CommunityDao {

	public void addCommunity(Community community) throws Exception;
	
	public Community getCommunity(int communityCode) throws Exception;
	
	public List<Community> getCommunityList(Search search) throws Exception;
	
	public void updateCommunity(Community community) throws Exception;
	
	public void deleteCommunity(Community community) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
}
	
