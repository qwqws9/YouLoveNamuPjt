package com.youlove.service.wallet;

public interface ExchangeRatesService {

	public double convertExchangeRate(String from, String to, double amount) throws Exception;
	
}