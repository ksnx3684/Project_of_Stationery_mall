<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img {
	width : 200px;
	height : 200px;
	}

</style>
</head>
<body>
	<h1>${board} Detail Page</h1>
	
	<h3>글 제목 : ${dto.title}</h3>
	<h3 class="contents">글 내용 : ${dto.contents}</h3>
	<h3>작성자 : ${dto.id}</h3>
	
	
	<hr>
	
	<a href="./list">List</a>
	<!-- 작성자만 수정과 삭제가 가능하게끔  -->
	<c:if test="${auth.id eq dto.id}">
		<!-- <button type="button" onclick="button_del();">삭제하기</button> -->
		<a href="./qnaDelete?num=${dto.num}" onclick="return confirm('정말 삭제하시겠습니까?');">Delete</a>
		<a href="./qnaUpdate?num=${dto.num}">update</a>
	</c:if>
</body>
</html>