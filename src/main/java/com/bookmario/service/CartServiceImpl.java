package com.bookmario.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookmario.domain.CartVO;
import com.bookmario.domain.ItemVO;
import com.bookmario.mapper.CartMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	private CartMapper mapper;

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
	public void order(Long cart) {
		mapper.order(cart);
	}

	@Override
	public void delete(Long itemID) {
		mapper.delete(itemID);
	} 
	
	// 장바구니에 해당 도서가 없으면 추가하고 있으면 false를 반환
	@Override
	public boolean addItemToCart(ItemVO itemVO) {
        int count = mapper.checkItemExists(itemVO.getCartID(), itemVO.getBookID());
        if (count > 0) {
            // 중복된 아이템이 있으면 false 반환
            return false;
        }

        // 중복이 아니면 아이템 추가
        mapper.add(itemVO);
        return true;
    }
	
	// 중복 체크
	@Override
	public boolean isItemInCart(Long cartID, Long bookID) {
	    return mapper.checkItemExists(cartID, bookID) > 0;
	}
	
	// 도서 조회
	@Override
	public ItemVO getItemByID(Long itemID) {
		return mapper.getItemByID(itemID);
	}

	// 장바구니에 담은 아이템 수량 변경
	@Override
	public void updateItemAmount(ItemVO item) {
		mapper.updateItemAmount(item);
	}

	// 장바구니에 아이템이 존재하는지 확인
	@Override
	public int countItemsInCart(Long cartID) {
		return mapper.countItemsInCart(cartID);
	}
	
}
