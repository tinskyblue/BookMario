package com.bookmario.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookmario.domain.AuthVO;
import com.bookmario.domain.CartVO;
import com.bookmario.domain.MemberVO;
import com.bookmario.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;

	@Override
	public void signup(MemberVO vo) {
		mapper.signup(vo);	
	}
	
	@Override
	public void auth(AuthVO vo) {
		mapper.auth(vo);
	}

	@Override
	public MemberVO read(String userID) {
		log.info("getList.........");
		return mapper.read(userID);
	}

	@Override
	public boolean hasCart(int status, String currUserID) {
		return mapper.hasCart(status, currUserID);
	}

	@Override
	public CartVO getCart(String currUserID) {
		return mapper.getCart(currUserID);
	}

	@Override
	public List<CartVO> getOrders(String userID) {
		return mapper.getOrders(userID);
	}
	
}
