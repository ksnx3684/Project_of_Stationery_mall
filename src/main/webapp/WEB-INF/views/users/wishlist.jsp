<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
</head>
	<link rel="stylesheet" href="../resources/css/wishlist.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
<body>
	<div class="container" style="text-align:center; width:800px">
		<h2>위시리스트</h2>
		<table class="table">
		  <thead>
			<tr class="success">
			  <th style="text-align:center; background-color: #cee5d0;">번호</th>
			  <th style="text-align:center; background-color: #cee5d0;">상품명</th>
			</tr>
		  </thead>
		  <tbody>
			<c:forEach items="${wishlistDTO}" var="dto">
				<tr class="active">
					<td>${dto.wishNum}</td>
					<td><a href="../product/detail?productNum=${dto.productNum}">
						<c:if test="${dto.productDTO.thumbnail ne null}">
							<img class="image" src="../resources/upload/product/${dto.productDTO.thumbnail}" style="width:32px; height: 32px;">&nbsp;
						</c:if>
						${dto.productDTO.name}</a>
					</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
	</div>
	<script src="../resources/js/hamberger.js"></script>
</body>
</html>