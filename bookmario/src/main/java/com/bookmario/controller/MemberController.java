package com.bookmario.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookmario.domain.AuthVO;
import com.bookmario.domain.MemberVO;
import com.bookmario.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	MemberService memberService;
	
	BCryptPasswordEncoder passEncoder;
	
	@GetMapping("/signup")
	public void signup() {
		log.info("get signup");
	}
	
	@PostMapping("/signup")
	public String postSignup(MemberVO memberVO, AuthVO authVO) {
		log.info("post signup");
		String inputPass = memberVO.getUserPass();
		String pass = passEncoder.encode(inputPass);
		memberVO.setUserPass(pass);
		memberService.signup(memberVO);
		memberService.auth(authVO);
		log.info("post signup: " + memberVO);
		log.info("post auth: " + authVO);
		return "redirect:/books";
	}
	
	@GetMapping("/admin")
	public void admin() {
		log.info("get admin");
	}
}
