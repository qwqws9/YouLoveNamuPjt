package com.youlove.service.party;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.Party;

public interface PartyDao {

	public void addParty(Party party) throws Exception;
	
	public Party getParty(int partyCode) throws Exception;
	
	public List<Party> getPartyList(Map<String,Object> map) throws Exception;
	
	public void updateParty(Party party) throws Exception;
	
	public void deleteParty(int partyCode) throws Exception;		
}
	
