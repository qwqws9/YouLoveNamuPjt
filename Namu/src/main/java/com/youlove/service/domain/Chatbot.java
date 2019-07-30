package com.youlove.service.domain;

public class Chatbot {

	private String keyword;
	private String answer;
	private String keywordType;
	
	public String getKeyword() {
		return keyword;
	}
	public String getKeywordType() {
		return keywordType;
	}
	public void setKeywordType(String keywordType) {
		this.keywordType = keywordType;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Chatbot [keyword=" + keyword + ", answer=" + answer + ", keywordType=" + keywordType + "]";
	}


}
