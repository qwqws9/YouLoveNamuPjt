package com.youlove.service.domain;

import java.sql.Date;


//==>È¸¿øÁ¤º¸¸¦ ¸ðµ¨¸µ(Ãß»óÈ­/Ä¸½¶È­)ÇÑ Bean
public class Message {
	
	///Field
	private String messageCode;
	private String messageTitle;
	private String messsageContent;
	private String messageRole;
	private Date receiveTime;
	private String sender;
	private String receiver;
	private String email;
	private boolean confirmRead;
	private String isBlock;

	
	
	///Constructor
	public Message(){
	}
	
	//Method
	public String getMessageCode() {
		return messageCode;
	}
	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}

	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMesssageContent() {
		return messsageContent;
	}
	public void setMesssageContent(String messsageContent) {
		this.messsageContent = messsageContent;
	}

	public String getMessageRole() {
		return messageRole;
	}
	public void setMessageRole(String messageRole) {
		this.messageRole = messageRole;
	}

	public Date getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isConfirmRead() {
		return confirmRead;
	}
	public void setConfirmRead(boolean confirmRead) {
		this.confirmRead = confirmRead;
	}

	public String getIsBlock() {
		return isBlock;
	}
	public void setIsBlock(String isBlock) {
		this.isBlock = isBlock;
	}

	@Override
	public String toString() {
		return "Message [messageCode=" + messageCode + ", messageTitle=" + messageTitle + ", messsageContent="
				+ messsageContent + ", messageRole=" + messageRole + ", receiveTime=" + receiveTime + ", sender="
				+ sender + ", receiver=" + receiver + ", email=" + email + ", confirmRead=" + confirmRead + ", isBlock="
				+ isBlock + "]";
	}
	
	
	
	
}