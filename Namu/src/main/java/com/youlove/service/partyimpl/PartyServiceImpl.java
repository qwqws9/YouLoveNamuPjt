package com.youlove.service.partyimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Party;
import com.youlove.service.party.PartyDao;
import com.youlove.service.party.PartyService;

@Service("partyServiceImpl")
public class PartyServiceImpl implements PartyService{
	
	//Field
	@Autowired
	@Qualifier("partyDaoImpl")
	private PartyDao partyDao;
	public void setCommunityDao(PartyDao partyDao) {
		this.partyDao = partyDao;
	}
	
	//Constructor
	public PartyServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addParty(Party party) throws Exception {
		partyDao.addParty(party);
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
