package com.bookmario.service;

import java.util.List;

import com.bookmario.domain.AuthVO;
import com.bookmario.domain.CartVO;
import com.bookmario.domain.MemberVO;

public interface MemberService {

	// 회원 조회
	public MemberVO read(String userID);
	
	// 회원 가입
	public void signup(MemberVO vo);
	
	// 권한 조회
	public void auth(AuthVO vo);
	
	// 장바구니
	boolean hasCart(int status, String currUserId);
	
	public CartVO getCart(String currUserId);
	
	public List<CartVO> getOrders(String userID);
}
