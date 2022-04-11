<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원주문내역</title>
</head>
<link rel="stylesheet" href="../resources/css/usersOrderList.css">
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
    <script type="text/javascript" src="../resources/js/admin/usersOrderList.js"></script>
</body>
</html>