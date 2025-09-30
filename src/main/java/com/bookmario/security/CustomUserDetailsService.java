package com.bookmario.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bookmario.domain.MemberVO;
import com.bookmario.mapper.MemberMapper;
import com.bookmario.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired})
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userID) throws UsernameNotFoundException {
		log.warn("Load User By Username : " + userID);
		
		// username means userid
		MemberVO vo = memberMapper.read(userID);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	
}
