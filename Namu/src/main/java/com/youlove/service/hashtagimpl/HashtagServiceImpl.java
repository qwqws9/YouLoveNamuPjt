package com.youlove.service.hashtagimpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Hashtag;
import com.youlove.service.hashtag.HashtagDao;
import com.youlove.service.hashtag.HashtagService;


@Service("hashtagServiceImpl")
public class HashtagServiceImpl implements HashtagService{
	
	//Field
	@Autowired
	@Qualifier("hashtagDaoImpl")
	private HashtagDao hashtagDao;
	public void setHashtagDao(HashtagDao hashtagDao) {
		this.hashtagDao = hashtagDao;
	}
	
	//Constructor
	public HashtagServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addHashtag(Hashtag hashtag) throws Exception {
		hashtagDao.addHashtag(hashtag);
	}

	@Override
	public void getHashtag(Hashtag hashtag) throws Exception {
		hashtagDao.getHashtag(hashtag);
	}

	@Override
	public void updateHashtag(Hashtag hashtag) throws Exception {
		hashtagDao.updateHashtag(hashtag);
	}

	@Override
	public void deleteHashtag(Hashtag hashtag) throws Exception {
		hashtagDao.deleteHashtag(hashtag);
	}
	

}
