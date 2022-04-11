<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/project/resources/css/catelist.css">
<body>


<div class="category">
<%-- 	<div class="adminBtn">
		<c:if test="${auth.userAccount eq 0}">
			<button><a href="/project/category/add">카테고리 추가/삭제</a>
		</c:if>
	</div> --%>
	<div class="nav" id="cate_nav">
		<a href="/project/product/list?categoryNum=0">전체상품</a>
			<c:forEach items="${list}" var="list">
				<a href="/project/product/list?categoryNum=${list.categoryNum}">${list.categoryName}</a>
			</c:forEach>
	</div>
</div>
<hr>
</body>
</html>