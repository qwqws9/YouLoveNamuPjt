package com.youlove.service.walletimpl;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;

import com.youlove.service.wallet.ExchangeRatesDao;

@Repository("exchangeRatesDaoImpl")
public class ExchangeRatesDaoImpl implements ExchangeRatesDao {

	@Override
	public double convertExchangeRate(String from, String to, double amount) throws Exception{
		
		String url = "https://ko.exchange-rates.org/converter/" + from + "/" + to + "/" + amount + "/Y";

		Document doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36").get();
		//System.out.println(doc);
		
		Elements element = doc.select("span#ctl00_M_lblConversion");
		
		String[] strArr = (element.text()).split(" = ");
		//System.out.println(strArr[0] + strArr[1]);
		
		strArr[1] = strArr[1].substring(0, strArr[1].lastIndexOf(" "));
		//System.out.println(strArr[1]);
		
		String str = "";
		
		if(strArr[1].indexOf(",") != -1){
			strArr = strArr[1].split(",");
			//System.out.println(strArr[0] + strArr[1]);
			
			str = strArr[0].toString() + strArr[1].toString();
		}else {
			str = strArr[1].toString();
		}
		
		//System.out.println(str);
		
		double result = Double.parseDouble(str);
		
		return result;
		
	}
	
}