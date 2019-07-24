package com.youlove.service.hashtagimpl;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Hashtag;
import com.youlove.service.hashtag.HashtagDao;




@Repository("hashtagDaoImpl")
public class HashtagDaoImpl implements HashtagDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//Constructor
	public HashtagDaoImpl() {
		System.out.println(this.getClass());
	}
	@Override
	public void addHashtag(Hashtag hashtag) throws Exception {
		this.sqlSession.insert("HashtagMapper.addHashtag",hashtag);
	}
	@Override
	public Hashtag getHashtag(Hashtag hashVO) throws Exception {
		return sqlSession.selectOne("HashtagMapper.getHashtag",hashVO);
	}
	@Override
	public void updateHashtag(Hashtag hashtag) throws Exception {
		
	}
	@Override
	public void deleteHashtag(int hashtagCode) throws Exception {
		this.sqlSession.delete("HashtagMapper.deleteHashtag",hashtagCode);
	}
	@Override
	public void updateCode(Map<String,Object> map) throws Exception {
		sqlSession.update("HashtagMapper.updateCode", map);
	}

		
}