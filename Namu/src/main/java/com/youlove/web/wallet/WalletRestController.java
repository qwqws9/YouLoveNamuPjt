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
	
	@RequestMapping(value="json/getWalletList/{walletCode}")
	public Map<String, Object> getWalletList (@PathVariable int walletCode, @RequestBody Search search) throws Exception{
		
		System.out.println("/wallet/json/getWalletList :: GET / POST");
		
		System.out.println(walletCode);
		System.out.println(search);
		
		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("walletCode", walletCode);
		
		map = walletService.getWalletList(map);
		
		return map;
		
	}
	
}