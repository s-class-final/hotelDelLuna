package com.kh.hotelDelLuna.front.model.vo;

import java.sql.Date;

public class Notice {
	private int nId;			//공지글번호
	private int user_T;			//공지글 작성자의 관계번호(관리자인지 아닌지 식별=>관리자 아니면 작성 불가함)
	private String nTitle;		//공지글제목
	private String nContent;	//공지글내용
	private Date nCreateDate;	//글작성일자
	private Date nModifyDate;	//글수정일자
	private String nStatus;		//글 공개 비공개 여부
	
	public Notice() {
		super();
	}

	
	
	public Notice(int user_T, String nTitle, String nContent, String nStatus) {
		super();
		this.user_T = user_T;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nStatus = nStatus;
	}
	
	public Notice(int nId, int user_T, String nTitle, String nContent, String nStatus) {
		super();
		this.nId = nId;
		this.user_T = user_T;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nStatus = nStatus;
	}



	public Notice(int nId, int user_T, String nTitle, String nContent, Date nCreateDate, Date nModifyDate,
			String nStatus) {
		super();
		this.nId = nId;
		this.user_T = user_T;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public int getUser_T() {
		return user_T;
	}

	public void setUser_T(int user_T) {
		this.user_T = user_T;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", user_T=" + user_T + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus=" + nStatus + "]";
	}
	
	
}
