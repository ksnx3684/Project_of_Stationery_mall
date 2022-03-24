<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<c:if test="${usersDTO.usersFileDTO.oriName ne null}">
		<img src="../resources/upload/users/${usersDTO.usersFileDTO.fileName}">
	</c:if>
	<h1>아이디 : ${usersDTO.id}</h1>
	<h1>이름 : ${usersDTO.name}</h1>
	<h1>전화번호 : ${usersDTO.phone}</h1>
	<h1>이메일 : ${usersDTO.email}</h1>
	<h1>가입일자 : ${usersDTO.joinDate}</h1>
	<h1>배송지명 : ${usersDTO.addressName}</h1>
	<h1>배송지 연락처 : ${usersDTO.addressPhone}</h1>
	<h1>우편번호 : ${usersDTO.postalCode}</h1>
	<h1>배송지 주소 : ${usersDTO.addressDetail}</h1>
	<a href="./mychange"><button id="update">내 정보 변경</button></a>
	<a href="./wishlist"><button id="wishlist">위시리스트</button></a>
	<a href="./orderlist"><button id="orderlist">주문내역</button></a>
	<a href="/project/users/logout">로그아웃</a>
</body>
</html>