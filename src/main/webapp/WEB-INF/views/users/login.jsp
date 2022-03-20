<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <form class="frm" action="./login" method="post">
        <fieldset>
            <legend>ID</legend>
            <input type="text" placeholder="ID" name="id" value="${cookie.remember.value}">
        </fieldset>
        <fieldset>
            <legend>PW</legend>
            <input type="password" placeholder="PW" name="pw">
        </fieldset>
        <fieldset>
            <legend>ID 저장</legend>
            <input type="checkbox" name="remember" value="1">
        </fieldset>
        <fieldset>
            <button type="submit">로그인</button>
        </fieldset>
    </form>
</body>
</html>