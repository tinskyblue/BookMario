package com.bookmario.service;

import org.springframework.stereotype.Service;

import com.bookmario.mapper.OrderMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	OrderMapper mapper;
	
	@Override
	public void delete(Long bookID) {
		mapper.delete(bookID);
	} 

}
