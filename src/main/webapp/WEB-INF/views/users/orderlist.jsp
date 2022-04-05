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
    <h1>주문내역</h1>
    <div class="li_table">
        <ul>
            <li class="menu">주문번호</li>
            <li class="menu">주문날짜</li>         
            <li class="menu">주문상태</li>
            <li class="menu">결제상태</li>
            <li class="menu">주문금액</li>
        </ul>
        <c:forEach items="${orderlist}" var="dto">
        <ul>
            <a href="./orderDetail?orderNum=${dto.orderNum}"><li class="list">${dto.orderNum}</li></a>
            <li class="list">${dto.orderDate}</li>
            <li class="list" id="order" value="${dto.orderCheck}"></li>
            <li class="list" id="pay" value="${dto.payCheck}"></li>
            <li class="list">${dto.totalPrice}</li>
        </ul>
        </c:forEach>
    </div>
    <script type="text/javascript" src="../resources/js/users/orderlist.js"></script>
</body>
</html>