<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<hr>
catelist.jsp
<div class="category">
<c:forEach items="${list}" var="list">
<a href="/project/product/list?categoryName=${list.categoryName}">${list.categoryName}</a>
</c:forEach>
</div>
<hr>
</body>
</html>