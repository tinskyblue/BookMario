<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>도서 수정</title>
	<!-- bootstrap -->
	<link rel="Stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
		
		<section class="py-5" id="container">
			<div class="jumbotron">
				<div class="container">
					<h1 class="display-4">도서 수정</h1>
				</div>
			</div>
			<div class="container">
				<form name="form" role="update" action="<c:url value="/books/update" />" class="form-horizontal" method="post" autocomplete="off" novalidate enctype="multipart/form-data">
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
							<%=request.getRealPath("/resources/img/") %>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서명</label>
						<div class="col-sm-3">
							<input type="text" name="title" class="form-control" value="${ book.title }" required maxLength=20>
							<div class="invalid-feedback">도서명을 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">ISBN</label>
						<div class="col-sm-3">
							<input type="text" name="bookISBN" class="form-control" value="${ book.bookISBN }" required maxLength=20>
							<div class="invalid-feedback">ISBN을 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" name="price" class="form-control" value="${ book.price }" required maxLength=20>
							<div class="invalid-feedback">가격을 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-3">
							<input type="text" name="author" class="form-control" value="${ book.author }" required maxLength=20>
							<div class="invalid-feedback">저자를 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-3">
							<input type="text" name="publisher" class="form-control" value="${ book.publisher }" required maxLength=20>
							<div class="invalid-feedback">출판사를 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">총 페이지 수</label>
						<div class="col-sm-3">
							<input type="text" name="totalPages" class="form-control" value="${ book.totalPages }" required maxLength=20>
							<div class="invalid-feedback">총 페이지 수를 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<select name="category" class="form-select" required>
		          				<option value = "" selected disabled hidden>선택</option>
		          				<option value = "건강취미">건강/취미</option>
		         				<option value = "경제경영">경제경영</option>
		         				<option value = "외국어">외국어</option>
		         				<option value = "자기개발">자기개발</option>
		         				<option value = "요리살림">요리/살림</option>
		         				<option value = "장르소설">장르소설</option>
		       				</select>
		       				<div class="invalid-feedback">분류를 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="bStock" name="stock" class="form-control" value="${ book.stock }" required maxLength=20>
							<div class="invalid-feedback">재고 수를 확인해주세요.</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서 소개</label>
						<div class="col-sm-3">
							<textarea cols="50" rows="5" name="content"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input name="bookID" type="hidden" value="${ book.bookID }">
		    				<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
			<script type="text/javascript" src="/resources/item/js/edit.js"></script>
		</section>
		<footer id="footer" class="mt-auto">
			<div id="nav_box">
				<%@ include file="../../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>