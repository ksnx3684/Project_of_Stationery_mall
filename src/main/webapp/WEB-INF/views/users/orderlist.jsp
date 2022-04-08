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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
<body>
    <div class="container" style="text-align:center; width:800px">
        <h2>주문내역</h2>
        <table class="table">
            <thead>
                <tr class="success">
                    <th style="text-align:center; background-color: #c9de73;">주문번호</th>
                    <th style="text-align:center; background-color: #c9de73;">주문날짜</th>         
                    <th style="text-align:center; background-color: #c9de73;">주문상태</th>
                    <th style="text-align:center; background-color: #c9de73;">결제상태</th>
                    <th style="text-align:center; background-color: #c9de73;">주문금액</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orderlist}" var="dto">
                    <tr class="active">
                        <td><a href="./orderDetail?orderNum=${dto.orderNum}">${dto.orderNum}</a></td>
                        <td>${dto.orderDate}</td>
                        <td class="orderval"></td><input type="hidden" id="order" value="${dto.orderCheck}">
                        <td class="payval"></td><input type="hidden" id="pay" value="${dto.payCheck}">
                        <td>${dto.totalPrice}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script type="text/javascript" src="../resources/js/users/orderlist.js"></script>
    <script src="../resources/js/hamberger.js"></script>
</body>
</html>