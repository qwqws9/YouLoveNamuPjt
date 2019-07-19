package com.youlove.service.wallet;

import java.util.Map;

import com.youlove.service.domain.Wallet;

public interface WalletService {

	// walletListView.jsp
	/*
	public void addWalletView(Wallet wallet) throws Exception;
	
	public void deleteWalletView(int walletCode) throws Exception;
	
	public Map<String, Object> getWalletListView(int plannerCode) throws Exception;
	*/
	
	// walletList.jsp
	public void addWallet(Wallet wallet) throws Exception;
	
	public Wallet getWallet(int walletDetailCode) throws Exception;
	/*
	public void updateUser(Wallet wallet) throws Exception;
	
	public void deleteWallet(int walletDetailCode) throws Exception;
	*/
	public Map<String, Object> getWalletList(Map<String, Object> map) throws Exception;
	
}