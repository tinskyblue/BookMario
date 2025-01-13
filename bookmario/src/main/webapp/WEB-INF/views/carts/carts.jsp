<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon/favicon.ico'/>"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Book Carts</title>
	<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link href="/resources/cart/css/cart.css" rel="stylesheet" />
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
					    <h2><span class="badge badge-warning">쇼핑중</span></h2>
					</div>
					<hr>
					<table class="table">
					    <thead class="thead-light">
					    <tr>
					      <th></th>
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
					            <td><fmt:formatNumber value="${ item.bookVO.price }" pattern="#,###" />원</td>
					            <td>
    								<form action="<c:url value='/carts/update/${ item.itemID }' />" method="post">
        								<input name="amount" class="form-control text-center me-3" id="inputQuantity" type="number" value="${ item.amount }" style="max-width: 4rem; display: inline-block;" min="1" oninput="this.value = Math.max(this.value, 1);" />
        								<button type="submit" class="btn btn-outline-primary" style="display: inline-block;">수정</button>
    								</form>
								</td>
					            <td><fmt:formatNumber value="${ item.bookVO.price * item.amount }" pattern="#,###" />원</td>
					            <td style=width:80px;><a class="btn btn-outline-danger mt-auto" href="<c:url value='/carts/delete/${ item.itemID }' />">삭제</a></td>
					        </tr>
					    </c:forEach>
					  </tbody>
					  <tfoot>
					    <tr>
					        <td colspan="3"></td>
                    		<td><strong>총 수량:</strong> ${ cart.count }</td>
                    		<td><strong>총 금액:</strong> <fmt:formatNumber value="${ cart.totalPrice }" pattern="#,###" />원</td>
                    		<td></td>
					    </tr>
					  </tfoot>
					</table>
					<form action="<c:url value='/orders' />" method="post">
					    <input name="cartID" type="hidden" value="${ cart.cartID }" />
					    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					    <button type="submit" class="btn btn-primary btn-lg btn-block shadow">주문하기</button>
					</form>
		        </div>
		    </div>
		</section>
		
		<script type="text/javascript" src="/resources/item/js/review.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
		<!-- SweetAlert2 알림 처리 -->
		<!-- 장바구니에 있는 상품을 장바구니에 담을 때 -->
		<!-- 주문시 장바구니에 상품이 없을 때 -->
		<c:if test="${not empty errorMessage}">
		    <script>
		        <c:choose>
		            <c:when test="${errorMessage == 'This book is already in your cart.'}">
		                Swal.fire({
		                    icon: 'error',
		                    title: '이 책은 이미 장바구니에 담겨 있습니다.',
		                    text: '${errorMessage}'
		                });
		            </c:when>
		            <c:otherwise>
		                Swal.fire({
		                    icon: 'error',
		                    title: '장바구니에 상품이 없습니다.',
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