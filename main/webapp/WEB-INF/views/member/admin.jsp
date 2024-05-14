<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert name here</title>
</head>
<body>
	<div id="root" class="d-flex flex-column min-vh-100">
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div>
		</nav>
		
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>
		
		<!-- Section-->
		<section class="py-5" id="container">
		    <div class="container px-4 px-lg-5 mt-5" id="container_box">
		    	<div>
					<!-- all or member or admin -->
					<h1>관리자 정보</h1>
					
					<p>principal : <sec:authentication property="principal"/></p>
					<p>MemberVO : <sec:authentication property="principal.member"/></p>
					<p>사용자이름 : <sec:authentication property="principal.member.username"/></p>
					<p>사용자아이디 : <sec:authentication property="principal.username"/></p>
					<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
					
					<form action="/customLogout" method='post' class="nav-item">
						<button>로그아웃</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<hr>
		    	</div>  		
			</div>		
		</section>
		
		<footer id="footer" class="mt-auto">
			<div id="nav_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>