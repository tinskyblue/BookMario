package com.bookmario.mapper;

import java.util.List;

import com.bookmario.domain.BookVO;
import com.bookmario.domain.Criteria;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
public interface BookMapper {

	// 모든 상품 목록
	// @Select("select * from book order by bookID DESC")
	public List<BookVO> getList();
	
	// 페이징 처리된 상품 목록
	// @Select("select * from book order by bookID desc limit 16 OFFSET (#{pageNum} -1) * #{amount}")
	public List<BookVO> getListWithPaging(Criteria cri);
	
	// 상품 상세정보
	//@Select("select * from book where bookID = #{bookID}")
	public BookVO read(Long bookID);
	
	// 상품 등록
	//@Insert("insert into book (image, name, isBN, price, author, publisher, totalPages, stock) values (#{image}, #{name}, #{isBN}, #{price}, #{author}, #{publisher}, #{totalPages}, #{stock})")
    public void insert(BookVO book);
    // 상품 등록 전 시퀸스 ID 확인
	public void insertSelectKey(BookVO book);

	// 상품 수정
	//@Update("update book set image = #{image}, name = #{name}, isBN = #{isBN}, price = #{price}, author = #{author}, publisher = #{publisher}, totalPages = #{totalPages}, stock = #{stock} where bookID = #{bookID}")
	public int update(BookVO book);

	// 상품 삭제
	//@Delete("delete from book where bookID = #{bookID}")
	public int delete(Long bookID);
	
	// 모든 상품 데이터 개수
	public int getTotalCount(Criteria cri);

}
