package com.bookmario.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

//접근 제한이 된 경우 다양한 처리를 하기 위한 핸들러
//ex: 쿠키나 세션에 특정한 작업을 하거나 HttpServletResponse에 특정한 헤더 정보를 추가하는 등

//접근 제한이 걸리는 경우 리다이렉트하는 방식
//security-context.xml에 빈으로 등록해서 사용
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		log.error("Access Denied Handler");
		
		log.error("Redirect....");
		
		response.sendRedirect("/accessError");
		
	}
	
}
