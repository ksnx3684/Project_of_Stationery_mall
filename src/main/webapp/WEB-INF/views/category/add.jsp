<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Category Add Page</h1>


최상위 카테고리 추가하기
<!-- 최상위 카테고리 추가  -->
<!--  100단위로  -->
<!-- parentId =null  -->
<!-- 추가하기전에 최상위 카테고리 번호 마지막거 알아야함  -->

<form action="">

카테고리 이름<input type="text" name="categoryName">

<c:forEach items="${list}" var="list" varStatus="state">
<!-- 마지막 최상위 카테고리 번호에 +100 -->
<c:if test="${state.last}">
<input type="hidden" name="categoryNum" value="${list.categoryNum+100}">
<!-- 변수 선언 -->
<c:set var="cateNum" value="${list.categoryNum+100}"></c:set>
</c:if>
</c:forEach>
<hr>

하위 카테고리 추가하기  
<p>
카테고리 이름<input type="text" name="categoryName">
<input type="hidden" name="categoryNum" value="${cateNum+1}">
<input type="hidden" name="parentId" value="${cateNum}">

</form>
<!-- 하위 카테고리 추가  -->
<!-- 상위카테고리 +1씩 -->
<!-- parentId = 최상위 카테고리  -->
</body>
</html>