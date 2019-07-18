package com.model2.mvc.service.wallet.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.youlove.common.Search;
import com.youlove.service.domain.Wallet;
import com.youlove.service.wallet.WalletService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-common.xml",
								   "classpath:config/context-aspect.xml",
								   "classpath:config/context-mybatis.xml",
								   "classpath:config/context-transaction.xml"})
public class WalletServiceTest {

	@Autowired
	@Qualifier("walletServiceImpl")
	private WalletService walletService;
	
	//@Test
	public void testAddWallet() throws Exception{
		
		Wallet wallet = new Wallet();
		wallet.setWalletCode(1);
		wallet.setPart("0");
		wallet.setMoneyUnit("EUR");
		wallet.setExpression("5*2");
		wallet.setPrice(10);
		wallet.setRegDate("2018-08-25 11:02");
		wallet.setItem("아이스 아메리카노");
		wallet.setPayOption("0");
		wallet.setExchangeRate(1326.70);
		wallet.setCategory("0");
		
		walletService.addWallet(wallet);
		
		wallet = walletService.getWallet(11);
		
		System.out.println(wallet);
		
		Assert.assertEquals("EUR", wallet.getMoneyUnit());
		Assert.assertEquals("5*2", wallet.getExpression());
		Assert.assertEquals(10.0, wallet.getPrice(), 0.01);
		Assert.assertEquals("2018-08-25 11:02", wallet.getRegDate());
		Assert.assertEquals("아이스 아메리카노", wallet.getItem());
		Assert.assertEquals(1326.7, wallet.getExchangeRate(), 0.01);
		
	}
	
	//@Test
	public void testGetWallet() throws Exception{
		
		Wallet wallet = new Wallet();
		
		wallet = walletService.getWallet(6);
		
		System.out.println(wallet);
		
		Assert.assertEquals("EUR", wallet.getMoneyUnit());
		Assert.assertEquals("5*2", wallet.getExpression());
		Assert.assertEquals(10.0, wallet.getPrice(), 0.01);
		Assert.assertEquals("2018-08-25 11:02", wallet.getRegDate());
		Assert.assertEquals("아이스 아메리카노", wallet.getItem());
		Assert.assertEquals(1326.7, wallet.getExchangeRate(), 0.01);
		
	}
	
	@Test
	public void testGetWalletList() throws Exception{
		 
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		Map<String,Object> map = new HashMap<>();
		map.put("walletCode", 1);
		map.put("search", search);
		
		map = walletService.getWalletList(map);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	
	 	System.out.println(list);
	 	
	 	Assert.assertEquals(5, list.size());
	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	
	 	System.out.println("totalCount : " + totalCount);
	 	
	}
	
}