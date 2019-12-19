package com.kh.hotelDelLuna.admin.model.vo;

import java.sql.Date;

public class Invoice {

	
	private int ivId;
	private String userName;
	private String userPhone;
	private int rType;
	private Date ckinDate;
	private int price;
	private Date rqDate;
	private int quantity;
	private int totalPrice;
	private String userEmail;
	private String iStatus;
	
	public Invoice() {
		super();
	}

	public Invoice(int ivId, String userName, String userPhone, int rType, Date ckinDate, int price, Date rqDate,
			int quantity, int totalPrice, String userEmail, String iStatus) {
		super();
		this.ivId = ivId;
		this.userName = userName;
		this.userPhone = userPhone;
		this.rType = rType;
		this.ckinDate = ckinDate;
		this.price = price;
		this.rqDate = rqDate;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.userEmail = userEmail;
		this.iStatus = iStatus;
	}

	public int getIvId() {
		return ivId;
	}

	public void setIvId(int ivId) {
		this.ivId = ivId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getrType() {
		return rType;
	}

	public void setrType(int rType) {
		this.rType = rType;
	}

	public Date getCkinDate() {
		return ckinDate;
	}

	public void setCkinDate(Date ckinDate) {
		this.ckinDate = ckinDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRqDate() {
		return rqDate;
	}

	public void setRqDate(Date rqDate) {
		this.rqDate = rqDate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	@Override
	public String toString() {
		return "Invoice [ivId=" + ivId + ", userName=" + userName + ", userPhone=" + userPhone + ", rType=" + rType
				+ ", ckinDate=" + ckinDate + ", price=" + price + ", rqDate=" + rqDate + ", quantity=" + quantity
				+ ", totalPrice=" + totalPrice + ", userEmail=" + userEmail + ", iStatus=" + iStatus + "]";
	}

	
	
	
	
}
