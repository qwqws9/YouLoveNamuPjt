package com.youlove.web.wallet;

import java.util.HashMap;
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
	
	@RequestMapping(value="json/addWallet", method=RequestMethod.POST)
	public Wallet addWallet(@ModelAttribute("wallet") Wallet wallet, MultipartFile file, HttpServletRequest request) throws Exception{
		
		System.out.println("/wallet/json/addWallet :: POST");
		
		if(!file.isEmpty() && file != null){
			String fileName = FileNameUUId.convert(file, "wallet", request);
			
			wallet.setWalletImage(fileName);
		}

		System.out.println(wallet);
		
		walletService.addWallet(wallet);
		
		return wallet;
		
	}
	
	@RequestMapping(value = "/json/getWallet/{walletDetailCode}", method=RequestMethod.GET)
	public Wallet getWallet(@PathVariable int walletDetailCode) throws Exception{
		
		System.out.println("/wallet/json/getWallet :: GET");
		
		Wallet wallet = walletService.getWallet(walletDetailCode);
		System.out.println(wallet);
		
		return wallet;
		
	}
	
	@RequestMapping(value = "/json/deleteWallet/{walletDetailCode}", method=RequestMethod.GET)
	public Wallet deleteWallet(@PathVariable int walletDetailCode) throws Exception{
		
		System.out.println("/wallet/json/deleteWallet :: GET");
		
		walletService.deleteWallet(walletDetailCode);
		
		Wallet wallet = walletService.getWallet(walletDetailCode);
		
		return wallet;
		
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
	
	@RequestMapping(value = "/json/convert", method=RequestMethod.POST)
	public double convert(@RequestBody Map<String, Object> map) throws Exception{

		System.out.println("/wallet/json/convert :: POST");
		System.out.println("변경될 화폐 기준 : " + map.get("from") + ", 변경할 화폐 단위 : " + map.get("to") + ", 금액 : " + map.get("amount"));

		Double result = exchangeRatesService.convertExchangeRate((String)map.get("from"), (String)map.get("to"), Double.parseDouble((map.get("amount")).toString()));
		
		return result;
		
	}
	
}