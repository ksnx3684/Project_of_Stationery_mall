<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원주문내역</title>
</head>
<link rel="stylesheet" href="../resources/css/admin/usersOrderList.css">
<body>
    <div class="li_table">
        <ul>
            <li class="menu orderNum">주문번호</li>
            <li class="menu ID">ID</li>
            <li class="menu orderDate">주문날짜</li>
            <li class="menu orderCheck">주문상태</li>
            <li class="menu payCheck">결제상태</li>
            <li class="menu totalPrice">총 금액</li>
        </ul>
        <c:forEach items="${usersOrderList}" var="dto">
        <ul>
            <a href="./usersOrderDetail?orderNum=${dto.orderNum}"><li class="list orderNum">${dto.orderNum}</li></a>
            <li class="list ID">${dto.id}</li>
            <li class="list orderDate">${dto.orderDate}</li>
            <li class="list orderCheck" id="order" value="${dto.orderCheck}"></li>
            <li class="list payCheck" id="pay" value="${dto.payCheck}"></li>
            <li class="list totalPrice">${dto.totalPrice}</li>       
        </ul>
        </c:forEach>
    </div>
    <script type="text/javascript" src="../resources/js/admin/usersOrderList.js"></script>
</body>
</html>