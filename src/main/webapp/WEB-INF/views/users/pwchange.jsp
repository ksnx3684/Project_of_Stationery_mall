<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<link rel="stylesheet" href="../resources/css/pwchange.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
<body>
    <div id = total>
        <div class="container" style="width:500px;">
            <h2 style="text-align: center;">비밀번호 변경</h2>
            <form class="frm" action="./pwchange" method="post" id="frm" enctype="multipart/form-data">
                <input type="hidden" name="id" id="id" value="${usersDTO.id}">
                <div class="form-group">
                    <label for="pwd">새 비밀번호 입력</label>
                    <span id="pwResult1"></span>
                    <span id="pwResult2"></span>
                    <input type="password" class="form-control" placeholder="8글자 이상 16글자 이하" name="pw" id="pw">
                </div>
                <div class="form-group">
                    <label for="pwd">비밀번호 확인</label>
                    <span id="pwResultCheck1"></span>
                    <span id="pwResultCheck2"></span>
                    <input type="password" class="form-control" placeholder="8글자 이상 16글자 이하" name="pw2" id="pw2">
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary" id="btn">변경</button>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="../resources/js/users/pwchange.js"></script>
    <script src="../resources/js/hamberger.js"></script>
</body>
</html>