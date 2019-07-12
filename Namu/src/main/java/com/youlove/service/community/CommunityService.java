package com.youlove.service.community;

import java.util.Map;

import com.youlove.common.Search;
import com.youlove.service.domain.Community;

public interface CommunityService {

	public void addCommunity(Community community) throws Exception;
	
	public Community getCommunity(int communityCode) throws Exception;
	
	public Map<String,Object> getCommunityList(Search search) throws Exception;
	
	public void updateCommunity(Community community) throws Exception;
	
	public void deleteCommunity(Community community) throws Exception;
	
}