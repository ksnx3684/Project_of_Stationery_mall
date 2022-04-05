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
		<h1>주문번호 : ${orderDetail.orderNum}</h1>
		<h1>주문날짜 : ${orderDetail.orderDate}</h1>
		<h1>총 금액 : ${orderDetail.totalPrice}</h1>
		<h1>배송지 : ${orderDetail.addressDetail}</h1>
		<h1>메모 : ${orderDetail.memo}</h1>
		<h1>결제수단 : ${orderDetail.cardName}</h1>
		
		<c:forEach items="${orderDetail.orderDetailDTOs}" var="d">
			<h1>상품 : ${d.name}</h1>
		</c:forEach>

</body>
</html>