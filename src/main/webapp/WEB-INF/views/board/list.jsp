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
<c:import url="../template/header.jsp"></c:import>

<link rel="stylesheet" href="../resources/css/hamberger.css">
<link rel="stylesheet" href="../resources/css/index.css">
<link href="../resources/css/reset.css" rel="styleSheet"/>
<style>

#searchField {
    border: 0px;
}
button {
margin: 10px;
outline: none;
}
.custom-btn {
width: 80px;
height: 30px;
border: 2px solid rgb(177, 177, 177);
font-family: 'Lato', sans-serif;
font-weight: 500;
background: transparent;
cursor: pointer;
transition: all 0.3s ease;
position: relative;
display: inline-block;

}

/* 1 */
.btn-1 {
transition: all 0.3s ease;
}
.btn-1:hover {
box-shadow:
-7px -7px 20px 0px #fff9,
-4px -4px 5px 0px #fff9,
7px 7px 20px 0px #0002,
4px 4px 5px 0px #0001;
color:black;
}

select {
     padding:5px;
	 width: 80px;
     border:1px solid #999;
     font-family:'Nanumgothic';
     background:url(../resources/img/down.png)  95.5% center no-repeat;
     border-radius:3px;
     -webkit-appearance: none;
     -moz-appearance: none;
     appearance : none;
}
table-container a:hover { 
    color:white; 
    background-color: red; 
    text-decoration: none; 
}
</style>
</head>
<body>
	<div class="table-container">
			<c:choose>
		<c:when test="${board eq 'notices'}">
			<h1>공지사항</h1>	
		</c:when>
		<c:when test="${board eq 'faq'}">
			<h1>자주 묻는 질문</h1>
		</c:when>
		<c:otherwise>			
			<h1>${board} Detail Page</h1>
		</c:otherwise>
	</c:choose>


		<!-- 검색 창 -->
		<div class="search-container">
			<form action="./list" method="get" class="search-form">
				<fieldset id="searchField">
					<select name="kind">
						<option value="col1">제목</option>
						<option value="col2">본문</option>
						<option value="col3">작성자</option>
					</select> <input type="text" name="search" value="${pager.search }" placeholder="search">
					<button type="submit" class="custom-btn btn-1">검색</button>
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
							<td><a class="titleLink" href="./detail?num=${dto.num}">${dto.title}</a></td>
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
	<script src="../resources/js/hamberger.js"></script>
</body>
</html>