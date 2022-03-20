<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<h1>아이디 : ${dto.id}</h1>
	<h1>이름 : ${dto.name}</h1>
	<h1>전화번호 : ${dto.phone}</h1>
	<h1>이메일 : ${dto.email}</h1>
	<h1>가입일자 : ${dto.joinDate}</h1>
	<h1>배송지명 : ${dto.addressName}</h1>
	<h1>배송지 연락처 : ${dto.addressPhone}</h1>
	<h1>우편번호 : ${dto.postalCode}</h1>
	<h1>배송지 주소 : ${dto.addressDetail}</h1>
	<button id="update">개인정보 변경</button>
	<button id="wishlist">위시리스트</button>
	<button id="orderlist">주문내역</button>
	<a href="/project/users/logout">로그아웃</a>
</body>
</html>