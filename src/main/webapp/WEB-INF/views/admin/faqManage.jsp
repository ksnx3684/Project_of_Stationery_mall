<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ 관리</title>
</head>
<link rel="stylesheet" href="../resources/css/usersOrderList.css">
<c:import url="../template/header.jsp"></c:import>

<link rel="stylesheet" href="../resources/css/hamberger.css">
<link rel="stylesheet" href="../resources/css/index.css">
<body>
    <div class="li_table">
        <ul>
            <li class="menu num">글번호</li>
            <li class="menu id">ID</li>
            <li class="menu title">제목</li>
        </ul>
        <c:forEach items="${faqManage}" var="dto">
        <ul>
            <li class="list num"><a href="../faq/detail?num=${dto.num}">${dto.num}</a></li>
            <li class="list id">${dto.id}</li>
            <li class="list title">${dto.title}</li>
        </ul>
        </c:forEach>
    </div>
    
    <div style="margin-top:50px; margin : 0 auto;">
    <button type="button"><a href="../faq/add">새로운 FaQ 추가</a></button>
    </div>
    <script type="text/javascript" src="../resources/js/admin/usersOrderList.js"></script>
    <script src="../resources/js/hamberger.js"></script>
</body>
</html>