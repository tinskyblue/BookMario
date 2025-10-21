package com.bookmario.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public void order(Long cart);

	// 장바구니 아이템 삭제
	public void delete(Long itemID);
	
	// 장바구니 도서 조회
	public ItemVO getItemByID(Long itemID);
	
	// 중복 체크 메서드
	public int checkItemExists(@Param("cartID") Long cartID, @Param("bookID") Long bookID);

	// 도서 수량 변경
	public void updateItemAmount(ItemVO item);
	
	// 장바구니에 아이템 수 체크
    public int countItemsInCart(Long cartID);
    
    // userID(username)으로 cartID조회
    public Long getCartIdByUsername(String userID);
	
}
