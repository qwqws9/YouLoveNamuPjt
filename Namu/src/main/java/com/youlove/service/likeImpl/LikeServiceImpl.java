package com.youlove.service.likeImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Like;
import com.youlove.service.like.LikeDao;
import com.youlove.service.like.LikeService;

@Service("likeServiceImpl")
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	@Qualifier("likeDaoImpl")
	private LikeDao likeDao;

	@Override
	public void addLike(Like like) throws Exception {
		likeDao.addLike(like);
	}

	@Override
	public void deleteLike(Like like) throws Exception {
		likeDao.deleteLike(like);
	}

	@Override
	public Like getCount(Like like) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
