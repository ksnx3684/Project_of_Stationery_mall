<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<!-- Title  -->
	<title>Product Detail</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link rel="stylesheet" href="../resources/css/index.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="../resources/css/product/detail.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp" rel="stylesheet">
</head>
<body>
	<!-- ##### Search Content ##### -->
	<c:import url="../template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="../template/new_header.jsp"></c:import>

			<!-- Product Catagories Area Start -->
			<div class="products-catagories-area clearfix">
				<div class="clearfix">

					<!-- Product Details Area Start -->
					<div class="single-product-area section-padding-100 clearfix" style="padding-top: 100px; padding-bottom: 100px;">
						
						<!-- 관리자 수정 -->
						<div class="adminBtn">
							<c:if test="${auth.userAccount eq 0}">
								<button><a href="./delete?productNum=${dto.productNum}">delete</a></button>
								<button><a href="./update?productNum=${dto.productNum}">update</a></button>
								<hr>
							</c:if>
						</div>
						
						<div class="container-fluid">
							<div class="row">
								<div class="col-12 col-lg-7">
									<div class="single_product_thumb">
										<div id="product_details_slider" class="carousel slide" data-ride="carousel">
											<div class="carousel-inner">
												<div class="carousel-item active">
													<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">
														<c:if test="${state.first}">
															<a class="gallery_img" href="../resources/upload/product/${f.fileName}">
																<img class="d-block w-100" src="../resources/upload/product/${f.fileName}" alt="First slide">
															</a>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-lg-5">
									<div class="single_product_desc">
										<!-- Product Meta Data -->
										<div class="product-meta-data">
											<div class="line"></div>
											<p class="product-price">${dto.price}원</p>
											<a href="product-details.html">
												<h6>${dto.name}</h6>
											</a>
										</div>

										<div class="short_overview my-5">
											<p>${dto.contents}</p>
											<p>배송비 2500원 (30,000원 이상 구매 시 무료)</p>
										</div>

										<form action="./addCart" method="post" enctype="multipart/form-data">
											<c:if test="${not empty option}">
												<c:forEach items="${option}" var="option">
													<div class="formrow">
														<input type="radio" class="checkbox" value="${option.optionNum}" name="optionNum">
														<label class="checklabel btn amado-btn" for="${option.optionContents}">${option.optionContents}</label>
													</div>
												</c:forEach>
											</c:if>	
											<div class="addToCart cart clearfix">
												<input type="number" name="productCount" class="piece" value="1" id="piece" min="1" max="100"/>
												<div style="margin-top: 50px;">
													<button type="button" id="submitBtn" name="addtocart" value="5" class="btn amado-btn">Add to cart</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="other-images">
							<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">	
								<c:if test="${not state.first}">
									<img alt="" class="small-product-image" src="../resources/upload/product/${f.fileName}">
								</c:if>
							</c:forEach>
						</div>
						<!-- review Ajax로 가져오는 부분 -->
						<div id="review-Result">
						</div> 
						<hr>
						<!-- qna Ajax로 가져오는 부분 -->
						<div id="qna-Result">
							<input type="hidden" name="productNum" value="${dto.productNum}" id="productNum">
						</div>
					</div>
					<!-- Product Details Area End -->

					

				</div>
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


	<script src="../resources/js/product/cart.js"></script>
	<script type="text/javascript" src="../resources/js/product/review.js"></script>
	<script type="text/javascript" src="../resources/js/product/qnas.js"></script>


</body>
</html>