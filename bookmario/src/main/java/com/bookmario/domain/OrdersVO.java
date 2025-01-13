package com.bookmario.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersVO {
	
	private int ordersID;
	private Date date;
	private int amount;
	private int pirce;
	private int mileage;
	private MemberVO memberVO;
	private BookVO bookVO;

	private int count;
}
