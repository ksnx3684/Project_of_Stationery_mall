<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main page!</h1>
	<c:import url="/category/catelist"></c:import>


<P>  The time on the server is ${serverTime}. </P>
<a href="./users/login">Login</a>
<a href="./faq/list">Faq</a>
<a href="./notices/list">Notices</a>

</body>
</html>