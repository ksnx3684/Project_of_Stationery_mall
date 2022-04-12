<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
	<link rel="stylesheet" href="../resources/css/orderDetail.css">
</head>
<body>
		<h2>주문번호 : ${orderDetail.orderNum}</h2>
		<h2>주문날짜 : ${orderDetail.orderDate}</h2>
		<h2>결제 금액 : ${orderDetail.totalPrice}</h2>
		<h2>배송지 : ${orderDetail.addressDetail}</h2>
		<h2>배송메모 : ${orderDetail.memo}</h2>
		<h2>결제수단 : ${orderDetail.cardName}</h2>
		<h2>구매상품</h2>
		<div class="items">
			<ul>
				<c:forEach items="${orderDetail.orderDetailDTOs}" var="d">
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
						<a href="../review/reviewAdd?productNum=${d.productNum}&detailNum=${d.detailNum}">리뷰작성</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<!-- <c:forEach items="${orderDetail.orderDetailDTOs}" var="d">
			<h1>상품 : ${d.name} ( 옵션 : ${d.optionContents} )</h1>
			<c:forEach items="${d.productDTOs}" var="dt">
				<c:if test="${dt.thumbnail ne null}">
					<img class="image" src="../resources/upload/product/${dt.thumbnail}">
				</c:if>
			</c:forEach>
		</c:forEach> -->

		
		<script src="../resources/js/hamberger.js"></script>
</body>
</html>