<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<!-- Title  -->
	<title>Product List</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="../resources/css/product/productList.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp" rel="stylesheet">
</head>
<body>
	<!-- ##### Search Content ##### -->
	<c:import url="../template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="../template/new_header.jsp"></c:import>

			<div class="shop_sidebar_area">
				<!-- ##### Single Widget ##### -->
				<div class="widget catagory mb-50">
					<!-- Widget Title -->
					<h6 class="widget-title mb-30">Catagories</h6>
					<!--  Catagories  -->
					<div class="catagories-menu">
						<ul>
							<li class="active"><a href="#">전체상품</a></li>
							<li><a href="#">Beds</a></li>
							<li><a href="#">Accesories</a></li>
							<li><a href="#">Furniture</a></li>
							<li><a href="#">Home Deco</a></li>
							<li><a href="#">Dressings</a></li>
							<li><a href="#">Tables</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="amado_product_area section-padding-100">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="product-topbar d-xl-flex align-items-end justify-content-between">
								<h1>Shop</h1>
								<input type="hidden" id="id" value="${auth.id}"></input>
							</div>
						</div>
					</div>
					<div class="row" id="ultag">
						<c:forEach items="${list}" var="list">
							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-md-6 col-xl-4">
								<div class="single-product-wrapper">
									<!-- Product Image -->
									<a href="./detail?productNum=${list.productNum}">
										<div class="product-img">
											<img src="../resources/upload/product/${list.thumbnail}" alt="">
										</div>
										<!-- Product Description -->
										<div class="product-description d-flex align-items-center justify-content-between">
											<!-- Product Meta Data -->
											<div class="product-meta-data">
												<div class="line"></div>
												<p class="product-price">${list.price}원</p>
												<h6>${list.name}</h6>
											</div>
									</a>
										<!-- Ratings & Cart -->
										<div class="ratings-cart text-right" style="cursor: pointer;">
											<div class="cart">
												
												<span class="material-icons-outlined cart" data-num="${list.productNum}">
													shopping_cart
												</span>
											
											
												<span class="material-icons-outlined wishlist" id="wishlist" class="wishlist" data-num="${list.productNum}">
													favorite_border
												</span>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
	
					<div class="row">
						<div class="col-12">
							<!-- Pagination -->
							<nav aria-label="navigation">
								<ul class="pagination justify-content-end mt-50">
									<li class="page-item active"><a class="page-link" href="#">01.</a></li>
									<li class="page-item"><a class="page-link" href="#">02.</a></li>
									<li class="page-item"><a class="page-link" href="#">03.</a></li>
									<li class="page-item"><a class="page-link" href="#">04.</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->





					<div id="top">
						<!--title -->
						<div id="titleArea">
							<c:if test="${param.categoryNum eq 0 || param.categoryNum eq null}">
								<h2>전체상품</h2>
							</c:if>
							<c:forEach items="${allcatelist}" var="list">
								<c:if test="${list.categoryNum eq param.categoryNum}">
									<h2>${list.categoryName}</h2>
								</c:if>
							</c:forEach>
							<!-- 세부카테고리 메뉴 -->
							<div id="subCategoryMenu">
								<ul class="categoryUl">
									<c:forEach items="${allcatelist}" var="catelist">
										<c:if test="${Math.round(param.categoryNum/10)*10 eq catelist.categoryNum}">
											<c:set var="parentId" value="${catelist.categoryNum}"></c:set>
											<c:forEach items="${allcatelist}" var="catelist">
												<c:if test="${parentId eq catelist.parentId}">
													<li>
														<a href="/project/product/subCateList?categoryNum=${catelist.categoryNum}">
															${catelist.categoryName}
														</a>
													</li>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							<!-- 세부카테고리메뉴 -->
						</div>
						<!-- title area -->
					</div>
					<!-- top -->
					<div class="adminBtn">		
						<!-- 상품추가 버튼 -->
						<c:if test="${auth.userAccount eq 0}">
							<button><a href="./add">상품 추가하기</a></button>
						</c:if>
					</div>


					<div class="pager">
						<c:if test="${pager.pre}">
							<a href="./list?page=${pager.startNum-1}">
								PREVIEW
							</a>
						</c:if>
						<!-- controller mv 에 pager  -->
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<a href="./list?page=${i}&categoryNum=${pager.categoryNum}&search=${pager.search}">
								${i}
							</a>
						</c:forEach>
						<c:if test="${pager.next}">
							<a href="./list?page=${pager.lastNum+1}">
								NEXT
							</a>
						</c:if>
					</div>
				
			<!-- Product Catagories Area End -->

	</div>
	<!-- ##### Main Content Wrapper End ##### -->


	<!-- ##### Footer Content ##### -->
	<c:import url="../template/new_footer.jsp"></c:import>


	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="../resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="../resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="../resources/js/active.js"></script>


	<script src="../resources/js/product/wishlist.js"></script>
	
</body>
</html>
