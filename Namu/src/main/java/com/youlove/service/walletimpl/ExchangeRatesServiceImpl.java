package com.youlove.service.walletimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.wallet.ExchangeRatesDao;
import com.youlove.service.wallet.ExchangeRatesService;

@Service("exchangeRatesServiceImpl")
public class ExchangeRatesServiceImpl implements ExchangeRatesService {

	@Autowired
	@Qualifier("exchangeRatesDaoImpl")
	private ExchangeRatesDao exchangeRatesDao;
	
	@Override
	public double convertExchangeRate(String from, String to, double amount) throws Exception {
		return exchangeRatesDao.convertExchangeRate(from, to, amount);
	}
	
}