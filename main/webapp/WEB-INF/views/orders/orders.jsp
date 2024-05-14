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
					    <h1 class="display-4">주문내역</h1>
					    <h4>사용자 주문 ID: ${ orders }</h4>
					</div>
					<hr>
					<c:forEach var="order" items="${ orders }">
					    <h4><span class="badge badge-warning">출고중</span> <a class="btn btn-outline-dark mt-auto" href="<c:url value='/orders/delete/${ order.cartID }' />">주문취소</a></h4>
					    <table class="table">
					        <thead class="thead-light">
					        <tr>
					          <th>#</th>
					          <th>도서명</th>
					          <th>가격</th>
					          <th>수량</th>
					          <th>합계</th>
					        </tr>
					      </thead>
					      <tbody>
					        <c:forEach var="item" items="${ order.items }" varStatus="status">
					            <tr>
					                <th>${ status.count }</th>
					                <td>${ item.bookVO.title }</td>
					                <td>${ item.bookVO.price }원</td>
					                <td>${ item.amount }</td>
					                <td>${ item.price * item.amount }원</td>
					            </tr>
					        </c:forEach>
					      </tbody>
					      <tfoot>
					        <tr>
					            <td colspan="3"></td>
					            <td>${ order.count }</td>
					            <td>${ order.totalPrice }원</td>
					        </tr>
					      </tfoot>
					    </table>
					</c:forEach>
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