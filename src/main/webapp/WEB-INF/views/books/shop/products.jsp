<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon/favicon.ico'/>"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>All Products</title>
	<link href="/resources/products/css/products.css" rel="stylesheet" />
</head>
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
			
			<section class="py-5" id="container">
				<div class="book_allwrap">
					<!-- 좌측 컨텐츠 -->
					<aside class="book_left">
	
						<!-- 검색 -->
						<div class='row search'>
							<div class='col-lg-12'>
								<form id='searchForm' action="/books/products" method='get'>
									<select name='type' id='stype'>
										<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
										<option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>저자</option>
									</select>
									<input type="text" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' placeholder="Search here.." />
									<input type='hidden' name='pageNum' value ='<c:out value="${pageMaker.cri.pageNum}"/>'>
			        				<input type='hidden' name='amount' value = '<c:out value="${pageMaker.cri.amount}"/>'>
			        				<button class='search_btn'>Search</button>
								</form>
							</div>
						</div>
							
						<!-- 카테고리 -->	
						<div class="category_menu">
							<ul id="category">
								<li><a href="/books/products" class="allBooks">도서 모두보기</a></li>
								<li><a href="health" >건강</a></li>
								<li><a href="hobby">취미</a></li>
								<li><a href="management">경영</a></li>
								<li><a href="language">외국어</a></li>
								<li><a href="development">자기개발</a></li>
								<li><a href="cooking">요리</a></li>					
							</ul>
						</div>
					</aside>
					<!-- 우측 컨텐츠 -->
					<div class="book_right">
						<div class="container px-4 px-lg-5 mt-5" id="container_box">
			        		<ul class="b-booklist">
			        			<c:forEach var="list" items="${list}" varStatus="status">
			            			<li>
				                		<div class="b-cover">
				                    		<a href="<c:url value='/books/item/${ list.bookID }'/>">
				                    		<img src="${ list.image }" onerror="this.onerror=null; this.src='/resources/img/none.png';" alt="NONE IMG"/></a>
				                    	</div>
			                  			<div class="b-text">
			                  				<h4><a href="<c:url value='/books/item/${ list.bookID }'/>">${ list.title }</a></h4>
			                  				<div class="b-option">
			                      				<sec:authorize access="hasRole('ROLE_ADMIN')">
			                    					<a class="btn btn-outline-dark mt-auto" href="<c:url value='/books/edit/${ list.bookID }' />">수정</a>
			                    					<button type="button" class="btn btn-deleteAsk btn-danger" data-toggle="modal" data-target="#deleteConfirmationModal">삭제</button>
			                    				</sec:authorize>
			                    			</div>
			                  			</div>
			         				</li>
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
							                		<a class="btn btn-outline-dark mt-auto" href="<c:url value='/books/delete/${ list.bookID }' />">네</a>
							                		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
							            		</div>
							        		</div>
							        		<!-- /modal-content -->
							    		</div>
							    		<!-- /modal-dialog -->
									</div>
									<!-- /Delete modal -->
			        			</c:forEach>
							</ul>
	
							<!-- 페이징 처리 -->
							<nav aria-label="Page navigation">
			        			<div class='float-end'>
			        				<ul class="pagination">
			        					<c:if test="${pageMaker.prev}">
			        						<li class="page-item">
			        						<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
			        						</li>
			        					</c:if>
			        					
			        					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			        						<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''} ">
			        						<a class="page-link" href="${num}">${num}</a>
			        						</li>
			        					</c:forEach>
			        					
			        					<c:if test="${pageMaker.next }">
			        						<li class="page-item">
			        						<a class="page-link" href="${pageMaker.endPage +1}">Next</a>
			        						</li>
			        					</c:if>
			        				</ul>
			        			</div>
			        			<!-- <a>태그가 원래의 동작을 못하도록 javaScript로 처리하고 실제 페이지를 클릭하면 동작하는 부분 -->
			        			<form id='actionForm' action="/books/products" method='get'>
			        				<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
			        				<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
			        				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
			        				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
			        				<input type='hidden' name='category' value='<c:out value="${pageMaker.cri.category}"/>'>
			        			</form>
			        		</nav>
			        		<!--  end pagination -->
						</div>
					</div>
				</div>
			    <!-- register Modal -->
			    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    	<div class="modal-dialog">
			        	<div class="modal-content">
			        		<div class="modal-header">
			        			<h4 class="modal-title" id="myModalLabel">도서 등록</h4>
			        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			        		</div>
			        	<div class="modal-body">처리가 완료되었습니다.</div>
			        	<div class="modal-footer">
			        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        	</div>
			        	</div>
			        	<!-- /modal-content -->
			        </div>
			    	<!-- /modal-dialog -->
			    </div>
			<!-- /modal -->
			</section>
		</div>
		<script type="text/javascript" src="/resources/products/js/products.js"></script>

		<script type="text/javascript">
		$(document).ready(function(){
			
			// Register modal script
			var result='<c:out value="${result}"/>';
		    checkModal(result);
		    history.replaceState({},null,null);
		    function checkModal(result){
		    	if(result === '' || history.state ){
		    	return;
		    	}
		    	if(parseInt(result)>0){
		    	$(".modal-body").html("도서 "+parseInt(result)+" 번이 등록되었습니다.");
		    	}
		    	$("#myModal").modal("show");
		    }
		
			// Delete script 삭제 버튼 클릭 시 모달 창 표시
			$(".btn-deleteAsk").click(function () {
				$("#deleteConfirmationModal").modal("show");
			});
			
		});
		</script>
		
	<footer id="footer" class="mt-auto">
		<div id="nav_box">
			<%@ include file="../../include/footer.jsp" %>
		</div>
	</footer>
