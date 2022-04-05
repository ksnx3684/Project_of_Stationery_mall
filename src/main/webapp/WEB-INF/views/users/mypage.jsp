<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${usersDTO.usersFileDTO.oriName ne null}">
		<img class="image" src="../resources/upload/users/${usersDTO.usersFileDTO.fileName}">
	</c:if>
	<h3>아이디 : ${usersDTO.id}</h3>
	<h3>이름 : ${usersDTO.name}</h3>
	<h3>전화번호 : ${usersDTO.phone}</h3>
	<h3>이메일 : ${usersDTO.email}</h3>
	<h3>가입일자 : ${usersDTO.joinDate}</h3>
	<h3>배송지명 : ${usersDTO.addressName}</h3>
	<h3>배송지 연락처 : ${usersDTO.addressPhone}</h3>
	<h3>우편번호 : ${usersDTO.postalCode}</h3>
	<h3>배송지 주소 : ${usersDTO.addressDetail}</h3>
	<%-- <h1>회원 : ${usersDTO.userAccount}</h1> --%>
	<a href="./mychangecheck"><button id="update" class="btn btn-info">내 정보 변경</button></a>
	<a href="./wishlist"><button id="wishlist" class="btn btn-primary">위시리스트</button></a>
	<a href="./orderlist"><button id="orderlist" class="btn btn-primary">주문내역</button></a>
	<a href="../cart/cartlist"><button id="cart" class="btn btn-primary">장바구니</button></a>
	
	<a href="/project/users/logout"><button class="btn btn-danger">로그아웃</button></a>
	<c:if test="${usersDTO.userAccount eq 0}">
		<a href="./otp/first"><button id="manager" class="btn btn-warning">관리자페이지</button></a>
	</c:if>
</body>
</html>