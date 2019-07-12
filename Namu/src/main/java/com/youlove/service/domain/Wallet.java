package com.youlove.service.domain;
public class Wallet {
	
	private int walletDetailCode;
	private int walletCode;
	private String part;
	private String moneyUnit;
	private String expression;
	private int price;
	private String regDate;
	private String item;
	private String content;
	private String payOption;
	private int exchangeRate;
	private String category;
	private int payer;
	// ȯ�� ���� ���(��ȭ)
	private int exchangePrice;
	
	public int getWalletDetailCode() {
		return walletDetailCode;
	}
	public void setWalletDetailCode(int walletDetailCode) {
		this.walletDetailCode = walletDetailCode;
	}
	
	public int getWalletCode() {
		return walletCode;
	}
	public void setWalletCode(int walletCode) {
		this.walletCode = walletCode;
	}
	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
	public String getMoneyUnit() {
		return moneyUnit;
	}
	public void setMoneyUnit(String moneyUnit) {
		this.moneyUnit = moneyUnit;
	}
	
	public String getExpression() {
		return expression;
	}
	public void setExpression(String expression) {
		this.expression = expression;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPayOption() {
		return payOption;
	}
	public void setPayOption(String payOption) {
		this.payOption = payOption;
	}
	
	public int getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(int exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getPayer() {
		return payer;
	}
	public void setPayer(int payer) {
		this.payer = payer;
	}
	
	public int getExchangePrice() {
		return exchangePrice;
	}
	public void setExchangePrice(int exchangePrice) {
		this.exchangePrice = exchangePrice;
	}
	
}