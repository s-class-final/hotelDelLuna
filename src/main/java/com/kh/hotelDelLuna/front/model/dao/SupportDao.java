package com.kh.hotelDelLuna.front.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sDao")
public class SupportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
