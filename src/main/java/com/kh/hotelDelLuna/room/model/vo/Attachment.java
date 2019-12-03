package com.kh.hotelDelLuna.room.model.vo;

public class Attachment {
	private int num;				//이미지 번호
	private String roomType;		//객실타입
	private String path;			//이미지 경로
	private String originalName;	//이미지 원본 이름
	private String changeName;		//이미지 수정 이름
	private int imgLv;			//이미지 레벨	
	public Attachment() {
	}
	public Attachment(int num, String roomType, String path, String originalName, String changeName, int imgLv) {
		this.num = num;
		this.roomType = roomType;
		this.path = path;
		this.originalName = originalName;
		this.changeName = changeName;
		this.imgLv = imgLv;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public int getImgLv() {
		return imgLv;
	}
	public void setImgLv(int imgLv) {
		this.imgLv = imgLv;
	}
	@Override
	public String toString() {
		return "Attachment [num=" + num + ", roomType=" + roomType + ", path=" + path + ", originalName=" + originalName
				+ ", changeName=" + changeName + ", imgLv=" + imgLv + "]";
	}
	
	
}
