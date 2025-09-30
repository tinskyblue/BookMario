package com.bookmario.service;

import java.util.List;

import com.bookmario.domain.Criteria;
import com.bookmario.domain.ReviewPageDTO;
import com.bookmario.domain.ReviewVO;

public interface ReviewService {

	public int register(ReviewVO vo);
	
	public ReviewVO get(Long rno);
	
	public int modify(ReviewVO vo);
	
	public int remove(Long rno);
	
	public List<ReviewVO> getList(Criteria cri, Long bookID);
	
	public ReviewPageDTO getListPage(Criteria cri, Long bookID);
	
}
