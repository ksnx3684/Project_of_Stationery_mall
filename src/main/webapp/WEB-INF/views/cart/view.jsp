<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<c:forEach items="${view}" var="dto">
		<h1>상품명 : ${dto.productDTO.name}</h1>
		<h1>갯수 : ${dto.productCount}</h1>
		<h1>가격 : ${dto.productDTO.price}</h1>
		<h1>총 가격 : ${dto.totalPrice}</h1>
	</c:forEach>
	<%-- <h1>상품명 : ${view.productDTOs.name}</h1>
	<h1>갯수 : ${view.productCount}</h1>
	<h1>가격 : ${view.productDTOs.price}</h1>
	<h1>총 가격 : ${view.totalPrice}</h1> --%>

</body>
</html>