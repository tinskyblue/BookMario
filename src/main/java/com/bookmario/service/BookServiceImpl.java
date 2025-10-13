package com.bookmario.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookmario.domain.BookVO;
import com.bookmario.domain.Criteria;
import com.bookmario.mapper.BookMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BookServiceImpl implements BookService {
	
	private BookMapper mapper;
	
	// 모든 상품 목록
	@Override
	public List<BookVO> getList() {
		log.info("getList.........");
		return mapper.getList();
	}
	
	// 페이징 처리된 상품 목록
	@Override
	public List<BookVO> getListWithPaging(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 상품 등록
	@Override
	public void register(BookVO book) {
		log.info("register..... bookID: " + book);
		mapper.insertSelectKey(book);
	}

	// 상품 상세정보
	@Override
	public BookVO get(Long book) {
		log.info("get...... bookID: " + book);
		return mapper.read(book);
	}

	// 상품 수정
	@Override
	public boolean modify(BookVO book) {
		log.info("modify......" + book);
		return mapper.update(book) == 1;
	}

	// 상품 삭제
	@Override
	public boolean remove(Long book) {
		log.info("remove.... bookID: " + book);
		return mapper.delete(book) == 1;
	}

	// 모든 상품 데이터 개수
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public Integer doAdd(String str1, String str2) {
		// TODO Auto-generated method stub
		return null;
	}

}
