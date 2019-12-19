package com.kh.hotelDelLuna.member.model.vo;

public class Member {
	private int mId;
	private int userT;
	private String userId;
	private String userPwd;
	private String userName;
	private String userPhone;
	private int point;
	private String mStatus;
	private String kakao;
	
	public Member() {
	}

	
	public Member(String userId) {
		super();
		this.userId = userId;
	}
	
	public Member(String userId, String userName, String userPhone) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPhone = userPhone;
	}


	public Member(int mId, int userT, String userId, String userPwd, String userName, String userPhone, int point,
			String mStatus, String kakao) {
		super();
		this.mId = mId;
		this.userT = userT;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.point = point;
		this.mStatus = mStatus;
		this.kakao = kakao;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public int getUserT() {
		return userT;
	}

	public void setUserT(int userT) {
		this.userT = userT;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", userT=" + userT + ", userId=" + userId + ", userPwd=" + userPwd + ", userName="
				+ userName + ", userPhone=" + userPhone + ", point=" + point + ", mStatus=" + mStatus + ", kakao="
				+ kakao + "]";
	}
	
	
}
