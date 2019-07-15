package com.youlove.web.wallet;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.service.domain.Wallet;
import com.youlove.service.wallet.WalletService;

@RestController
@RequestMapping("/wallet/*")
public class WalletRestController {
	
	@Autowired
	@Qualifier("walletServiceImpl")
	private WalletService walletService;
	
	public WalletRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addWallet", method=RequestMethod.POST)
	public Wallet addWallet(@RequestBody Map<String, Object> wallet/*@RequestBody(required=true) Wallet wallet*/) throws Exception{
		
		System.out.println("/wallet/json/addWallet :: POST");
		
		System.out.println(wallet.get("regDate"));
		
		// walletService.addWallet(wallet);
		
		return new Wallet();
		
	}
	
	/*
	@RequestMapping(value="json/checkNick/{nick}", method=RequestMethod.GET)
	public boolean checkNick(@PathVariable String nick) throws Exception {
		
		System.out.println("/user/json/checkNick/{nick}");
		
		System.out.println(nick);
		
		boolean	result = userService.getCheckUser(nick);
		
		
		
		return result;
	}
	
	@RequestMapping(value="json/sendNum", method=RequestMethod.POST)
	public Map<String,Object> sendNum(@RequestBody Map<String, Object> param) throws Exception {
		
		System.out.println("/user/json/sendNum");
		
		String target = (String)param.get("target");
		System.out.println(target);
		String receiver = (String)param.get("receiver");
		System.out.println(receiver);
		
		Map<String,Object> map = new HashMap<>();
		
		String number = RandomNumber.getRandom();
		String content = "YouLovePlan 회원가입 인증번호는 " + number +" 입니다.";
		String title = "[YouLove]회원가입 인증메일";
		
		map.put("checkNum", number);
		
		if(target.equals("email")) {
			CheckEmailTransfer.gmailSend(title, content, receiver);
		
			map.put("target", "email");
		
		}else if(target.equals("phone")) {
			boolean result = CheckSMSTransfer.smsSend(smsId, smsKey, content, receiver);
			System.out.println(result);
			if(result == true) {
				map.put("target", "phone");
			}else {
				map.put("target", "error");
			}
			
		}
		return map;
	}
	
	@RequestMapping(value="/json/createCaptcha", method=RequestMethod.POST)
	public Map<String, Object> createCaptcha() throws Exception{
		
		StringBuffer str = NaverCaptcha.createKey(captchaId, captchaSecret);
		JSONObject json = new JSONObject();
		JSONParser parse = new JSONParser();
		json = (JSONObject)parse.parse(str.toString());
		String key = (String)json.get("key");
		
		String image = NaverCaptcha.requestImage(captchaId, captchaSecret,key);
		
		Map<String, Object> map = new HashMap<>();
		map.put("image", image);
		map.put("key", key);
		
		return map;
		
	}
	
	@RequestMapping(value="/json/compareCaptcha", method=RequestMethod.POST)
	public boolean compareCaptcha(@RequestBody Map<String,Object> map) throws Exception{
		
		String key = (String)map.get("key");
		String userKey = (String)map.get("userKey");
		StringBuffer str = NaverCaptcha.compareCaptcha(captchaId, captchaSecret, key, userKey);
		JSONObject json = new JSONObject();
		JSONParser parse = new JSONParser();
		json = (JSONObject)parse.parse(str.toString());
		boolean result = (boolean)json.get("result");
		
		return result;
		
	}
	*/
}