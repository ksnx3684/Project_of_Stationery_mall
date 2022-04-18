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
	<title>주문상세</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link rel="stylesheet" href="../resources/css/users/orderDetail.css">

</head>
<body>
	<!-- ##### Search Content ##### -->
	<c:import url="../template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="../template/new_header.jsp"></c:import>

			<!-- Product Catagories Area Start -->
			<div class="products-catagories-area clearfix">
				<div class="clearfix main">

					<h3>주문번호 : ${orderDetail.orderNum}</h3>
					<h3>주문날짜 : ${orderDetail.orderDate}</h3>
					<h3>결제 금액 : ${orderDetail.totalPrice}</h3>
					<h3>배송지 : ${orderDetail.addressDetail}</h3>
					<h3>배송메모 : ${orderDetail.memo}</h3>
					<h3>결제수단 : ${orderDetail.cardName}</h3>
					<h3>구매상품</h3>
					<div class="items">
						<ul>
							<c:forEach items="${orderDetail.orderDetailDTOs}" var="d">
								<li class="each">
									<div class="thumbnail">
										<a href="../product/detail?productNum=${d.productNum}">
											<c:forEach items="${d.productDTOs}" var="dt">
												<c:if test="${dt.thumbnail ne null}">
													<img src="../resources/upload/product/${dt.thumbnail}">
												</c:if>
											</c:forEach>
											${d.name}&nbsp;
											<c:if test="${d.optionContents ne null && d.optionContents ne '0'}">
												( 옵션 : ${d.optionContents} )
											</c:if>
											
										</a>
										<br>
									<a href="../review/reviewAdd?productNum=${d.productNum}&detailNum=${d.detailNum}">리뷰작성</a>
									</div>
								</li>
							</c:forEach>
						</ul>
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