package com.kh.hotelDelLuna.member.model.vo;

import java.sql.Date;

public class Inquiry {
	private int iId;
	private String iTitle;
	private String iWriter;
	private String iUserName;
	private String iContent;
	private Date iCreateDate;
	private Date iModifyDate;
	private String iStatus;
	private String reContent;
	private String reStatus;
	
	public Inquiry() {
		super();
	}

	public Inquiry(int iId, String iTitle, String iWriter, String iUserName, String iContent, Date iCreateDate,
			Date iModifyDate, String iStatus, String reContent, String reStatus) {
		super();
		this.iId = iId;
		this.iTitle = iTitle;
		this.iWriter = iWriter;
		this.iUserName = iUserName;
		this.iContent = iContent;
		this.iCreateDate = iCreateDate;
		this.iModifyDate = iModifyDate;
		this.iStatus = iStatus;
		this.reContent = reContent;
		this.reStatus = reStatus;
	}

	public int getiId() {
		return iId;
	}

	public void setiId(int iId) {
		this.iId = iId;
	}

	public String getiTitle() {
		return iTitle;
	}

	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}

	public String getiWriter() {
		return iWriter;
	}

	public void setiWriter(String iWriter) {
		this.iWriter = iWriter;
	}

	public String getiUserName() {
		return iUserName;
	}

	public void setiUserName(String iUserName) {
		this.iUserName = iUserName;
	}

	public String getiContent() {
		return iContent;
	}

	public void setiContent(String iContent) {
		this.iContent = iContent;
	}

	public Date getiCreateDate() {
		return iCreateDate;
	}

	public void setiCreateDate(Date iCreateDate) {
		this.iCreateDate = iCreateDate;
	}

	public Date getiModifyDate() {
		return iModifyDate;
	}

	public void setiModifyDate(Date iModifyDate) {
		this.iModifyDate = iModifyDate;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	@Override
	public String toString() {
		return "Inquiry [iId=" + iId + ", iTitle=" + iTitle + ", iWriter=" + iWriter + ", iUserName=" + iUserName
				+ ", iContent=" + iContent + ", iCreateDate=" + iCreateDate + ", iModifyDate=" + iModifyDate
				+ ", iStatus=" + iStatus + ", reContent=" + reContent + ", reStatus=" + reStatus + "]";
	}
	
	
	

}
