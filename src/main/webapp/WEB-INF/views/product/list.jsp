<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/product/productList.css">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp"
	rel="stylesheet">

</head>
<body>
	<h1>List Page</h1>
	<a href="./add">ADD</a>
	

		<div class="boxbox">
			<form action="./list" method="get">
				<select name="categoryNum">
					<option value="0">전체</option>
					<c:forEach items="${cateList}" var="list">
						<option value="${list.categoryNum}">${list.categoryName}</option>
					</c:forEach>
				</select>

				 <input type="text" name="search" class="search">
				 <button type="submit" class="submit">
					<span class="material-icons-outlined">search</span>
				</button>
			</form>
		</div>

		<!-- id -->
		<button type="hidden" id="id" value="${auth.id}"></button>


		<!-- list -->
		<div class="container">
			<ul id="ultag">
				<c:forEach items="${list}" var="list">
					<li class="card">
						<div class="thumbnail">
							<a href="./detail?productNum=${list.productNum}"> 
								<img alt="" src="../resources/upload/product/${list.thumbnail}">
							</a>
						</div>	
						<!-- </div class="figure"> -->
							<div class="productName">
							<a href="./detail?productNum=${list.productNum}">${list.name}</a>
							</div>
							
							<div class="price">${list.price}원</div> 
							
							<a href="../order?productNum=${list.productNum}"><span class="material-icons-outlined">shopping_cart</span></a> 
		
							<span class="material-icons-outlined" id="wishlist" class="wishlist" data-num="${list.productNum}">favorite_border</span>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="pager">
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

		<script src="../resources/js/product/wishlist.js"></script>
</body>
</html>