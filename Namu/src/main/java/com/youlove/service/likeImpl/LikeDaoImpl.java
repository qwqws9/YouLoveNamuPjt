package com.youlove.service.likeImpl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Like;
import com.youlove.service.like.LikeDao;

@Repository("likeDaoImpl")
public class LikeDaoImpl implements LikeDao {
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	@Override
	public void addLike(Like like) throws Exception {
		sqlSession.insert("LikeMapper.addLike",like);
	}

	@Override
	public void deleteLike(Like like) throws Exception {
		sqlSession.insert("LikeMapper.deleteLike",like);
		
	}

	@Override
	public Like getCount(Like like) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkLike(Map<String, Object> map) throws Exception {
		
		
		return sqlSession.selectOne("LikeMapper.checkLike",map);
	}

	@Override
	public int countLike(Like like) throws Exception {
		return sqlSession.selectOne("LikeMapper.countLike",like);
	}

}
