package com.bookmario.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookmario.domain.Criteria;
import com.bookmario.domain.ReviewPageDTO;
import com.bookmario.domain.ReviewVO;
import com.bookmario.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private ReviewMapper mapper;

	@Override
	public int register(ReviewVO vo) {
		log.info("register...." + vo);
		return mapper.insert(vo);
	}

	@Override
	public ReviewVO get(Long rno) {
		log.info("get...." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReviewVO vo) {
		log.info("modify...." + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReviewVO> getList(Criteria cri, Long bookID) {
		log.info("get Review List of a Book " + bookID);
		return mapper.getListWithPaging(cri, bookID);
	}
	
	public ReviewPageDTO getListPage(Criteria cri, Long bookID) {
		return new ReviewPageDTO(
				mapper.getCountByBookID(bookID),
				mapper.getListWithPaging(cri, bookID));
	}
	
}
