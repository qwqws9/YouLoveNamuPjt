package com.youlove.web.party;

import java.util.HashMap;
import java.util.Map;

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
		//회원정보
		//User user = (User) session.getAttribute("user");
		//party.setPartyWriter(user);
		User user = new User();
		user.setUserCode(2);
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
		
		modelAndView.setViewName("/party/getParty?partyCode="+party.getPartyCode());
		System.out.println("\nPartyController:::addParty() 끝:::");
		return modelAndView;
	}
	
	@RequestMapping(value="getParty",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getParty(@RequestParam(value="partyCode")int partyCode )throws Exception{
		System.out.println("\nPartyController:::getParty() 시작:::");
		ModelAndView modelAndView = new ModelAndView();
		Map<String,Object> map = new HashMap<String, Object>();
		
		System.out.println("1");
		System.out.println(partyCode);
		//동행
		Party party = partyService.getParty(partyCode);
		//해쉬태그
		System.out.println("2");
		map = hashtagService.getHashtag(partyCode);
		System.out.println("3");
		modelAndView.addObject("hashtag", map.get("hashtag"));
		//댓글
		//modelAndView.addObject("boardCode",partyCode);
		//modelAndView.addObject("detailCode",);
		modelAndView.addObject("party", party);
		System.out.println("4");
		System.out.println(party);
		modelAndView.setViewName("/party/getParty.jsp");
		System.out.println("5");
		System.out.println("\nPartyController:::getParty() 끝:::");
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