<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--  <c:import url="../template/header.jsp"></c:import> --%>
<c:import url="../template/header_css.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/product/productList.css">
<!-- <link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp"
	rel="stylesheet"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
</head>
<body>

<div id="top">
<!--title -->
<div id="titleArea">
		<c:if test="${param.categoryNum eq 0 || param.categoryNum eq null}"> <h2>전체상품</h2></c:if>
		<c:forEach items="${cateList}" var="list">
			<c:if test="${list.categoryNum eq param.categoryNum}"><h2>${list.categoryName}</h2></c:if>
		</c:forEach>
    <span class="xans-element- xans-layout xans-layout-mobileaction "><a href="javascript:history.back();" ><img src="//img.echosting.cafe24.com/skin/mobile_ko_KR/layout/btn_back.gif" width="33" alt="뒤로가기"></a>
</span>

<!-- 세부카테고리 메뉴 -->
<div id="subCategoryMenu">
	<ul class="categoryUl">
		<c:forEach items="${allcatelist}" var="catelist">
			<c:if test="${Math.round(param.categoryNum/10)*10 eq catelist.categoryNum}">
				<c:set var="parentId" value="${catelist.categoryNum}"></c:set>
				<c:forEach items="${allcatelist}" var="catelist">
					<c:if test="${parentId eq catelist.parentId}">
						<li><a href="/project/product/subCateList?categoryNum=${catelist.categoryNum}">${catelist.categoryName}</a></li>
					</c:if>
				</c:forEach>
			</c:if>
		</c:forEach>
	</ul>
</div><!-- 세부카테고리메뉴 -->
</div><!-- title area -->
</div><br><br><!-- top -->
		<!-- 검색창 -->
		<div class="searchbar">
		<div class="boxbox">
			<form action="./list" method="get">
				<div class="searchbar">
					<select name="categoryNum" style="margin: 10px; margin-bottom : 20px; border: none">
						<option value="0">전체</option>
						<c:forEach items="${cateList}" var="list">
							<option value="${list.categoryNum}">${list.categoryName}</option>
						</c:forEach>
					</select>

					<input type="text" name="search" class="search">
					<button type="submit" class="submit">
						<span class="material-icons-outlined">search</span>
					</button>
				</div>
			</form>
		</div>
		</div>
		
		<!-- 상품추가 버튼 -->
		<c:if test="${auth.userAccount eq 0}">
			<button style="margin-left: 13%;"><a href="./add">상품 추가하기</a></button>
		</c:if>
		
		<!-- id -->
		<input type="hidden" id="id" value="${auth.id}"></input>


		<!-- list -->
		<div class="container" style="width: 1200px;">
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
							
							<span class="material-icons-outlined cart" data-num="${list.productNum}">shopping_cart</span>
		
							<span class="material-icons-outlined wishlist" id="wishlist" class="wishlist" data-num="${list.productNum}">favorite_border</span>
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
				<a href="./list?page=${i}&categoryNum=${pager.categoryNum}&search=${pager.search}">${i}</a>
			</c:forEach>
			<c:if test="${pager.next}">
				<a href="./list?page=${pager.lastNum+1}">NEXT</a>
			</c:if>
		</div>

	
		<script src="../resources/js/product/wishlist.js"></script>
		<script src="../resources/js/hamberger.js"></script>
</body>
</html>
