package com.youlove.service.partyimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.common.Search;
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
	public Party getParty(int partyCode) throws Exception {
		
		return partyDao.getParty(partyCode);
	}

	@Override
	public Map<String,Object> getPartyList(Map<String,Object> map) throws Exception {
		Search search = (Search) map.get("search");
		List<Party> list = partyDao.getPartyList(map);
		int totalCount = partyDao.getTotalCount(search);
		map.put("totalCount", new Integer(totalCount));
		map.put("list", list);
		return map;
	}

	@Override
	public void updateParty(Party party) throws Exception {
		partyDao.updateParty(party);
	}

	@Override
	public boolean deleteParty(int partyCode) throws Exception {
		partyDao.deleteParty(partyCode);
		return true;
	}
	
	


}
