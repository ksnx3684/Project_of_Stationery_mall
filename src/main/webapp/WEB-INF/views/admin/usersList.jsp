<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<link rel="stylesheet" href="../resources/css/usersList.css">
<body>
	<div class="li_table">
        <ul>
            <li class="menu">ID</li>
            <li class="menu">이름</li>
            <li class="menu">전화번호</li>
            <li class="menu">이메일</li>
            <li class="menu">성별</li>
            <li class="menu">가입날짜</li>
            <li class="menu">계정분류</li>
        </ul>
        <c:forEach items="${usersList}" var="dto">
        <ul>
            <a href="./usersDetail?id=${dto.id}"><li class="list">${dto.id}</li></a>
            <li class="list">${dto.name}</li>
            <li class="list">${dto.phone}</li>
            <li class="list">${dto.email}</li>
            <li class="list">${dto.gender}</li>
            <li class="list">${dto.joinDate}</li>
            <li class="list account" id="userAccount" value="${dto.userAccount}"></li>
        </ul>
        </c:forEach>
    </div>
    <script type="text/javascript" src="../resources/js/admin/usersList.js"></script>
</body>
</html>