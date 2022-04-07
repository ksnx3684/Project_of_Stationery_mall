<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
</head>
<body>
    <div class="container" style="width:400px; margin-top: 5%;">
        <a href="./infochange"><button id="info" class="btn btn-info">개인정보 변경</button></a>
        <a href="./pwchange"><button id="pw" class="btn btn-info">비밀번호 변경</button></a>
        <a href="./withdrawal"><button id="with" class="btn btn-danger">회원탈퇴</button></a>
    </div>
    <script src="../resources/js/hamberger.js"></script>
</body>
</html>