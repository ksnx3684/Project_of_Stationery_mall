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
	<h1>${board} Detail Page</h1>
	
	<h3>글 제목 : ${dto.title}</h3>
	<h3>글 내용 : ${dto.contents}</h3>
	<h3>작성자 : ${dto.id}</h3>
	<c:if test="${board eq 'notices'}">
		<h3>작성날짜 : ${dto.createdDate}</h3>
		첨부사진
		<c:forEach items="${dto.fileDTOs}" var="f"> <!-- 파일 다운로드 -->
			<a href="./photoDown?fileNum=${f.fileNum}">${f.oriName}</a>
		</c:forEach>
	</c:if>
	<a href="./list">List</a>
</body>
</html>