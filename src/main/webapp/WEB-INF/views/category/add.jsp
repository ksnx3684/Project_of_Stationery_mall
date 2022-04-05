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
<hr> <!-- 현재 카테고리 목록  -->
<div id="categoryList">
<form action="./delete" method="post" enctype="multipart/form-data">
<c:forEach items="${list}" var="list" varStatus="i">
<div class="cate${list.parentId eq null?list.categoryNum:list.parentId}">

	<c:choose>
		<c:when test="${list.parentId eq null}">
			${list.categoryName} <button class="categoryDeleteBtn" type="button" data-num="${list.categoryNum}">X</button>
		</c:when>
			<c:otherwise>
				&nbsp;&nbsp;&nbsp;-${list.categoryName} <button id="categoryDeleteBtn" type="button" data-num="${list.categoryNum}" class="${list.parentId} del" >X</button>
			</c:otherwise>
	</c:choose>
	</div>
</c:forEach>
<hr>
</form>
</div>

<!-- 최상위 카테고리 추가  -->
<!--  100단위로  -->
<!-- parentId =null  -->
<!-- 추가하기전에 최상위 카테고리 번호 마지막거 알아야함  -->

<form action="./add" method="post" enctype="multipart/form-data" >
상위 카테고리 추가하기<p>
카테고리 이름<input type="text" name="categoryName">
<hr>
하위 카테고리 추가하기 (최대 9개)<p> 
카테고리 이름<input type="text" name="categoryName">
<div id="subcategoryResult"></div>
<p>
<button id="subCategory_btn" type="button">하위 카테고리 항목 추가</button>
<p>
<button type="submit">ADD</button>

</form>
<!-- 하위 카테고리 추가  -->
<!-- 상위카테고리 +1씩 -->
<!-- parentId = 최상위 카테고리  -->
<script src="../resources/js/product/addCategory.js"></script>
</body>
</html>