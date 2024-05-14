package com.bookmario.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	// 페이징 화면 처리

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 화면에 페이지번호가 10개씩 보인다.
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			//보여줄 수 있는 페이지가 10개보다 적을때
			this.endPage = realEnd;
		}
		
		// 다음버튼, 이전버튼
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
