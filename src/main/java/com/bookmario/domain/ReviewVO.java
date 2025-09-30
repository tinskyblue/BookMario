package com.bookmario.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long rno;
	private Long bookID;
	
	private String review;
	private String reviewer;
	private Timestamp reviewDate;
	private Timestamp updateDate;
	
}
