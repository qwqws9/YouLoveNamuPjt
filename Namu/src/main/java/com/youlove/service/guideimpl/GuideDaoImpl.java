package com.youlove.service.guideimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.City;
import com.youlove.service.guide.GuideDao;

@Repository("guideDaoImpl")
public class GuideDaoImpl implements GuideDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	@Override
	public City getCity(String cityName) throws Exception {
		return sqlSession.selectOne("GuideMapper.getCity",cityName);
	}

	@Override
	public List<City> getCityList(String value) throws Exception {
		return sqlSession.selectList("GuideMapper.getCityList",value);
	}

}
