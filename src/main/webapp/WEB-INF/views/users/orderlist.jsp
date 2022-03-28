<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<link rel="stylesheet" href="../resources/css/orderlist.css">
<body>
    <div class="li_table">
        <ul>
            <li class="menu">주문번호</li>
            <li class="menu">주문날짜</li>
            <li class="menu">상품명</li>
            <li class="menu">주문금액</li>
            <li class="menu">주문상태</li>
            <li class="menu">결제상태</li>
        </ul>
        <c:forEach items="${orderlist}" var="dto">
        <ul>
            <li class="list">${dto.orderNum}</li>
            <li class="list">${dto.orderDate}</li>
            <li class="list">${dto.productDTO.name}</li>
            <li class="list">${dto.totalPrice}</li>
            <li class="list" id="order" value="${dto.orderCheck}"></li>
            <li class="list" id="pay" value="${dto.payCheck}"></li>
        </ul>
        </c:forEach>
    </div>
    <script type="text/javascript" src="../resources/js/users/orderlist.js"></script>
</body>
</html>