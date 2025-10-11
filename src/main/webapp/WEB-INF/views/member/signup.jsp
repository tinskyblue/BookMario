<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Book Shop</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/resources/main/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="Stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="/resources/member/css/signup.css" rel="stylesheet" />
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- 카카오 주소검색 API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						<h4 class="mb-4 text-center">회원가입</h4>
						<form class="validation-form" role="form" method="post" name="" autocomplete="off" novalidate>
							<div class="col-md-12 mb-3">
								<label for="userID">아이디</label> 
								<input type="text" class="form-control" id="userID" name="userID" placeholder="" value="" required maxLength=20>
								<div class="invalid-feedback">아이디를 확인해주세요.</div>
							</div>
							
							<div class="col-md-12 mb-3 row">
								<div class="col-md-6">
									<label for="userPass">비밀번호</label>
									<input type="password" class="form-control" id="userPass" name="userPass" placeholder="" value="" required maxLength=20>
									<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
								</div>
									
								<div class="col-md-6">
									<label for="userPass">비밀번호 재입력</label>
									<input type="password" class="form-control" id="userPass2" name="userPass2" placeholder="" value="" required maxLength=20>
									<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
								</div>
							</div>
							
							<div class="col-md-12 mb-3">
								<label for="name">이름<span class="text-muted">&nbsp;(3글자 이상 입력해주세요)</span></label> 
								<input type="text" class="form-control" id="username" name="username" placeholder="" value="" required pattern=".{3,}">
								<div class="invalid-feedback">이름을 확인해주세요.</div>
							</div>

							<div class="col-md-12 mb-3">
								<label for="email">이메일</label> 
								<input type="email" class="form-control" id="email" name="email" placeholder="bookmario@gamil.com" required>
								<div class="invalid-feedback">이메일을 입력해주세요.</div>
							</div>

							<div class="col-md-12 mb-2">
							    <label for="address1">주소</label>
							    <div class="input-group">
							        <input type="text" class="form-control" id="address1" name="address1" placeholder="도로명 주소" readonly required>
							        <div class="input-group-append">
							            <button class="btn btn-outline-secondary" type="button" onclick="execDaumPostcode()">주소검색</button>
							        </div>
							        <div class="invalid-feedback">주소를 입력해주세요.</div>
							    </div>
							</div>
							
							<div class="col-md-12 mb-3">
							    <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소 입력" required>
							    <div class="invalid-feedback">상세주소를 입력해주세요.</div>
							</div>

							<div class="col-md-12 mb-3">
								<label for="phon">연락처<span class="text-muted">&nbsp;(하이폰(-)없이 입력해주세요)</span></label>
								<input type="text" class="form-control" id="phon" name="phon" placeholder="연락처를 입력해주세요.">
							</div>
							
							<div class="col-md-12 mb-3">
								<p style="margin-bottom: 5px">접근 권한</p>
								<div class="form-check">
									<input type="radio" class="form-check-input" name="auth" id="user" value="ROLE_USER">
									<label class="form-check-label" for="user">USER</label>
								</div>
								<div class="form-check">
									<input type="radio" class="form-check-input" name="auth" id="member" value="ROLE_MEMBER" checked>
									<label class="form-check-label" for="member">MEMBER</label>
								</div>
								<div class="form-check">
									<input type="radio" class="form-check-input" name="auth" id="admin" value="ROLE_ADMIN">
									<label class="form-check-label" for="admin">ADMIN</label>
								</div>
							</div>
							
							<hr class="col-md-12 mb-3" style="padding-left: 0px; padding-right: 0px;">
							
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="aggrement" required>
								<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
							</div>
							
							<div class="mb-3"></div>
							<button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
							
							<input type="hidden" id="fullAddress" name="address" />
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
