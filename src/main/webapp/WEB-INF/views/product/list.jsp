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
				<input type="text" name="search">
				<input type="hidden" name="categoryNum" value="${categoryNum}">
				<button type="submit">검색</button>
		</form>

	</div>


<c:forEach items="${list}" var="list">
${list.name}
${list.contents}
${list.thumbnail}
${list.price}
<p>
</c:forEach>
</body>
</html>