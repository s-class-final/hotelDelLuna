package com.kh.hotelDelLuna.reservation.model.vo;

public class ResSearchCondition {
	private String userName;
	private String userId;
	private String userPhone;

	private int sort_no;
	private int sort_name;
	public ResSearchCondition() {
		super();
	}
	public ResSearchCondition(String userName, String userId, String userPhone, int sort_no, int sort_name) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPhone = userPhone;
		this.sort_no = sort_no;
		this.sort_name = sort_name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}
	public int getSort_name() {
		return sort_name;
	}
	public void setSort_name(int sort_name) {
		this.sort_name = sort_name;
	}
	@Override
	public String toString() {
		return "ResSearchCondition [userName=" + userName + ", userId=" + userId + ", userPhone=" + userPhone
				+ ", sort_no=" + sort_no + ", sort_name=" + sort_name + "]";
	}
	
	
	
}
