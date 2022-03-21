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
	<h1>Faq List Page</h1>
	
	<table>
		<thead>
			<tr>
				<th>글번호</th><th>글제목</th><th>작성자</th>				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.title}</td>
				<td>${dto.id}</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
</body>
</html>