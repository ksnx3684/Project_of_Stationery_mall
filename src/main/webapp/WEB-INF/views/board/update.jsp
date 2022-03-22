<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board}Update Page</h1>

	<form action="./update" method="POST">
		<input type="hidden" name="num" value="${dto.num}">
			 글 제목<input type="text" name="title" value="${dto.title}"> 
			 작성자<input type="text" name="writer" disabled="disabled" value="${dto.id}">
			 글 내용<textarea name="contents" rows="10" cols="">${dto.contents}</textarea>
		<input type="submit" value="ADD">
	</form>
</body>
</html>