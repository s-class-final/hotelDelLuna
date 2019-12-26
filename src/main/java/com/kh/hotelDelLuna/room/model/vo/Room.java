package com.kh.hotelDelLuna.room.model.vo;

import java.sql.Date;

public class Room {
	private int roomNo;			//객실 번호
	private String roomType;	//객실 타입
	private String M_userName;  //유저 이름
	private int res_No;			//예약번호
	private String condition;	//객실 상태
	private Date inTime;		//체크인 시간
	private Date outTime;		//체크아웃시간
	private String requirement;	//요청사항
	
	
	public Room() {
	}
	
	public Room(int roomNo, String roomType, String m_userName, int res_No, String condition, Date inTime, Date outTime,
			String requirement) {
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.M_userName = m_userName;
		this.res_No = res_No;
		this.condition = condition;
		this.inTime = inTime;
		this.outTime = outTime;
		this.requirement = requirement;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getM_userName() {
		return M_userName;
	}

	public void setM_userName(String m_userName) {
		M_userName = m_userName;
	}

	public int getRes_No() {
		return res_No;
	}

	public void setRes_No(int res_No) {
		this.res_No = res_No;
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
		return "Room [roomNo=" + roomNo + ", roomType=" + roomType + ", M_userName=" + M_userName + ", res_No=" + res_No
				+ ", condition=" + condition + ", inTime=" + inTime + ", outTime=" + outTime + ", requirement="
				+ requirement + "]";
	}

	
	
	
}