package com.youlove.service.party;

import com.youlove.service.domain.Party;

public interface PartyService {
	
	public void addParty(Party party) throws Exception;
	public void getParty(Party party) throws Exception;
	public void getPartyList(Party party) throws Exception;
	public void updateParty(Party party) throws Exception;
	public void deleteParty(Party party) throws Exception;
}