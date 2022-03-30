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

		<h1>주문번호 : ${usersOrderDetail.orderNum}</h1>
		<h1>ID : ${usersOrderDetail.id}</h1>
		<h1>주문날짜 : ${usersOrderDetail.orderDate}</h1>
		<h1>총 금액 : ${usersOrderDetail.totalPrice}</h1>
		<h1>배송지 : ${usersOrderDetail.addressDetail}</h1>
		<h1>메모 : ${usersOrderDetail.memo}</h1>
		<h1>결제수단 : ${usersOrderDetail.payMethodDTO.cardName}</h1>
		
		<%-- <c:forEach items="${usersOrderDetail.orderDetailDTOs}" var="d">
			<h1>상품 : ${d.productNum}</h1>
		</c:forEach> --%>
		<%-- <c:forEach items="${usersOrderDetail.orderDetailDTOs[0].productDTOs}" var="d">
			<h1>상품 : ${d.name}</h1>
		</c:forEach> --%>
		<c:forEach items="${usersOrderDetail.orderDetailDTOs}" var="d">
			<h1>상품 : ${d.name}</h1>
		</c:forEach>
</body>
</html>