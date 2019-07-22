package com.youlove.web.party;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.domain.City;
import com.youlove.service.domain.Hashtag;
import com.youlove.service.domain.Party;
import com.youlove.service.domain.User;
import com.youlove.service.hashtag.HashtagService;
import com.youlove.service.party.PartyService;



//==> party Controller
@Controller
@RequestMapping("/party/*")
public class PartyController {
	
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
	
	public PartyController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addParty",method=RequestMethod.POST)
	public ModelAndView addParty(@ModelAttribute("party") Party party,
									@RequestParam(value="cityName")String cityName,
									@RequestParam(value="hashtag", required=false)String hashtag,
									HttpSession session)throws Exception{
		System.out.println("\nPartyController:::addParty() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/party/getParty");
		//회원정보
		User user = (User) session.getAttribute("user");
		party.setPartyWriter(user);
		//국가, 도시
		City city = new City();
		city.setCityName(cityName);
		party.setCity(city);
		//동행 등록
		partyService.addParty(party);
		//HashTag
		Hashtag hashVo = new Hashtag();
		hashVo.setHashtag(hashtag);
		hashVo.setWriter(user);
		hashVo.setCommunityCode(party.getPartyCode());
		hashtagService.addHashtag(hashVo);
		
		
		System.out.println(party);
		System.out.println("\nPartyController:::addParty() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="getParty",method=RequestMethod.GET)
	public ModelAndView getParty(@ModelAttribute("party") Party party)throws Exception{
		System.out.println("\nPartyController:::addParty() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/party/getParty.jsp");
		
		System.out.println("\nPartyController:::addParty() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="getPartyList")
	public ModelAndView getPartyList(@ModelAttribute("party") Party party)throws Exception{
		System.out.println("\nPartyController:::addParty() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/party/getPartyList.jsp");
		
		System.out.println("\nPartyController:::addParty() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="updateParty",method=RequestMethod.POST)
	public ModelAndView updateParty(@ModelAttribute("party") Party party)throws Exception{
		System.out.println("\nPartyController:::addParty() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/party/updateParty.jsp");
		
		System.out.println("\nPartyController:::addParty() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteParty",method=RequestMethod.POST)
	public ModelAndView deleteParty(@ModelAttribute("party") Party party)throws Exception{
		System.out.println("\nPartyController:::addParty() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/party/deleteParty.jsp");
		
		System.out.println("\nPartyController:::addParty() 끝:::");
		return modelAndView;
	}
}