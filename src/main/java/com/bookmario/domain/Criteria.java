package com.bookmario.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	// Criteria : 검색기준
	
	// 페이지 번호
	private int pageNum;
	// 한 페이지당 몇 개의 데이터를 보여줄지
	private int amount;
	
	private String category;
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
	
	// UriComponentsBuilder는 여러개의 파라미터들을 연결해서 URL형태로 만들어주는 기능 제공
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();

	}

}