package com.youlove.web.party;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.common.Page;
import com.youlove.common.Search;
import com.youlove.service.hashtag.HashtagService;
import com.youlove.service.party.PartyService;



//==> PartyRestController
@RestController
@RequestMapping("/party/*")
public class PartyRestController {
	
	///Field
	@Autowired
	@Qualifier("partyServiceImpl")
	private PartyService partyService;
	@Autowired
	@Qualifier("hashtagServiceImpl")
	private HashtagService hashtagService;

	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
			
	public PartyRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getPartyList",method=RequestMethod.POST)
	public Map<String, Object> getPartyList(@RequestBody Search search)throws Exception{
		System.out.println("\nPartyRestController:::getPartyList() 시작:::");
		Map<String,Object> map = new HashMap<String, Object>();
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		System.out.println(search.getSearchKeyword());
		//게시물 리스트
		map.put("search", search);
		map = partyService.getPartyList(map);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("resultPage", resultPage);
		
		System.out.println("\nPartyRestController:::getPartyList() 끝:::");
		return map;
	}

}