<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<!-- Title  -->
	<title>위시리스트</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link rel="stylesheet" href="../resources/css/users/wishlist.css">

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

					<div class="container wishlist">
						<h2>위시리스트</h2>
						<table class="table">
						  <thead>
							<tr class="success">
							  <th>번호</th>
							  <th>상품명</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${wishlistDTO}" var="dto">
								<tr class="active">
									<td><input class="check" name="wishNum" type="checkbox" data-wishNum="${dto.wishNum}" value="${dto.wishNum}">&nbsp;${dto.wishNum}</td>
									<td><a href="../product/detail?productNum=${dto.productNum}">
										<c:if test="${dto.productDTO.thumbnail ne null}">
											<img class="image" src="../resources/upload/product/${dto.productDTO.thumbnail}" style="width:32px; height: 32px;">&nbsp;
										</c:if>
										${dto.productDTO.name}</a>
									</td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
						<form class="frm" action="./wishlistDelete" method="post" style="display: inline;">
							<span id="selectDelete_btn"><button type="button" class="btn btn-danger">선택된 상품 삭제</button></span>
							<script>
								$("#selectDelete_btn").click(function () {
									let confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");
				
									if (confirm_val) {
										let checkArr = new Array();
				
										$("input[class='check']:checked").each(function () {
											checkArr.push($(this).attr("data-wishNum"));
										});
				
										$.ajax({
											url: "wishlistDelete",
											type: "post",
											data: { checkbox : checkArr},
											traditional : true,
				
											success: function () {
												location.href = "./wishlist";
											}
										});
										const frm = document.getElementsByClassName("frm");
										frm.submit();
									} else {
										//location.reload;
									}
								});
							  </script>
						</form>
					</div>

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

</body>
</html>