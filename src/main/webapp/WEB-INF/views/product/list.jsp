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
list.jsp

<div>

		<form action="./list" method="get">
				<select name="categoryNum">
					<option value="00">전체상품</option>  
					<option value="100">팬시용품</option>
					<option value="200">필기용품</option>
					<option value="300">노트/수첩</option>
				</select> 
				<input type="text" name="search">
				<input type="hidden" name="categoryNum" value="${categoryNum}">
				<button type="submit">검색</button>
		</form>



<c:forEach items="${list}" var="list">
<a href="./detail?productNum=${list.productNum}">${list.name}</a>
${list.price}

<!-- 원래는 os기준 경로로 작성해야됨 fileName으로 가져오게끔  -->
<img alt="" src="../resources/upload/product/${list.thumbnail}">
<p>
</c:forEach>


		<div>
			<c:if test="${pager.pre}">
				<a href="./list?page=${pager.startNum-1}">PREVIEW</a>
			</c:if>
				<!-- controller mv 에 pager  -->

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<a href="./list?page=${i}&categoryNum=${pager.categoryNum}&search=${pager.search}">${i}</a>
				</c:forEach>

				<c:if test="${pager.next}">
					<a href="./list?page=${pager.lastNum+1}">NEXT</a>
				</c:if>
		</div>

</body>
</html>