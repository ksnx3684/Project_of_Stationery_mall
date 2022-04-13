<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 리뷰 내역 - SQUARE SHOP</title>
    <c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
    <link rel="stylesheet" href="../resources/css/orderlist.css">
    <style>
        th, td{
        vertical-align:middle !important;
        height: 50px;
    }
    </style>
    </head>
    <body>
        <div class="container" style="text-align:center; width:800px">
            <h2>리뷰 작성 내역</h2>
            <table class="table">
                <thead>
                    <tr class="success">
                        <th style="text-align:center; background-color: #cee5d0;">글번호</th>
                        <th style="text-align:center; background-color: #cee5d0;">작성자</th>         
                        <th style="text-align:center; background-color: #cee5d0;">주문상품</th>
                        <th style="text-align:center; background-color: #cee5d0;">제목</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.reviewDTO}" var="dto">
                        <tr class="active">
                            <td>${dto.num}</td>
                            <td>${dto.id}</td>
                             <c:forEach items="${dto.orderDetailDTOs}" var="od">
                        	<td><a href="../product/detail?productNum=${od.productNum}">${od.name}</a></td>                        
                        	</c:forEach> 
                            <td><a href="../review/reviewDetail?num=${dto.num}">${dto.title}</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script type="text/javascript" src="../resources/js/users/orderlist.js"></script>
        <script src="../resources/js/hamberger.js"></script>
</body>
</html>