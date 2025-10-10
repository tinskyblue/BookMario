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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
		<section class="py-5 bg-white">
			<div class="container">
				<h1 class="mb-4">관리자 정보</h1>
				<div class="card shadow-sm">
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<strong>사용자 이름:</strong> 
								<sec:authentication property="principal.member.username" />
							</li>
							<li class="list-group-item">
								<strong>사용자 아이디:</strong> 
								<sec:authentication property="principal.username" />
							</li>
							<li class="list-group-item">
								<strong>사용자 권한 리스트:</strong> 
								<sec:authentication property="principal.authorities" />
							</li>
							<li class="list-group-item">
								<strong>연락처:</strong> 
								<sec:authentication property="principal.member.phon" />
							</li>
							<li class="list-group-item">
								<strong>이메일:</strong> 
								<sec:authentication property="principal.member.email" />
							</li>
							<li class="list-group-item">
								<strong>주소:</strong> 
								<sec:authentication property="principal.member.address" />
							</li>
						</ul>
					</div>
				</div>

				<!-- Logout -->
				<div class="mt-4">
					<form action="/customLogout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button type="submit" class="btn btn-danger btn-block">로그아웃</button>
					</form>
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