<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
</head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
	<div class="container" style="text-align:center; width:800px">
		<h2>위시리스트</h2>
		<table class="table">
		  <thead>
			<tr class="success">
			  <th style="text-align:center">번호</th>
			  <th style="text-align:center">상품명</th>
			</tr>
		  </thead>
		  <tbody>
			<c:forEach items="${wishlistDTO}" var="dto">
			<tr class="active">
			  <td>${dto.wishNum}</td>
			  <td onclick="location.href='./orderDetail?orderNum=${dto.wishNum}'">${dto.productDTO.name}</td> <!--나중에 링크 수정-->
			</tr>
			</c:forEach>
		  </tbody>
		</table>
	</div>
</body>
</html>