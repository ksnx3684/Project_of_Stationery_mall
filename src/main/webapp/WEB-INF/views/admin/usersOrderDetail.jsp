<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
</head>
<body>
	<c:forEach items="${usersOrderDetail}" var="od">
		<h1>주문번호 : ${od.orderNum}</h1>
		<h1>ID : ${od.id}</h1>
		<h1>주문날짜 : ${od.orderDate}</h1>
		<h1>배송지 : ${od.addressDetail}</h1>
		<h1>총 금액 : ${od.totalPrice}</h1>
		<h1>메모 : ${od.memo}</h1>
		<h1>상품 : ${od.orderDetailDTO.detailNum}</h1>
	</c:forEach>
</body>
</html>