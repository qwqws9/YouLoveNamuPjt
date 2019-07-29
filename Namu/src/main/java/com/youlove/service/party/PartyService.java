package com.youlove.service.party;

import java.util.Map;

import com.youlove.service.domain.Party;

public interface PartyService {
	
	public void addParty(Party party) throws Exception;
	
	public Party getParty(int partyCode) throws Exception;
	
	public Map<String,Object> getPartyList(Map<String, Object> map) throws Exception;
	
	public void updateParty(Party party) throws Exception;
	
	public boolean deleteParty(int partyCode) throws Exception;
}