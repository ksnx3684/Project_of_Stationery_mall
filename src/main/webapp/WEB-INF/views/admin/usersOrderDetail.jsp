<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/orderDetail.css">
</head>
<body>

		<h1>주문번호 : ${usersOrderDetail.orderNum}</h1>
		<h1>ID : ${usersOrderDetail.id}</h1>
		<h1>주문날짜 : ${usersOrderDetail.orderDate}</h1>
		<h1>총 금액 : ${usersOrderDetail.totalPrice}</h1>
		<h1>배송지 : ${usersOrderDetail.addressDetail}</h1>
		<h1>메모 : ${usersOrderDetail.memo}</h1>
		<h1>결제수단 : ${usersOrderDetail.cardName}</h1>
		
		<c:forEach items="${usersOrderDetail.orderDetailDTOs}" var="d">
			<h1>상품 : ${d.name}</h1>
		</c:forEach>

		<div class="items">
			<ul>
				<c:forEach items="${usersOrderDetail.orderDetailDTOs}" var="d">
					<li class="each">
						<div class="thumbnail">
							<a href="../product/detail?productNum=${d.productNum}">
								<c:forEach items="${d.productDTOs}" var="dt">
									<c:if test="${dt.thumbnail ne null}">
										<img src="../resources/upload/product/${dt.thumbnail}">
									</c:if>
								</c:forEach>
								${d.name}&nbsp;
								<c:if test="${d.optionContents ne null && d.optionContents ne '0'}">
									( 옵션 : ${d.optionContents} )
								</c:if>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
</body>
</html>