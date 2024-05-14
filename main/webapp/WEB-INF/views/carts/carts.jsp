<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Book Carts</title>
	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="/resources/item/assets/favicon.ico" />
	<!-- Bootstrap icons -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS -->
	<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link href="/resources/item/css/styles.css" rel="stylesheet" />
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
		
		<!-- Product section-->
		<section class="py-5">
		    <div class="container px-4 px-lg-5 my-5">
		        <div class="row gx-4 gx-lg-5 align-items-center">
		        	<div class="jumbotron">
					    <h1 class="display-4">장바구니</h1>
					    <h4>사용자 장바구니 번호: ${ cart.cartID }</h4>
					    <h4>사용자 장바구니 정보: ${ cart }</h4>
					</div>
					<hr>
					<h2>장바구니<span class="badge badge-warning">쇼핑중</span></h2>
					<table class="table">
					    <thead class="thead-light">
					    <tr>
					      <th>#</th>
					      <th>도서명</th>
					      <th>가격</th>
					      <th>수량</th>
					      <th>합계</th>
					      <th></th>
					    </tr>
					  </thead>
					  <tbody>
					    <c:forEach var="item" items="${ items }" varStatus="status">
					        <tr>
					            <th>${ status.count }</th>
					            <td>${ item.bookVO.title }</td>
					            <td>${ item.bookVO.price }</td>
					            <td>${ item.amount }</td>
					            <td>${ item.bookVO.price * item.amount }원</td>
					            <td style=width:80px;><a class="btn btn-outline-dark mt-auto" href="<c:url value='/carts/delete/${ item.itemID }' />">삭제</a></td>
					        </tr>
					        ${ item }
					    </c:forEach>
					  </tbody>
					  <tfoot>
					    <tr>
					        <td colspan="3"></td>
					        <td>${ cart.count }</td>
					        <td>${ cart.totalPrice }원</td>
					        <td></td>
					    </tr>
					  </tfoot>
					</table>
					<form action="<c:url value='/orders' />" method="post">
					    <input name="cartID" type="hidden" value="${ cart.cartID }" />
					    <button type="submit" class="btn btn-lg btn-block btn-primary">주문하기</button>
					    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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