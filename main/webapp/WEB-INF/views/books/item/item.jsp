<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Book Shop</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon/favicon.ico'/>"/>
	<!-- Bootstrap icons -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS -->
	<link href="/resources/item/css/item.css" rel="stylesheet" />
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<div id="root" class="d-flex flex-column min-vh-100">
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../../include/nav.jsp" %>
			</div>
		</nav>
		
		<header id="header">
			<div id="header_box">
				<%@ include file="../../include/header.jsp" %>
			</div>
		</header>
		
		<!-- Product section-->
		<section class="py-5">
		    <div class="container px-4 px-lg-5 my-5">
		        <div class="row gx-4 gx-lg-5 align-items-center">
		            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${ book.image }" onerror="this.onerror=null; this.src='/resources/img/none.png';" alt="NONE IMG" /></div>
		            <!-- 서지 정보 시작 -->
		            <div class="col-md-6">
		            	<!-- 상품 정보 -->
		            	<div class="info">
		            		<div class="info_list">
				                <div class="small mb-1">${ book.bookISBN }</div>
				                <h1 class="display-5 fw-bolder">${ book.title }</h1>
				            </div>
				            <div class="info_list">
				                <div class="fs-5 mb-3">
				                	<ul>
				                		<li>
					                    	<div class="Litem">판매가</div>
					                    	<div class="Ritem"><span style="font-size:24px">${ book.price }</span>원</div>
					                    </li>
				                	</ul>
				                </div>
				           	</div>
				           	<div class="info_list">
				                <p class="lead">${ book.content }</p>
				                <form action="<c:url value='/carts/add' />" method="post">
					                <div class="d-flex">
					                    <input name="amount" class="form-control text-center me-3" id="inputQuantity" type="number" value="1" style="max-width: 4rem" />
					                    <input name="bookID" type="hidden" value="${ book.bookID }">
					                    <button class="btn btn-outline-dark flex-shrink-0" type="submit">
					                        <i class="bi-cart-fill me-1"></i>
					                        Add to cart
					                    </button>
					                </div>
					                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					        	</form>
					        	<div class="mt-2">
					        		<sec:authorize access="hasRole('ROLE_ADMIN')">
		                    			<a class="btn btn-outline-dark mt-auto" href="<c:url value='/books/edit/${ book.bookID }' />">수정</a>
		                    			<button type="button" class="btn btn-deleteAsk btn-danger" data-toggle="modal" data-target="#deleteConfirmationModal">삭제</button>
		                    		</sec:authorize>
		                    		<button data-oper="list" class="btn btn-outline-dark mt-auto" onclick="location.href='/books/products'">목록</button>
		                    		<!-- Delete Modal -->
					           	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog"  aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
						        		<div class="modal-content">
						            		<div class="modal-header">
						                		<h5 class="modal-title" id="deleteConfirmationModalLabel">삭제 확인</h5>
						                		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						            		</div>
						            		<div class="modal-body">
						                		<p>정말 삭제하시겠습니까? 삭제하면 복구되지 않아요.</p>
						            		</div>
						            		<div class="modal-footer">
						                		<a class="btn btn-outline-dark mt-auto" href="<c:url value='/books/delete/${ book.bookID }' />">네</a>
						                		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
						            		</div>
						        		</div>
						        		<!-- /modal-content -->
						    		</div>
						    		<!-- /modal-dialog -->
								</div>
								<!-- /Delete modal -->
					        	</div>
				        	</div>
			        	</div>
		            </div>
		            <div class="my-5">
				    	<h2>리뷰</h2>
		            </div>
		        </div>
		    </div>
		    <script type="text/javascript">
		    <!-- Delete script -->
            $(document).ready(function () {
			    // 삭제 버튼 클릭 시 모달 창 표시
			    $(".btn-deleteAsk").click(function () {
			        $("#deleteConfirmationModal").modal("show");
			    });
			});
            </script>
		</section>
		<footer id="footer" class="mt-auto">
			<div id="nav_box">
				<%@ include file="../../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>
