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
	<link href="/resources/cart/css/cart.css" rel="stylesheet" />
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
					</div>
					<hr>
					<c:forEach var="order" items="${ orders }">
					    <h4><span class="badge badge-warning">출고중</span> <a class="btn btn-outline-danger mt-auto" href="<c:url value='/orders/delete/${ order.cartID }' />">주문취소</a></h4>
					    <table class="table">
					        <thead class="thead-light">
					        <tr>
					          <th></th>
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
					                <td><fmt:formatNumber value="${ item.bookVO.price }" pattern="#,###" />원</td>
					                <td>${ item.amount }</td>
					                <td><fmt:formatNumber value="${ item.price * item.amount }" pattern="#,###" />원</td>
					            </tr>
					        </c:forEach>
					      </tbody>
					      <tfoot>
					        <tr>
					            <td colspan="3"></td>
                    			<td><strong>총 수량:</strong> ${ order.count }</td>
                    			<td><strong>총 금액:</strong> <fmt:formatNumber value="${  order.totalPrice }" pattern="#,###" />원</td>
                    		<td></td>
					        </tr>
					      </tfoot>
					    </table>
					</c:forEach>
		        </div>
		    </div>
		</section>
		
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<!-- 처리 결과 메시지 -->
		<c:if test="${not empty successMessage or not empty errorMessage or not empty cancelMessage}">
		    <script>
		        <c:choose>
		            <c:when test="${not empty successMessage}">
		                Swal.fire({
		                    icon: 'success',
		                    title: '주문 성공',
		                    text: '${successMessage}'
		                });
		            </c:when>
		            <c:when test="${not empty cancelMessage}">
		                Swal.fire({
		                    icon: 'success',
		                    title: '주문 취소 성공',
		                    text: '${cancelMessage}'
		                });
		            </c:when>
		            <c:otherwise>
		                Swal.fire({
		                    icon: 'error',
		                    title: '처리 실패',
		                    text: '${errorMessage}'
		                });
		            </c:otherwise>
		        </c:choose>
		    </script>
		</c:if>
		
		<footer id="footer" class="mt-auto">
			<div id="nav_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>