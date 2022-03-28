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
<h5>category list</h5>
<div class="category">
<a href="/project/category/add">category add</a>
<p>
<c:forEach items="${list}" var="list">
<a href="/project/product/list?categoryNum=${list.categoryNum}">${list.categoryName}</a>
</c:forEach>
</div>
<hr>
</body>
</html>