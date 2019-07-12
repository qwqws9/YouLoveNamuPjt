package com.youlove.service.walletimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.domain.Wallet;
import com.youlove.service.wallet.WalletDao;

@Service("walletServiceImpl")
public class WalletServiceImpl {

	///Field
	@Autowired
	@Qualifier("walletDaoImpl")
	private WalletDao walletDao;
	
	///Constructor
	public WalletServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	// walletListView.jsp
	/*
	public void addWalletView(Wallet wallet) throws Exception{
		walletDao.addWalletView(wallet);
	}
	
	public void deleteWalletView(int walletCode) throws Exception{
		walletDao.deleteWalletView(walletCode);
	}
	
	public Map<String, Object> getWalletListView(int plannerCode) throws Exception {
		List<Wallet> list = walletDao.getWalletListView(plannerCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	*/

	// walletList.jsp
	public void addWallet(Wallet wallet) throws Exception{
		walletDao.addWallet(wallet);
	}
	
	public Wallet getWallet(int walletDetailCode) throws Exception{
		return walletDao.getWallet(walletDetailCode);
	}
	
	public void updateWallet(Wallet wallet) throws Exception{
		walletDao.updateWallet(wallet);
	}
	
	public void deleteWallet(int walletDetailCode) throws Exception{
		walletDao.deleteWallet(walletDetailCode);
	}
	
	public Map<String, Object> getWalletList(int walletDetailCode) throws Exception {
		List<Wallet> list = walletDao.getWalletList(walletDetailCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
}