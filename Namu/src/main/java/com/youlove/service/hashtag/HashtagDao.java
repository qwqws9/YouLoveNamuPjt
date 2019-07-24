package com.youlove.service.hashtag;

import java.util.Map;

import com.youlove.service.domain.Hashtag;

public interface HashtagDao {

	public void addHashtag(Hashtag hashtag)throws Exception;
	
	public Hashtag getHashtag(Hashtag hashVO)throws Exception;
	
	public void updateHashtag(Hashtag hashtag)throws Exception;
	
	public void deleteHashtag(int hashtagCode)throws Exception;

	public void updateCode(Map<String,Object> map)throws Exception;
}
	
