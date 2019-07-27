package com.youlove.web.wallet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.youlove.common.FileNameUUId;
import com.youlove.common.Search;
import com.youlove.service.domain.Exchange;
import com.youlove.service.domain.Wallet;
import com.youlove.service.wallet.ExchangeRatesService;
import com.youlove.service.wallet.WalletService;

@RestController
@RequestMapping("/wallet/*")
public class WalletRestController {
	
	@Autowired
	@Qualifier("walletServiceImpl")
	private WalletService walletService;
	
	@Autowired
	@Qualifier("exchangeRatesServiceImpl")
	private ExchangeRatesService exchangeRatesService;
	
	public WalletRestController() {
		System.out.println(this.getClass());
	}
	
	// walletListView.jsp
	@RequestMapping(value = "/json/isWallet/{plannerCode}", method=RequestMethod.GET)
	public int isWallet(@PathVariable int plannerCode) throws Exception{
		
		System.out.println("/wallet/json/isWallet :: GET");
		
		int is = walletService.isWallet(plannerCode);
		System.out.println(is);
		
		int walletCode = 0;
		
		if(is != 0) {
			walletCode = walletService.getWalletCode(plannerCode);
		}
		
		return walletCode;
		
	}
	
	@RequestMapping(value = "/json/addWalletView/{plannerCode}", method=RequestMethod.GET)
	public int addWalletView(@PathVariable int plannerCode) throws Exception{
		
		System.out.println("/wallet/json/addWalletView :: GET");
		
		walletService.addWalletView(plannerCode);
		
		int walletCode = walletService.getWalletCode(plannerCode);
		System.out.println(walletCode);
		
		return walletCode;
		
	}
	
	@RequestMapping(value = "/json/deleteWalletView/{walletCode}", method=RequestMethod.GET)
	public boolean deleteWalletView(@PathVariable int walletCode) throws Exception{
		
		System.out.println("/wallet/json/deleteWalletView :: GET");
		
		
		walletService.deleteWalletView(walletCode);
		
		return true;
		
	}
	
	// walletList.jsp
	@RequestMapping(value="json/addWallet", method=RequestMethod.POST)
	public boolean addWallet(@ModelAttribute("wallet") Wallet wallet, MultipartFile file, HttpServletRequest request) throws Exception{
		
		System.out.println("/wallet/json/addWallet :: POST");
		
		if(!file.isEmpty() && file != null){
			String fileName = FileNameUUId.convert(file, "wallet", request);
			
			wallet.setWalletImage(fileName);
		}

		System.out.println(wallet);
		
		walletService.addWallet(wallet);
		
		return true;
		
	}
	
	@RequestMapping(value = "/json/getWallet/{walletDetailCode}", method=RequestMethod.GET)
	public Wallet getWallet(@PathVariable int walletDetailCode) throws Exception{
		
		System.out.println("/wallet/json/getWallet :: GET");
		
		Wallet wallet = walletService.getWallet(walletDetailCode);
		System.out.println(wallet);
		
		return wallet;
		
	}
	
	@RequestMapping(value = "/json/deleteWallet/{walletDetailCode}", method=RequestMethod.GET)
	public boolean deleteWallet(@PathVariable int walletDetailCode) throws Exception{
		
		System.out.println("/wallet/json/deleteWallet :: GET");
		
		walletService.deleteWallet(walletDetailCode);
		
		return true;
		
	}
	
	@RequestMapping(value="json/getWalletList/{walletCode}")
	public Map<String, Object> getWalletList (@PathVariable int walletCode, @RequestBody Search search) throws Exception{
		
		System.out.println("/wallet/json/getWalletList :: GET / POST");
		System.out.println(walletCode);
		System.out.println(search);
		
		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("walletCode", walletCode);
		
		map = walletService.getWalletList(map);
		map.put("search", search);
		
		return map;
		
	}
	
	// https://ko.exchange-rates.org CRAWLING
	@RequestMapping(value = "/json/exchangeRates", method=RequestMethod.POST)
	public List<Exchange> exchangeRates() throws Exception{

		System.out.println("/wallet/json/exchangeRates :: POST");
		
		List<Exchange> list = exchangeRatesService.exchangeRates();
		
		return list;
		
	}
	
	@RequestMapping(value = "/json/convert", method=RequestMethod.POST)
	public Exchange convert(@RequestBody Exchange exchange) throws Exception{

		System.out.println("/wallet/json/convert :: POST");
		System.out.println(exchange);

		//exchange = exchangeRatesService.convertExchangeRate(exchange);
		
		return exchangeRatesService.convertExchangeRate(exchange);
		
	}
	
}