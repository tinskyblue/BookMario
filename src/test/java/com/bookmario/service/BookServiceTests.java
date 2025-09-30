package com.bookmario.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookmario.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BookServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BookService service;
	
	@Test
	public void testClass() {
		log.info("=================");
		log.info(service);
		log.info(service.getClass().getName());
		log.info("=================");
	}
	
	@Test
	public void testGetList() {
		// service.getList().forEach(board -> log.info(book));
		service.getListWithPaging(new Criteria(2, 10)).forEach(book -> log.info(book));
	}
	
//	@Test
//	public void testAOP() throws Exception {
//		log.info(service.getList());
//		log.info("=================");
//		log.info(service.doAdd("123", "456"));
//		log.info("=================");
//		log.info(service.doAdd("123", "ABC"));
//	}

}
