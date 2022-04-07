<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
<body>
<h1 style="color: red;">정말 탈퇴하시겠습니까?</h1>
<h1 style="color: red;">모든 회원정보가 삭제되며, 복구되지 않습니다</h1>
<a href="../"><button class="btn btn-primary">메인으로 돌아가기</button></a>
<form class="frm" action="./withdrawalfinal" method="post"><br>
	<button id="final" class="btn btn-danger" type="submit">회원탈퇴</button>
</form>
    <script type="text/javascript" src="../resources/js/users/withdrawalfinal.js"></script>
    <script src="../resources/js/hamberger.js"></script>
</body>
</html>