package com.bookmario.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bookmario.domain.CartVO;
import com.bookmario.domain.ItemVO;
import com.bookmario.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	CartMapper mapper;

	@Override
	public int create(CartVO cart) {
		return mapper.create(cart);
	}

	@Override
	public void add(ItemVO item) {
		mapper.add(item);
	}

	@Override
	public List<ItemVO> getItems(CartVO cart) {
		return mapper.getItems(cart);
	}

	@Override
	public void order(int cart) {
		mapper.order(cart);
	}

	@Override
	public void delete(Long itemID) {
		mapper.delete(itemID);
	} 
	
}
