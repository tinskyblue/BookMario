package com.bookmario.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bookmario.domain.AuthVO;
import com.bookmario.domain.CartVO;
import com.bookmario.domain.MemberVO;

public interface MemberMapper {
	
	// 회원 조회
	public MemberVO read(String userID);
	
	// 회원 가입
	public void signup(MemberVO vo);
	
	// 권한 조회
	public void auth(AuthVO vo);
	
	// 장바구니
	boolean hasCart(@Param("status") int status, @Param("currUserId") String currUserId);
	
	public CartVO getCart(String userID);
	
	public List<CartVO> getOrders(String userID);
	
	// 댓글 조회
	@Select("select id from member where userID = #{ userID }")
	public String getUserIdByEmail(String userID);
	
}
