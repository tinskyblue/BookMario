package com.bookmario.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	// Criteria : 검색기준
	
	// 페이지 번호
	private int pageNum;
	// 한 페이지당 몇 개의 데이터를 보여줄지
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,16);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}

}