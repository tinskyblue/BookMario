<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>404 Error</title>
</head>
<body>
	<h1>해당 URL은 존재하지 않습니다.</h1>
	
	<h4><c:out value="${exception.getMessage()}" /></h4>
	
	<ul>
		<c:forEach items="${ exception.getStackTrace() }" var="stack">
			<li><c:out value="${stack }" /></li>
		</c:forEach>
	</ul>
	
</body>
</html>