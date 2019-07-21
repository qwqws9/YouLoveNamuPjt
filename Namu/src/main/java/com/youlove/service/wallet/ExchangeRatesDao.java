package com.youlove.service.wallet;

public interface ExchangeRatesDao {
	
	public double convertExchangeRate(String from, String to, double amount) throws Exception;

}