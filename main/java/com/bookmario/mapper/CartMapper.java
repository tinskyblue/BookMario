package com.bookmario.mapper;

import java.util.List;
import java.util.Map;

import com.bookmario.domain.CartVO;
import com.bookmario.domain.ItemVO;

public interface CartMapper {

	// 장바구니 회원 정보
	public int create(CartVO cart);
	
	// 장바구니 아이템 정보
	public void add(ItemVO item);
	
	// 장바구니 조회
	public List<ItemVO> getItems(CartVO cart);
	
	// 장바구니 주문
	public void order(int cart);

	// 장바구니 아이템 삭제
	public void delete(Long itemID);
	
}
