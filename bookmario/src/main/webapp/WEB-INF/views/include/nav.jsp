<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<!-- Favicon-->
		<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon/favicon.ico'/>"/>
		<!-- Bootstrap icons-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<!-- Core theme CSS (Bootstrap)-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
		<link href="/resources/common.css" rel="stylesheet" />
		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	</head>
	<body>
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		    <div class="container px-4 px-lg-5">
		        <a class="navbar-brand" href="/books">Book Mario</a>
		        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
		                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/books">Home</a></li>
		                <li class="nav-item dropdown">
		                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
		                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                        <li><a class="dropdown-item" href="/books/products">All Products</a></li>
		                        <li><hr class="dropdown-divider" /></li>
		                        <sec:authorize access="hasRole('ROLE_ADMIN')">
		                        <li><a class="dropdown-item" href="<c:url value="/books/register" />">도서 등록</a></li>
		                        </sec:authorize>
		                    </ul>
		                </li>
		            </ul>
		            <ul class="navbar-nav">
		            	<sec:authorize access="isAnonymous()">
							<li class="nav-item"><a class="nav-link" href="<c:url value="/customLogin" />">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="<c:url value="/member/signup" />">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
				            <form class="d-flex">
				                <button class="btn btn-outline-dark" type="button" onclick="location.href='<c:url value="/carts" />'">
				                    <i class="bi-cart-fill me-1"></i>
										Cart
				                    <span class="badge bg-dark text-white ms-1 rounded-pill">${ cart.count }</span>
				                </button>
				            </form>
							<li class="nav-item"><a class="nav-link" href="<c:url value="/orders" />">주문 내역</a></li>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item"><a class="nav-link" href="<c:url value="/member/admin" />">관리자 정보</a></li>
							</sec:authorize>
							<form action="/customLogout" method='post' class="nav-item">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button class="nav-link" style="border: 0; outline: 0; background-color: transparent;">로그아웃</button>
							</form>
						</sec:authorize>
					</ul>
		        </div>
		    </div>
		</nav>