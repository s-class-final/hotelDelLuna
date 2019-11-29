package com.kh.hotelDelLuna.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private int res_no;
	private int res_roomNo;
	private String res_roomType;
	private String res_userId;
	private String res_breakfast;
	private String res_dinner;
	private String res_adult;
	private String res_child;
	private Date res_checkIn;
	private Date res_checkOut;
	private String res_status;
	private String res_payStatus;
	
	public Reservation() {
		super();
	}
	
	public Reservation(int res_no, int res_roomNo, String res_roomType, String res_userId, String res_breakfast,
			String res_dinner, String res_adult, String res_child, Date res_checkIn, Date res_checkOut,
			String res_status, String res_payStatus) {
		super();
		this.res_no = res_no;
		this.res_roomNo = res_roomNo;
		this.res_roomType = res_roomType;
		this.res_userId = res_userId;
		this.res_breakfast = res_breakfast;
		this.res_dinner = res_dinner;
		this.res_adult = res_adult;
		this.res_child = res_child;
		this.res_checkIn = res_checkIn;
		this.res_checkOut = res_checkOut;
		this.res_status = res_status;
		this.res_payStatus = res_payStatus;
	}
	
	
	
}
