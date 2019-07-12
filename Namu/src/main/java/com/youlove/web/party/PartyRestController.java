package com.youlove.web.party;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.service.party.PartyService;



//==> 회원관리 Controller
@RestController
@RequestMapping("/party/*")
public class PartyRestController {
	
	///Field
	@Autowired
	@Qualifier("partyServiceImpl")
	private PartyService partyService;
	//setter Method 구현 않음
		
	public PartyRestController(){
		System.out.println(this.getClass());
	}
	
	//int pageSize;
	//@Value("#{commonProperties['uploadPath']}")
	//String uploadPath;

}