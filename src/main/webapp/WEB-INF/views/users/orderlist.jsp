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
    <div class="orderlist">
        <ul class="orderlist_box">
            <li class="col">
                주문번호
            </li>
            <li class="col">
                주문날짜
            </li>
            <li class="col">
                상품명
            </li>
            <li class="col">
                주문금액
            </li>
            <li class="col">
                주문상태
            </li>
            <li class="col">
                결재상태
            </li>
        </ul>
        <ul class="orderlist_box">
            <c:forEach items="${orderlist}" var="dto">
                <li class="col">
                    ${dto.orderNum}
                </li>
                <li class="col">
                    ${dto.orderDate}
                </li>
                <li class="col">
                    ${dto.productDTO.name}
                </li>
                <li class="col">
                    ${dto.totalPrice}
                </li>
                <li class="col">
                    ${dto.orderCheck}
                </li>
                <li class="col">
                    ${dto.payCheck}
                </li>
            </c:forEach>
        </ul>   
    </div>

</body>
</html>