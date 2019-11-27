package com.kh.hotelDelLuna.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.reservation.model.dao.ReservationDao;

@Service("rService")
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDao rDao;
}
