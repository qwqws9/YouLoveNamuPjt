package com.youlove.service.partyimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Party;
import com.youlove.service.party.PartyDao;



@Repository("partyDaoImpl")
public class PartyDaoImpl implements PartyDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public PartyDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addParty(Party party) throws Exception {
		this.sqlSession.insert("PartyMapper.addParty", party);
	}

	@Override
	public Party getParty(int partyCode) throws Exception {
		return sqlSession.selectOne("PartyMapper.getParty", partyCode);
	}

	@Override
	public List<Party> getPartyList(Map<String,Object> map) throws Exception {
		return null;
	}

	@Override
	public void updateParty(Party party) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteParty(int partyCode) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
		
}