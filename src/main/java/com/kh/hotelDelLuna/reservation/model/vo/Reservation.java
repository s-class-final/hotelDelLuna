package com.kh.hotelDelLuna.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private int res_no;
	private int res_roomNo;
	private String res_roomType;
	private String res_userId;
	private String res_userName;
	private int res_breakfast;
	private int res_dinner;
	private String res_smoking;
	private String res_addBed;
	private String res_adult;
	private String res_child;
	private Date res_checkIn;
	private Date res_checkOut;
	private String res_status;
	private String res_payStatus;
	private String res_require;
	public Reservation() {
		super();
	}
	public Reservation(int res_no, int res_roomNo, String res_roomType, String res_userId, String res_userName,
			int res_breakfast, int res_dinner, String res_smoking, String res_addBed, String res_adult,
			String res_child, Date res_checkIn, Date res_checkOut, String res_status, String res_payStatus,
			String res_require) {
		super();
		this.res_no = res_no;
		this.res_roomNo = res_roomNo;
		this.res_roomType = res_roomType;
		this.res_userId = res_userId;
		this.res_userName = res_userName;
		this.res_breakfast = res_breakfast;
		this.res_dinner = res_dinner;
		this.res_smoking = res_smoking;
		this.res_addBed = res_addBed;
		this.res_adult = res_adult;
		this.res_child = res_child;
		this.res_checkIn = res_checkIn;
		this.res_checkOut = res_checkOut;
		this.res_status = res_status;
		this.res_payStatus = res_payStatus;
		this.res_require = res_require;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public int getRes_roomNo() {
		return res_roomNo;
	}
	public void setRes_roomNo(int res_roomNo) {
		this.res_roomNo = res_roomNo;
	}
	public String getRes_roomType() {
		return res_roomType;
	}
	public void setRes_roomType(String res_roomType) {
		this.res_roomType = res_roomType;
	}
	public String getRes_userId() {
		return res_userId;
	}
	public void setRes_userId(String res_userId) {
		this.res_userId = res_userId;
	}
	public String getRes_userName() {
		return res_userName;
	}
	public void setRes_userName(String res_userName) {
		this.res_userName = res_userName;
	}
	public int getRes_breakfast() {
		return res_breakfast;
	}
	public void setRes_breakfast(int res_breakfast) {
		this.res_breakfast = res_breakfast;
	}
	public int getRes_dinner() {
		return res_dinner;
	}
	public void setRes_dinner(int res_dinner) {
		this.res_dinner = res_dinner;
	}
	public String getRes_smoking() {
		return res_smoking;
	}
	public void setRes_smoking(String res_smoking) {
		this.res_smoking = res_smoking;
	}
	public String getRes_addBed() {
		return res_addBed;
	}
	public void setRes_addBed(String res_addBed) {
		this.res_addBed = res_addBed;
	}
	public String getRes_adult() {
		return res_adult;
	}
	public void setRes_adult(String res_adult) {
		this.res_adult = res_adult;
	}
	public String getRes_child() {
		return res_child;
	}
	public void setRes_child(String res_child) {
		this.res_child = res_child;
	}
	public Date getRes_checkIn() {
		return res_checkIn;
	}
	public void setRes_checkIn(Date res_checkIn) {
		this.res_checkIn = res_checkIn;
	}
	public Date getRes_checkOut() {
		return res_checkOut;
	}
	public void setRes_checkOut(Date res_checkOut) {
		this.res_checkOut = res_checkOut;
	}
	public String getRes_status() {
		return res_status;
	}
	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}
	public String getRes_payStatus() {
		return res_payStatus;
	}
	public void setRes_payStatus(String res_payStatus) {
		this.res_payStatus = res_payStatus;
	}
	public String getRes_require() {
		return res_require;
	}
	public void setRes_require(String res_require) {
		this.res_require = res_require;
	}
	@Override
	public String toString() {
		return "Reservation [res_no=" + res_no + ", res_roomNo=" + res_roomNo + ", res_roomType=" + res_roomType
				+ ", res_userId=" + res_userId + ", res_userName=" + res_userName + ", res_breakfast=" + res_breakfast
				+ ", res_dinner=" + res_dinner + ", res_smoking=" + res_smoking + ", res_addBed=" + res_addBed
				+ ", res_adult=" + res_adult + ", res_child=" + res_child + ", res_checkIn=" + res_checkIn
				+ ", res_checkOut=" + res_checkOut + ", res_status=" + res_status + ", res_payStatus=" + res_payStatus
				+ ", res_require=" + res_require + "]";
	}

	
	
}
