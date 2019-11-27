package com.kh.hotelDelLuna.room.model.vo;

import java.sql.Date;

public class Room {
	private int num;			//객실 번호
	private String type;		//객실 타입
	private int res_no;			//예약번호
	private String condition;	//객실 상태
	private Date inTime;		//체크인 시간
	private Date outTime;		//체크아웃시간
	private String requirement;	//요청사항
	
	public Room() {
		super();
	}

	public Room(int num, String type, int res_no, String condition, Date inTime, Date outTime, String requirement) {
		super();
		this.num = num;
		this.type = type;
		this.res_no = res_no;
		this.condition = condition;
		this.inTime = inTime;
		this.outTime = outTime;
		this.requirement = requirement;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	@Override
	public String toString() {
		return "Room [num=" + num + ", type=" + type + ", res_no=" + res_no + ", condition=" + condition + ", inTime="
				+ inTime + ", outTime=" + outTime + ", requirement=" + requirement + "]";
	}
	
	
	
}
