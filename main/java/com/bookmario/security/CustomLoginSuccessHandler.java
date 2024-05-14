package com.bookmario.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("Login Success");
		
		List<String> rolenames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			rolenames.add(authority.getAuthority());
		});

		log.warn("ROLE name: " + rolenames);
	
		if(rolenames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/books");
			return;
		}
		
		if(rolenames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/books");
			return;
		}
		
		if(rolenames.contains("ROLE_USER")) {
			response.sendRedirect("/books");
			return;
		}
		
		response.sendRedirect("/");
	}
}