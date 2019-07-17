package com.youlove.service.hashtag;

import java.util.Map;

import com.youlove.service.domain.Hashtag;

public interface HashtagService {

	
	public void addHashtag(Hashtag hashtag)throws Exception;
	
	public Map<String, Object> getHashtag(int hashtagCode)throws Exception;
	
	public void updateHashtag(Hashtag hashtag)throws Exception;
	
	public void deleteHashtag(Hashtag hashtag)throws Exception;
	
	public void updateCode(Boolean where, int theCode , int hashtagCode)throws Exception;
}