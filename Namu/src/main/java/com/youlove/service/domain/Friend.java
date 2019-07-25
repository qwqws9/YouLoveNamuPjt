package com.youlove.service.domain;

public class Friend {

	private int friendNo;
	private int userCode;
	private User friendCode;
	private String memo;
	
	// 1 친구 
	// 2 동행
	// 3 일행
	private String friendRole;

	public int getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public User getFriendCode() {
		return friendCode;
	}

	public void setFriendCode(User friendCode) {
		this.friendCode = friendCode;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getFriendRole() {
		return friendRole;
	}

	public void setFriendRole(String friendRole) {
		this.friendRole = friendRole;
	}

	@Override
	public String toString() {
		return "Friend [friendNo=" + friendNo + ", userCode=" + userCode + ", friendCode=" + friendCode + ", memo="
				+ memo + ", friendRole=" + friendRole + "]";
	}
	
	
}
