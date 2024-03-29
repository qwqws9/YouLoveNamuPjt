package com.youlove.service.like;

import java.util.Map;

import com.youlove.service.domain.Like;

public interface LikeService {
	
public void addLike(Like like) throws Exception;
	
	public void deleteLike(Like like) throws Exception;
	
	public Like getCount(Like like) throws Exception;
	
	public boolean checkLike(Map<String,Object> map) throws Exception;
	
	public int countLike(Like like) throws Exception;

}
