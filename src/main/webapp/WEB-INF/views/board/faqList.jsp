<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 - SQUARE SHOP</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|
Material+Icons+Round|Material+Icons+sharp"  
rel="stylesheet">
<!-- <link href="../resources/css/table.css" rel="styleSheet" />
<link href="../resources/css/list.css" rel="styleSheet" />
<link href="../resources/css/notice.css" rel="styleSheet" /> -->
<c:import url="../template/header.jsp"></c:import>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../resources/css/hamberger.css">
<link rel="stylesheet" href="../resources/css/index.css">
<link href="../resources/css/reset.css" rel="styleSheet"/>
<link href="../resources/css/faqList.css" rel="styleSheet" />
<style>


</style>
</head>
<body>
	<div id="faqArea">

	<c:choose>
		<c:when test="${board eq 'notices'}">
			<h1>공지사항</h1>	
		</c:when>
		<c:when test="${board eq 'faq'}">
			
			<h1><i class="fa fa-question-circle"></i>&nbsp;자주 묻는 질문</h1>
		</c:when>
		<c:otherwise>			
			<h1>${board} Detail Page</h1>
		</c:otherwise>
	</c:choose>

		 	<c:if test ="${not empty auth}">
				<a href="./add" class="add-board">글작성</a>
			</c:if> 

		<!-- 검색 창 -->
		<div class="search-container">
			<form action="./faqList" method="get" class="search-form">
				<fieldset id="searchField">
					<select name="kind">
						<option value="col1">제목</option>
						<option value="col2">본문</option>
<!-- 						<option value="col3">작성자</option> -->
					</select> <input type="text" name="search" value="${pager.search }" placeholder="search">
					<button type="submit" class="custom-btn btn-1">검색</button>
				</fieldset>
			</form>
		</div>


		<div class="contentsArea">

		
				<c:forEach items="${requestScope.list}" var="dto">
					<!-- <a class="titleLink accordion" href="./detail?num=${dto.num}">${dto.title}</a> -->
					<div class="qnaKind"><button class="titleLink accordion" type="button">${dto.title}</button></div>
				
				
					<div class="panels">${dto.contents}</div>
					
				</c:forEach>
		</div>
	

		<div class="pager">
			<c:if test="${pager.pre}">
				<a href="./faqList?page=${pager.startNum-1}">◀</a>
			</c:if>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="./faqList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
			</c:forEach>

			<c:if test="${pager.next}">
				<a href="./faqList?page=${pager.lastNum+1}">▶</a>
			</c:if>

		</div>

	</div>
	<script src="../resources/js/hamberger.js"></script>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;
		
		for (i = 0; i < acc.length; i++) {
		  acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panels = this.parentElement.nextElementSibling;
			if (panels.style.maxHeight) {
			  panels.style.maxHeight = null;
			} else {
			  panels.style.maxHeight = panels.scrollHeight + "px";
			}
		  });
		}
		</script>
</body>
</html>