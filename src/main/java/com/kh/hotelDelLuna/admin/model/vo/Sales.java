package com.kh.hotelDelLuna.admin.model.vo;

import java.sql.Date;

public class Sales {
	private String rType;
	private int price;
	private Date ckinDate;
	public Sales() {
		super();
	}
	public Sales(String rType, int price, Date ckinDate) {
		super();
		this.rType = rType;
		this.price = price;
		this.ckinDate = ckinDate;
	}
	public String getrType() {
		return rType;
	}
	public void setrType(String rType) {
		this.rType = rType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getCkinDate() {
		return ckinDate;
	}
	public void setCkinDate(Date ckinDate) {
		this.ckinDate = ckinDate;
	}
	@Override
	public String toString() {
		return "Sales [rType=" + rType + ", price=" + price + ", ckinDate=" + ckinDate + "]";
	}
	
	
}
