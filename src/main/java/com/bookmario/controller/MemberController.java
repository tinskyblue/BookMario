package com.bookmario.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookmario.domain.AuthVO;
import com.bookmario.domain.MemberVO;
import com.bookmario.service.BookService;
import com.bookmario.service.CartService;
import com.bookmario.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	
	private final BCryptPasswordEncoder passEncoder;
	
	@GetMapping("/signup")
	public void signup() {
		log.info("get signup");
	}
	
	@PostMapping("/signup")
	public String postSignup(MemberVO memberVO, AuthVO authVO, RedirectAttributes redirectAttributes) {
		log.info("post signup");
		String inputPass = memberVO.getUserPass();
		String pass = passEncoder.encode(inputPass);
		memberVO.setUserPass(pass);
		
		memberService.signup(memberVO);
		memberService.auth(authVO);
		
		log.info("post signup: " + memberVO);
		log.info("post auth: " + authVO);
		
		// 성공 여부를 flash attribute로 전달
		redirectAttributes.addFlashAttribute("signupSuccess", true);
		
		return "redirect:/books";
	}
	
	@GetMapping("/admin")
	public void admin() {
		log.info("get admin");
	}
}
