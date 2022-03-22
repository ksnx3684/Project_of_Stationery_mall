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
	<div class="table-container">
	<h1>${board} List Page</h1>
	
	<!-- 검색 창 -->
	<div>
		<form action="./list" method="get">
			<fieldset>
				<select name="kind">
					<option value="col1">제목</option>
					<option value="col2">본문</option>
					<option value="col3">작성자</option>
				</select> <input type="text" name="search" value="${pager.search }">
				<button type="submit">검색</button>
			</fieldset>
		</form>
	</div>


		<table class="table-basic">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td><a href="./detail?num=${dto.num}">${dto.title}</a></td>				
						<td>${dto.id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

			<div>
			<c:if test="${pager.pre}">
				<a href="./list?page=${pager.startNum-1}">◀</a>
			</c:if>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
			</c:forEach>

			<c:if test="${pager.next}">
				<a href="./list?page=${pager.lastNum+1}">▶</a>
			</c:if>

		</div>
		
			<a href="./add">ADD</a>
		
	</div>
</body>
</html>