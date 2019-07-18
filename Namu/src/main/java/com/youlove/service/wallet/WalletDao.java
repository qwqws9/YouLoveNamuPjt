package com.youlove.service.wallet;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.Wallet;

public interface WalletDao {
	
	// walletListView.jsp
	/*
	public void addWalletView(Wallet wallet) throws Exception;
	
	public void deleteWalletView(int walletCode) throws Exception;
	
	public List<Wallet> getWalletListView(int plannerCode) throws Exception;
	*/
	
	// walletList.jsp
	public void addWallet(Wallet wallet) throws Exception;
	
	public Wallet getWallet(int walletDetailCode) throws Exception;
	/*
	public void updateWallet(Wallet wallet) throws Exception;
	
	public void deleteWallet(int walletDetailCode) throws Exception;
	*/
	public List<Wallet> getWalletList(Map<String, Object> map) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;
	
}