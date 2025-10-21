package com.bookmario.service;

import java.util.List;

import com.bookmario.domain.CartVO;
import com.bookmario.domain.ItemVO;

public interface CartService {

	// 장바구니 회원 정보
	public int create(CartVO cart);
		
	// 장바구니 아이템 정보
	public void add(ItemVO item);
		
	// 장바구니 리스트 조회
	public List<ItemVO> getItems(CartVO cart);
		
	// 장바구니 주문
	public void order(Long cart);
	
	// 장바구니 아이템 삭제
	public void delete(Long itemID);

	// 장바구니 중복 체크
	boolean addItemToCart(ItemVO itemVO);
	boolean isItemInCart(Long cartID, Long bookID);

	// 장바구니 도서 조회
	public ItemVO getItemByID(Long itemID);
	
	// 장바구니 수량 변경
	public void updateItemAmount(ItemVO item);

	// 장바구니 아이템 개수 조회
	public int countItemsInCart(Long cartID);

	// userID(username)으로 cartID조회
    public Long getCartIdByUsername(String username);

}
