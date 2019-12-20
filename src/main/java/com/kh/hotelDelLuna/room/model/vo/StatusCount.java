package com.kh.hotelDelLuna.room.model.vo;

public class StatusCount {
	private String roomType;	//객실 타입
	private int waitingCount;
	private int cleaningCount;
	private int stayingCount;

	public StatusCount() {
	}

	public StatusCount(String roomType, int waitingCount, int cleaningCount, int stayingCount) {
		this.roomType = roomType;
		this.waitingCount = waitingCount;
		this.cleaningCount = cleaningCount;
		this.stayingCount = stayingCount;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getWaitingCount() {
		return waitingCount;
	}

	public void setWaitingCount(int waitingCount) {
		this.waitingCount = waitingCount;
	}

	public int getCleaningCount() {
		return cleaningCount;
	}

	public void setCleaningCount(int cleaningCount) {
		this.cleaningCount = cleaningCount;
	}

	public int getStayingCount() {
		return stayingCount;
	}

	public void setStayingCount(int stayingCount) {
		this.stayingCount = stayingCount;
	}

	@Override
	public String toString() {
		return "StatusCount [roomType=" + roomType + ", waitingCount=" + waitingCount + ", cleaningCount="
				+ cleaningCount + ", stayingCount=" + stayingCount + "]";
	}

	
}
