<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세</title>
</head>
<body>
	<%-- <c:if test="${usersDetail.usersFileDTO.oriName ne null}">
		<img class="image" src="../resources/upload/users/${usersDetail.usersFileDTO.fileName}">
	</c:if> --%>
	<h1>아이디 : ${usersDetail.id}</h1>
	<h1>이름 : ${usersDetail.name}</h1>
	<h1>전화번호 : ${usersDetail.phone}</h1>
	<h1>이메일 : ${usersDetail.email}</h1>
	<h1>가입일자 : ${usersDetail.joinDate}</h1>
	<h1>배송지명 : ${usersDetail.addressName}</h1>
	<h1>배송지 연락처 : ${usersDetail.addressPhone}</h1>
	<h1>우편번호 : ${usersDetail.postalCode}</h1>
	<h1>배송지 주소 : ${usersDetail.addressDetail}</h1>
</body>
</html>