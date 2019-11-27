package com.kh.hotelDelLuna.room.model.vo;

public class RoomType {
	private String type;		//객실 타입
	private int capacity;		//수용인원
	private String addbed;		//아동용 베드 추가 여부
	private String amenity;		//구비시설
	private int quentity;		//객실 수
	private int rep;			//대표 사진
	private int singleBed;		//싱글베드 수
	private int doubleBed;		//더블베드 수
	private String smoking;		//흡연객실 여부
	
	public RoomType() {
		super();
	}

	public RoomType(String type, int capacity, String addbed, String amenity, int quentity, int rep, int singleBed,
			int doubleBed, String smoking) {
		super();
		this.type = type;
		this.capacity = capacity;
		this.addbed = addbed;
		this.amenity = amenity;
		this.quentity = quentity;
		this.rep = rep;
		this.singleBed = singleBed;
		this.doubleBed = doubleBed;
		this.smoking = smoking;
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

	public String getAddbed() {
		return addbed;
	}

	public void setAddbed(String addbed) {
		this.addbed = addbed;
	}

	public String getAmenity() {
		return amenity;
	}

	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}

	public int getQuentity() {
		return quentity;
	}

	public void setQuentity(int quentity) {
		this.quentity = quentity;
	}

	public int getRep() {
		return rep;
	}

	public void setRep(int rep) {
		this.rep = rep;
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
	
	
	
}
