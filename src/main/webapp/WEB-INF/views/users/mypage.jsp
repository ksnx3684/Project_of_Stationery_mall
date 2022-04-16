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
	<title>Mypage</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link rel="stylesheet" href="../resources/css/users/mypage.css">

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

					<div class="mainstreet">
						<c:if test="${usersDTO.usersFileDTO.oriName ne null}">
							<img class="image" src="../resources/upload/users/${usersDTO.usersFileDTO.fileName}">
						</c:if>
						<h4>아이디 : ${usersDTO.id}</h4>
						<h4>이름 : ${usersDTO.name}</h4>
						<h4>전화번호 : ${usersDTO.phone}</h4>
						<h4>이메일 : ${usersDTO.email}</h4>
						<h4>가입일자 : ${usersDTO.joinDate}</h4>
						<h4>배송지명 : ${usersDTO.addressName}</h4>
						<h4>배송지 연락처 : ${usersDTO.addressPhone}</h4>
						<h4>우편번호 : ${usersDTO.postalCode}</h4>
						<h4>배송지 주소 : ${usersDTO.addressDetail}</h4>
				
						<a href="./mychangecheck"><button id="update" class="btn btn-info">내 정보 변경</button></a>
						<a href="./wishlist"><button id="wishlist" class="btn btn-primary">위시리스트</button></a>
						<a href="./orderlist"><button id="orderlist" class="btn btn-primary">주문내역</button></a>
						<a href="../cart/cartlist"><button id="cart" class="btn btn-primary">장바구니</button></a>
						<a href="../review/myReviewList?id=${usersDTO.id}"><button id="review" class="btn btn-primary">나의 리뷰 내역</button></a>
						<a href="/project/users/logout"><button class="btn btn-danger">로그아웃</button></a>
						<c:if test="${usersDTO.userAccount eq 0}">
							<a href="./otp/first"><button id="manager" class="btn btn-warning">관리자페이지</button></a>
						</c:if>
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