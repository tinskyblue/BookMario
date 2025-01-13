package com.bookmario.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookmario.domain.Criteria;
import com.bookmario.domain.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReviewMapperTests {
	
	private Long[] bookArr = { 1L, 2L, 3L, 4L, 5L };

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	
	/*@Test
	public void testMapper() {
		log.info(mapper);
	}*/
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReviewVO vo = new ReviewVO();
			
			// 게시물의 번호
			vo.setBookID(bookArr[ i % 5 ]);
			vo.setReview("댓글 테스트 " + i);
			vo.setReviewer("Reviewer" + i);
			mapper.insert(vo);
		});
	}
	
	/*@Test
	public void testRead() {
		Long targetRno = 5L;
		ReviewVO vo = mapper.read(targetRno);
		log.info(vo);
	}*/
	
	/*@Test
	public void testDelete() {
		Long targetRno = 1L;
		mapper.delete(targetRno);
	}*/
	
	/*@Test
	public void testUpdate() {
		Long TargetRno = 10L;
		ReviewVO vo = mapper.read(TargetRno);
		vo.setReview("Update Review ");
		int count = mapper.update(vo);
		log.info("UPDATE COUNT: " + count);
	}*/
	
	/*@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReviewVO> review = mapper.getListWithPaging(cri, bookArr[0]);
		replies.forEach(review -> log.info(review));
	}*/
	
}
