package com.youlove.service.partyimpl;

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getParty(Party party) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getPartyList(Party party) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateParty(Party party) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteParty(Party party) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
		
}