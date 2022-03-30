<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<link rel="stylesheet" href="../resources/css/cartView.css">
<body>
	
	<%-- <c:forEach items="${view}" var="dto">
		<h1>상품명 : ${dto.productDTO.name}</h1>
		<h1>갯수 : ${dto.productCount}</h1>
		<h1>가격 : ${dto.productDTO.price}</h1>
		<h1>총 가격 : ${dto.totalPrice}</h1>
	</c:forEach>
	<h1>합계 금액 : </h1>
	<h1>상품명 : ${view.productDTOs.name}</h1>
	<h1>갯수 : ${view.productCount}</h1>
	<h1>가격 : ${view.productDTOs.price}</h1>
	<h1>총 가격 : ${view.totalPrice}</h1>
	<a href="../order/order"><button>주문하기</button></a>
	<a href="../"><button>쇼핑계속하기</button></a> --%>
	
	<table class="tg" style="table-layout: fixed; width: 800px">
        <colgroup>
        <col style="width: 550px">
        <col style="width: 100px">
        <col style="width: 150px">
        </colgroup>
        <thead>
          <tr>
            <th class="tg-daby">상품명</th>
            <th class="tg-daby">갯수</th>
            <th class="tg-daby">가격</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${view}" var="dto">
          <tr class="contents">
            <td class="tg-af47 name"><input class="check" type="checkbox">${dto.productDTO.name}</td>
            <td class="tg-af47 con count">${dto.productCount}</td>
            <td class="tg-af47 con price">${dto.productDTO.price}</td>
          </tr>
        </c:forEach>
          <tr>
            <td class="tg-10pf"></td>
            <td class="tg-10pf"></td>
            <td class="tg-10pf"></td>
          </tr>
        </tbody>
        </table>
		<c:forEach items="${view}">
			<span class="totalPrice"></span>
		</c:forEach>
		<span>원</span><br>
        <a href="../order/order"><button>주문하기</button></a>
	    <a href="../"><button>쇼핑계속하기</button></a>
		<script type="text/javascript" src="../resources/js/cart/view.js"></script>
</body>
</html>