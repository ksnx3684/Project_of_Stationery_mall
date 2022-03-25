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
	<h1>${board} Update Page</h1>

	<form action="./update" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num}">
			 글 제목<input type="text" name="title" value="${dto.title}"> 
			 작성자<input type="text" name="writer" disabled="disabled" value="${dto.id}">
			 글 내용<textarea name="contents" rows="10" cols="">${dto.contents}</textarea>
	
		<div id="files">
			<c:forEach items="${dto.fileDTOs}" var="f">
				<div>
					${f.oriName} <button type="button" data-fileNum="${f.fileNum}" class="fileDeleteBtn">X</button>
				</div>
			</c:forEach>
		</div>
		
		<div id="fileResult">


		</div>
		
		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>
		<button type="submit">UPDATE</button>		
	</form>
		<script type="text/javascript" src="../resources/js/updateFile.js"></script>
</body>
</html>