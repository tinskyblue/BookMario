package com.bookmario.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bookmario.domain.Criteria;
import com.bookmario.domain.ReviewVO;

public interface ReviewMapper {

	public int insert(ReviewVO vo);
	
	public ReviewVO read(Long rno); // 특정 댓글 읽기
	
	public int delete(Long rno);
	
	public int update(ReviewVO review);
	
	public List<ReviewVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bookID") Long bookID);
	
	public int getCountByBookID(Long bookID);
	
}
