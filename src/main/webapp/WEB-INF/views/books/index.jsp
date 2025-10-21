<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon/favicon.ico'/>"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Book Shop</title>
	<link href="/resources/main/css/main.css" rel="stylesheet" />
</head>
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
		<section id="container">
		    <div class="conA container px-4 px-lg-5 mt-5" id="container_box">
		        <h1>BEST BOOK</h1>
		        <hr>
		        <p>가장 인기 있는 베스트 셀러</p>
		        <p>가장 최근에 등록된 도서</p>
		        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		            <c:forEach var="book" items="${books}">
		                <div class="col mb-5 conB">
		                    <div class="card h-100">
		                        <a href="<c:url value='/books/item/${ book.bookID }'/>">
		                            <img src="${ book.image }" class="card-img-top photo" onerror="this.onerror=null; this.src='/resources/img/none.png';" alt="NONE IMG"/>
		                        </a>
		                        <div class="card-body">
		                            <div class="text-center">
		                                <a class="fw-bolder tit" href="<c:url value='/books/item/${ book.bookID }'/>">${ book.title }</a><br>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </c:forEach>
		        </div>
		    </div>	
		</section>
		
		<c:if test="${not empty signupSuccess}">
		    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		    <script type="text/javascript">
		        $(document).ready(function() {
		            Swal.fire({
		                icon: 'success',
		                title: '회원가입 완료',
		                text: '회원가입이 성공적으로 완료되었습니다!',
		                confirmButtonText: '확인'
		            });
		        });
		    </script>
		</c:if>

		
		<footer id="footer" class="mt-auto">
			<div id="nav_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
