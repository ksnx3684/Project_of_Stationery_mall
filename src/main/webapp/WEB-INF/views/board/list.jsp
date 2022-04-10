<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|
Material+Icons+Round|Material+Icons+sharp"  
rel="stylesheet">
<link href="../resources/css/table.css" rel="styleSheet" />
<link href="../resources/css/list.css" rel="styleSheet" />
<link href="../resources/css/notice.css" rel="styleSheet" />

</head>
<body>
	<div class="table-container">
		<h1>${board} List Page</h1>


		<!-- 검색 창 -->
		<div class="search-container">
			<form action="./list" method="get" class="search-form">
				<fieldset>
					<select name="kind">
						<option value="col1">제목</option>
						<option value="col2">본문</option>
						<option value="col3">작성자</option>
					</select> <input type="text" name="search" value="${pager.search }" placeholder="search">
					<button type="submit">검색</button>
				</fieldset>
			</form>
			<c:if test ="${not empty auth}">
				<a href="./add" class="add-board">글작성</a>
			</c:if>
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
						<c:choose>
						<c:when test="${board eq 'qnas'}">
							<td><a href="./qnaDetail?num=${dto.num}&productNum=${dto.productNum}">${dto.title}</a></td>
						</c:when>
						<c:when test="${board eq 'review'}">
							<td><a href="./reviewDetail?num=${dto.num}">${dto.title}</a></td>
						</c:when>
						<c:otherwise>
							<td><a href="./detail?num=${dto.num}">${dto.title}</a></td>
						</c:otherwise>
						</c:choose>
						<td>${dto.id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pager">
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

	</div>
</body>
</html>