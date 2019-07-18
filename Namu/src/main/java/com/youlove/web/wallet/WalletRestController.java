package com.youlove.web.wallet;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	
	@Value("#{commonProperties['walletUploadPath']}")
	String walletUploadPath;
	
	@RequestMapping(value="json/addWallet", method=RequestMethod.POST)
	public Wallet addWallet(@ModelAttribute("wallet") Wallet wallet, MultipartFile file) throws Exception{
		
		System.out.println("/wallet/json/addWallet :: POST");
		
		if(!file.isEmpty() && file != null){
			String fileName = file.getOriginalFilename(); // 파일이름.확장명
			file.transferTo(new File(walletUploadPath + fileName));
			
			wallet.setWalletImage(fileName);
		}

		System.out.println(wallet);
		
		walletService.addWallet(wallet);
		
		return wallet;
		
	}
	
	@RequestMapping(value="json/getWalletList", method=RequestMethod.POST)
	public Map getWalletList (@RequestBody Search search, int walletCode) throws Exception{
		
		System.out.println("/wallet/json/getWalletlist : POST");
		System.out.println(":: " + search);
		
		Map<String, Object> map = walletService.getWalletList(search, walletCode);
		
		return map;
		
	}
	
}