package com.kh.hotelDelLuna.room.model.vo;

public class Cost {
	private String type;	//객실 타입
	private int weekday;	//주중가
	private int weekend;	//주말가
	private int startDay;	//판매시작일
	private int endDay;		//판매종료일
	private int childRate;	//아동요금
	
	public Cost() {
		super();
	}

	public Cost(String type, int weekday, int weekend, int startDay, int endDay, int childRate) {
		super();
		this.type = type;
		this.weekday = weekday;
		this.weekend = weekend;
		this.startDay = startDay;
		this.endDay = endDay;
		this.childRate = childRate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getWeekday() {
		return weekday;
	}

	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}

	public int getWeekend() {
		return weekend;
	}

	public void setWeekend(int weekend) {
		this.weekend = weekend;
	}

	public int getStartDay() {
		return startDay;
	}

	public void setStartDay(int startDay) {
		this.startDay = startDay;
	}

	public int getEndDay() {
		return endDay;
	}

	public void setEndDay(int endDay) {
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
		return "Cost [type=" + type + ", weekday=" + weekday + ", weekend=" + weekend + ", startDay=" + startDay
				+ ", endDay=" + endDay + ", childRate=" + childRate + "]";
	}
	
	
	
	
}
