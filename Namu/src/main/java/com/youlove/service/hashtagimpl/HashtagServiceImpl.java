package com.youlove.service.hashtagimpl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		System.out.println("\nHashtagService:::addHashtag() 시작:::");
		hashtagDao.addHashtag(hashtag);
		System.out.println("\nHashtagService:::addHashtag() 끝:::");
	}

	@Override
	public Map<String, Object> getHashtag(int hashtagCode) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Hashtag hashtag = hashtagDao.getHashtag(hashtagCode);
		String hashtagParse = hashtag.getHashtag();
		String[] words = hashtagParse.split("#");
		List<String> hashtagList = new ArrayList<String>();
		for(String word : words) {
			String sharp = "#";
			sharp+=word.trim();
			hashtagList.add(sharp);
		}
		hashtagList.remove(0);
		
		map.put("hashtag", hashtagList);
		return map;
	}

	@Override
	public void updateHashtag(Hashtag hashtag) throws Exception {
		hashtagDao.updateHashtag(hashtag);
	}

	@Override
	public void deleteHashtag(Hashtag hashtag) throws Exception {
		hashtagDao.deleteHashtag(hashtag);
	}

	@Override
	public void updateCode(Boolean where, int theCode , int hashtagCode) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashtagCode", hashtagCode);
		if(where) {
			map.put("communityCode", theCode);
		}else {
			map.put("partyCode", theCode);
		}
		hashtagDao.updateCode(map);
	}
	

}
