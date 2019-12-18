package com.kh.hotelDelLuna.front.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.front.model.vo.Notice;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Repository("sDao")
public class SupportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListcount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	

	public ArrayList<Notice> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}


	public Notice selectNotice(int nId) {
		return sqlSession.selectOne("noticeMapper.selectOne", nId);
	}


	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}


	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}


	public int deleteNotice(int nId) {
		return sqlSession.delete("noticeMapper.deleteNotice", nId);
	}



	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////

	public ArrayList<RoomType> selectReservationGst(Reservation res) {
		return (ArrayList)sqlSession.selectList("reservationMapper.guestSelectList");
	}

	
}
