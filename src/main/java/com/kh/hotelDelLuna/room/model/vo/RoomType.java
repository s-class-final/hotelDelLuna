package com.kh.hotelDelLuna.room.model.vo;

import java.sql.Date;

public class RoomType {
	private String type;		//객실 타입
	private int capacity;		//수용인원
	private String addBed;		//배드 추가 여부
	private int singleBed;		//싱글베드 수
	private int doubleBed;		//더블베드 수
	private String smoking;		//흡연객실 여부
	private int weekDay;	//주중가
	private int weekEnd;	//주말가
	private Date startDay;	//판매시작일
	private Date endDay;		//판매종료일
	private int childRate;	//아동요금
	
	private String changename;
	private String roomType2;
	
	public RoomType() {
	}

	public RoomType(String type, int capacity, String addBed, int singleBed, int doubleBed, String smoking,
			int weekDay, int weekEnd, Date startDay, Date endDay, int childRate) {
		this.type = type;
		this.capacity = capacity;
		this.addBed = addBed;
		this.singleBed = singleBed;
		this.doubleBed = doubleBed;
		this.smoking = smoking;
		this.weekDay = weekDay;
		this.weekEnd = weekEnd;
		this.startDay = startDay;
		this.endDay = endDay;
		this.childRate = childRate;
	}

	
	
	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public String getRoomType2() {
		return roomType2;
	}

	public void setRoomType2(String roomType2) {
		this.roomType2 = roomType2;
	}

	public RoomType(String type, int capacity, String addBed, int singleBed, int doubleBed, String smoking, int weekDay,
			int weekEnd, Date startDay, Date endDay, int childRate, String changename, String roomType2) {
		super();
		this.type = type;
		this.capacity = capacity;
		this.addBed = addBed;
		this.singleBed = singleBed;
		this.doubleBed = doubleBed;
		this.smoking = smoking;
		this.weekDay = weekDay;
		this.weekEnd = weekEnd;
		this.startDay = startDay;
		this.endDay = endDay;
		this.childRate = childRate;
		this.changename = changename;
		this.roomType2 = roomType2;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getAddBed() {
		return addBed;
	}

	public void setAddBed(String addBed) {
		this.addBed = addBed;
	}

	public int getSingleBed() {
		return singleBed;
	}

	public void setSingleBed(int singleBed) {
		this.singleBed = singleBed;
	}

	public int getDoubleBed() {
		return doubleBed;
	}

	public void setDoubleBed(int doubleBed) {
		this.doubleBed = doubleBed;
	}

	public String getSmoking() {
		return smoking;
	}

	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}

	public int getWeekDay() {
		return weekDay;
	}

	public void setWeekDay(int weekDay) {
		this.weekDay = weekDay;
	}

	public int getWeekEnd() {
		return weekEnd;
	}

	public void setWeekEnd(int weekEnd) {
		this.weekEnd = weekEnd;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getEndDay() {
		return endDay;
	}

	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}

	public int getChildRate() {
		return childRate;
	}

	public void setChildRate(int childRate) {
		this.childRate = childRate;
	}

	@Override
	public String toString() {
		return "RoomType [type=" + type + ", capacity=" + capacity + ", addBed=" + addBed
				+ ", singleBed=" + singleBed + ", doubleBed=" + doubleBed + ", smoking=" + smoking + ", weekDay="
				+ weekDay + ", weekEnd=" + weekEnd + ", startDay=" + startDay + ", endDay=" + endDay + ", childRate="
				+ childRate + "]";
	}


}