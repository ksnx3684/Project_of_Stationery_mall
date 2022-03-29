<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>1</h1>
	<c:forEach items="${wishlistDTO}" var="dto">
		<h1>wishNum : ${dto.wishNum}</h1>
		<h1>id : ${dto.id}</h1>
		<h1>name : ${dto.productDTO.name}</h1>
	</c:forEach>
</body>
</html>