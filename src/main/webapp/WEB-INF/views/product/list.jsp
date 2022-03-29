<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp"  rel="stylesheet">

</head>
<body>
	<h1>List Page</h1>
	<a href="./add">ADD</a>
	<div>

		<form action="./list" method="get">
			<select name="categoryNum">
				<option value="0">전체</option>
				<c:forEach items="${cateList}" var="list">
					<option value="${list.categoryNum}">${list.categoryName}</option>
				</c:forEach>
			</select> <input type="text" name="search">
			<button type="submit">검색</button>
		</form>




		
		<c:forEach items="${list}" var="list">
		<li>
			<div class="thumbnail">
			<a href="./detail?productNum=${list.productNum}">
				<img alt="" src="../resources/upload/product/${list.thumbnail}">
			</a> 
			</div>
			<div class="productName">
			<a href="./detail?productNum=${list.productNum}">${list.name}</a> 
			</div>
			<div class="price">
			 ${list.price}원 	
			 </div>
		<a href=""><span class="material-icons-outlined">shopping_cart</span></a>
		<a href=""><span class="material-icons-outlined">favorite_border</span></a>
		</li>
		<hr>
		</c:forEach>
	

		<div>
			<c:if test="${pager.pre}">
				<a href="./list?page=${pager.startNum-1}">PREVIEW</a>
			</c:if>
			<!-- controller mv 에 pager  -->

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a
					href="./list?page=${i}&categoryNum=${pager.categoryNum}&search=${pager.search}">${i}</a>
			</c:forEach>

			<c:if test="${pager.next}">
				<a href="./list?page=${pager.lastNum+1}">NEXT</a>
			</c:if>
		</div>
</body>
</html>