<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문제품내역</title>
</head>
<body>
	<c:forEach items="${usersOrderProduct}" var="od">
		<h1>주문번호 : ${od.orderNum}</h1>
		<h1>ID : ${od.id}</h1>
		<h1>주문날짜 : ${od.orderDate}</h1>
		<h1>총 금액 : ${od.totalPrice}</h1>
		<h1>배송지 : ${od.addressDetail}</h1>
		<h1>메모 : ${od.memo}</h1>

		<h1>상품 : <a href="">${od.orderDetailDTO.detailNum}</h1></a>
	</c:forEach>

</body>
</html>