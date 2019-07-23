package com.youlove.service.community;

import java.util.Map;

import com.youlove.service.domain.City;
import com.youlove.service.domain.Community;

public interface CommunityService {

	public void addCommunity(Community community) throws Exception;
	
	public Community getCommunity(int communityCode) throws Exception;
	
	public Map<String,Object> getCommunityList(Map<String,Object> map) throws Exception;
	
	public void updateCommunity(Community community) throws Exception;
	
	public void deleteCommunity(int communityCode) throws Exception;
	
	public void countCommunity(int communityCode) throws Exception;
	
	public Map<String,Object> getCommunityRelated (String communityBoard, City city)throws Exception;
}