package com.bookmario.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
		return "/error/accessError";
	}
	
	@GetMapping("/customLogin")
	public String loginInput(String error, String logout, Model model) {
		
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		return "/member/customLogin";
	}
	
}
