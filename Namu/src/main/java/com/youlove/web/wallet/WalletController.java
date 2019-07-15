package com.youlove.web.wallet;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.service.wallet.WalletService;

@Controller
@RequestMapping("/wallet/*")
public class WalletController {
	
	///Field
	@Autowired
	@Qualifier("walletServiceImpl")
	private WalletService walletService;
	
	///Constructor
	public WalletController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="walletList", method=RequestMethod.GET)
	public ModelAndView getWalletList(@RequestParam(value="walletCode") int walletCode) throws Exception{
		
		System.out.println("/wallet/getWalletList : GET");
		
		Map<String, Object> map = walletService.getWalletList(walletCode);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.setViewName("/wallet/walletList.jsp");
		
		return modelAndView;
		
	}
	
}