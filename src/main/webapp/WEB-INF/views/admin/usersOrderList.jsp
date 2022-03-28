<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원주문내역</title>
</head>
<link rel="stylesheet" href="../resources/css/usersOrderList.css">
<body>
    <div class="li_table">
        <ul>
            <li class="menu">주문번호</li>
            <li class="menu">ID</li>
            <li class="menu">주문날짜</li>
            <li class="menu">주문상태</li>
            <li class="menu">결제상태</li>
            <li class="menu">총 금액</li>
            <li class="menu">메모</li>
        </ul>
        <c:forEach items="${usersOrderList}" var="dto">
        <ul>
            <a href="./orderDetail?orderNum=${dto.orderNum}"><li class="list">${dto.orderNum}</li></a>
            <li class="list">${dto.id}</li>
            <li class="list">${dto.orderDate}</li>
            <li class="list" id="order" value="${dto.orderCheck}"></li>
            <li class="list" id="pay" value="${dto.payCheck}"></li>
            <li class="list">${dto.totalPrice}</li>
            <li class="list">${dto.memo}</li>          
        </ul>
        </c:forEach>
    </div>
    <script type="text/javascript" src="../resources/js/admin/usersOrderList.js"></script>
</body>
</html>