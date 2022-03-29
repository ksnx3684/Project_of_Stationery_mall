<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/boardForm.css" rel="styleSheet" />
</head>
<body>
	<h1>${board}Add Page</h1>
<!-- <div id="container"> -->
	<form action="./add" method="post" enctype="multipart/form-data"
		style="width:100%">
	<div class="item">
		<table class="table-basic">
			<tbody>
				<tr>
					<td>Writer <input type="text" name="id" value="${auth.id}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>Title <input type="text" name="title" placeholder="글 제목"></td>
				</tr>
				<tr>
					<td>본문</td>
				</tr>
				<tr>
					<td><textarea name="contents" rows="" cols="" placeholder="글 내용을 입력하세요."></textarea></td>
				</tr>
	
			</tbody>
		</table>
		</div>
<!-- 	</div>
 -->
		<c:if test="${board eq 'notices'}">
			<div id="fileResult">
				
				<!--
				<div>
					<input type="file" name="files"><button type="button">DEL</button>
				</div>
				<input type="file" name="files">
				<input type="file" name="files"> 
			-->
			</div>
			<div class="fileAdd">
				<button type="button" id="fileAdd">FileAdd</button>
			</div>
		</c:if>
		<button type="submit">ADD</button>
	</form>

	
	<script src="../resources/js/file.js"></script>
</body>
</html>