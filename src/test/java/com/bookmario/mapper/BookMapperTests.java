package com.bookmario.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookmario.domain.BookVO;
import com.bookmario.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BookMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BookMapper mapper;
	
	/*@Test
	public void testGetList() {
		mapper.getList().forEach(book -> log.info(book));
	}*/
	
	/*@Test
	public void testDelete() {
		log.info("Delete Count: " + mapper.delete(3L));
	}*/
	
	// 2페이지가 정상적으로 나오는지 페이징 테스트
	/*@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(10);
		List<BookVO> list = mapper.getListWithPaging(cri);
		list.forEach(book -> log.info(book));
	}*/

	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("도서");
		cri.setType("T");
		
		List<BookVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(book -> log.info(book));
	}
}
