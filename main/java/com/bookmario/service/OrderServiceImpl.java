package com.bookmario.service;

import org.springframework.stereotype.Service;

import com.bookmario.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	OrderMapper mapper;
	
	@Override
	public void delete(Long bookID) {
		mapper.delete(bookID);
	} 

}
