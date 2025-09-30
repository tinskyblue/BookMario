<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert name here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/resources/main/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="Stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="/resources/member/css/login.css" rel="stylesheet" />
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<div id="root" class="d-flex flex-column min-vh-100">
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<!-- Section-->
		<section style= margin:100px;>
			<div class="container">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-6 mx-auto">
						<h4 class="mb-3">로그인</h4>
						<form class="validation-form" role="form" method="post" action="/login" autocomplete="off" novalidate>
							<div class="col-md-12 mb-3">
								<label for="id">아이디</label> 
								<input type="text" class="form-control" id="userID" name='userID' placeholder="" value="" required maxLength=20>
								<div class="invalid-feedback">아이디를 입력해주세요.</div>
							</div>
							
							<div class="col-md-12 mb-3" id="pass">
								<label for="password">비밀번호</label>
								<input type="password" class="form-control" id="userPass" name='userPass' placeholder="" value="" required maxLength=20>
									<i class="bi bi-eye-fill fs-5"></i>
								<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							</div>
							<div class="col-md-12 mb-3">
								<p><c:out value="${error}" /></p>
							</div>
							<div class="mb-3"></div>
								<a class="signup" href="<c:url value="/member/signup" />">회원 가입</a>
								<button type="submit" class="btn btn-outline-primary float-right">LOGIN</button>
							
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
			<script type="text/javascript" src="/resources/member/js/user.js"></script>
		</section>
			
	<footer id="footer" class="mt-auto">
			<div id="nav_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
	</footer>
	
	</div>
</body>
</html>