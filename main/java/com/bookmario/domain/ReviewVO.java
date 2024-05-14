package com.bookmario.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long rno;
	private Long bookID;
	
	private String Review;
	private String Reviewer;
	private Date ReviewDate;
	private Date updateDate;
	
}
