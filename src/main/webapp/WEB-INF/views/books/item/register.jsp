<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon/favicon.ico'/>"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>도서 등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<!-- bootstrap -->
	<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
				<div class="jumbotron">
					<div class="container">
						<h1 class="display-4">도서 등록</h1>
					</div>
				</div>
				<div class="container">
					<form name="form" role="register" action="<c:url value='/books/register' />" class="form-horizontal needs-validation" method="post" onsubmit="submitForm(event)" autocomplete="off" novalidate enctype="multipart/form-data">
						<div class="form-group row">
							<div class="col-sm-3">
								<div class="select_img">
									<img src="${ books.image }" />
								</div>
								<label for="img">도서 이미지</label>
								<input class="form-control-file" type="file" name='file' id="img">
								<script>
								 	$("#img").change(function(){
								   		if(this.files && this.files[0]) {
								    		var reader = new FileReader;
								    		reader.onload = function(data) {
								     			$(".select_img img").attr("src", data.target.result).width(200);        
								    		}
								    		reader.readAsDataURL(this.files[0]);
								   		}
								  	});
								 </script>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2" for="title">도서명</label>
							<div class="col-sm-3">
								<input type="text" name="title" class="form-control" required maxLength=45>
								<div class="invalid-feedback">도서명을 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">ISBN</label>
							<div class="col-sm-3">
								<input type="text" name="bookISBN" class="form-control" maxLength=20>
								<div class="invalid-feedback">ISBN을 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">가격</label>
							<div class="col-sm-3">
								<input type="text" id="priceInput" name="price" class="form-control" required maxLength="8" oninput="formatPrice(this)">
								<div class="invalid-feedback">가격을 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">저자</label>
							<div class="col-sm-3">
								<input type="text" name="author" class="form-control" required maxLength=45>
								<div class="invalid-feedback">저자를 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">출판사</label>
							<div class="col-sm-3">
								<input type="text" name="publisher" class="form-control" required maxLength=45>
								<div class="invalid-feedback">출판사를 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">총 페이지 수</label>
							<div class="col-sm-3">
								<input type="number" name="totalPages" class="form-control" required maxLength=8>
								<div class="invalid-feedback">총 페이지 수를 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">분류</label>
							<div class="col-sm-3">
								<select name="category" class="form-select" required>
			          				<option value ="" selected disabled hidden>선택</option>
			          				<option value = "health">건강</option>
			          				<option value = "hobby">취미</option>
			         				<option value = "management">경영</option>
			         				<option value = "language">외국어</option>
			         				<option value = "development">자기개발</option>
			         				<option value = "cooking">요리</option>
			       				</select>
			       				<div class="invalid-feedback">분류를 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">재고 수</label>
							<div class="col-sm-3">
								<input type="number" id="stock" name="stock" class="form-control" required maxLength=8>
								<div class="invalid-feedback">재고 수를 확인해주세요.</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">도서 소개</label>
							<div class="col-sm-3">
								<textarea cols="50" rows="5" name="content" maxLength=800></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-offset-2 col-sm-10 ">
								<input type="submit" class="btn btn-primary" value="등록">
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
				
			</section>
		</div>
		
		<script type="text/javascript">
			    function formatPrice(input) {
			        // 입력값에서 숫자와 콤마만 남기기
			        let value = input.value.replace(/[^0-9]/g, '');
			
			        // 천 단위로 콤마 추가
			        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			
			        // 수정된 값을 입력 필드에 다시 할당
			        input.value = value;
			    }
			
			    function submitForm(event) {
			        // 기본 폼 제출 동작 차단
			        event.preventDefault();
			
			        const priceInput = document.getElementById('priceInput');
			        // 콤마 제거
			        priceInput.value = priceInput.value.replace(/,/g, '');
			
			        // 유효성 검사 수행
			        const form = event.target;
			        if (form.checkValidity()) { // 유효성 검사 통과 시
			            form.submit(); // 폼 제출
			        } else {
			            form.classList.add('was-validated'); // 유효성 검사 실패 시 스타일 적용
			        }
			    }
			</script>
		
		<script type="text/javascript" src="/resources/item/js/register.js"></script>
			
	<footer id="footer" class="mt-auto">
		<div id="nav_box">
			<%@ include file="../../include/footer.jsp" %>
		</div>
	</footer>