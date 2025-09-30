package com.bookmario.service;

import java.util.List;

import com.bookmario.domain.BookVO;
import com.bookmario.domain.Criteria;

public interface BookService {

	// AOP 테스트용 메서드
	public Integer doAdd(String str1, String str2);
	
	// 모든 상품 목록
	public List<BookVO> getList();
	
	// 페이징 처리된 상품 목록
	public List<BookVO> getListWithPaging(Criteria cri);
	
	// 상품 등록
	public void register(BookVO book);
	
	// 상품 상세정보
	public BookVO get(Long bookID);
	
	// 상품 수정
	public boolean modify(BookVO book);
	
	// 상품 삭제
	public boolean remove(Long bookID);
	
	// 모든 상품 데이터 개수
	public int getTotal(Criteria cri);
	
}
