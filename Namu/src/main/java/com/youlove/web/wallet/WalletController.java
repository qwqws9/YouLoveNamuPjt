package com.youlove.web.wallet;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.youlove.common.Page;
import com.youlove.common.Search;
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
	
	@RequestMapping(value="getWalletList", method=RequestMethod.GET)
	public ModelAndView getWalletList(@RequestParam(value="walletCode") int walletCode) throws Exception{

		int pageUnit = 5;
		int pageSize = 5;
		
		System.out.println("/wallet/getWalletList : GET");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("walletCode", walletCode);
		map.put("search", search);
		
		map = walletService.getWalletList(map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.setViewName("/wallet/getWalletList.jsp");
		
		return modelAndView;
		
	}
	
}