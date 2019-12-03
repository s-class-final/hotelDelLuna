package com.kh.hotelDelLuna.reservation.model.vo;

public class ResSearchCondition {
	private String userName;
	private String userEmail;
	private String userPhone;

	public ResSearchCondition() {
		super();
	}
	public ResSearchCondition(String userName, String userEmail, String userPhone) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	@Override
	public String toString() {
		return "ResSearchCondition [userName=" + userName + ", userEmail=" + userEmail + ", userPhone=" + userPhone
				+ "]";
	}
	
	
	
}
