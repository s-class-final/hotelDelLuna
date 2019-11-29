package com.kh.hotelDelLuna.admin.model.vo;

import java.sql.Date;

public class Invoice {

	
	private int ivId;
	private String userId;
	private int rType;
	private Date ckinDate;
	private int price;
	private Date rqDate;
	
	public Invoice() {
		super();
	}

	public Invoice(int ivId, String userId, int rType, Date ckinDate, int price, Date rqDate) {
		super();
		this.ivId = ivId;
		this.userId = userId;
		this.rType = rType;
		this.ckinDate = ckinDate;
		this.price = price;
		this.rqDate = rqDate;
	}

	public int getIvId() {
		return ivId;
	}

	public void setIvId(int ivId) {
		this.ivId = ivId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return "Invoice [ivId=" + ivId + ", userId=" + userId + ", rType=" + rType + ", ckinDate=" + ckinDate
				+ ", price=" + price + ", rqDate=" + rqDate + "]";
	}
	
	
}
