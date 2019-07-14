package com.youlove.service.hashtag;

import com.youlove.service.domain.Hashtag;

public interface HashtagService {

	
	public void addHashtag(Hashtag hashtag)throws Exception;
	
	public void getHashtag(Hashtag hashtag)throws Exception;
	
	public void updateHashtag(Hashtag hashtag)throws Exception;
	
	public void deleteHashtag(Hashtag hashtag)throws Exception;

}