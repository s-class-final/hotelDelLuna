package com.kh.hotelDelLuna.room.model.vo;

public class Attachment {
	private String num;				//이미지 번호
	private String path;			//이미지 경로
	private String originalName;	//이미지 원본 이름
	private String changeName;		//이미지 수정 이름
	private String type;			//객실 타입
	
	public Attachment() {
		super();
	}

	public Attachment(String num, String path, String originalName, String changeName, String type) {
		super();
		this.num = num;
		this.path = path;
		this.originalName = originalName;
		this.changeName = changeName;
		this.type = type;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Attachment [num=" + num + ", path=" + path + ", originalName=" + originalName + ", changeName="
				+ changeName + ", type=" + type + "]";
	}
	
	
	
}
