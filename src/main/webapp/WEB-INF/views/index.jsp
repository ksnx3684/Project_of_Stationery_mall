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
	<title>SQUARE SHOP</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="./resources/css/core-style.css">
	<link rel="stylesheet" href="./resources/css/index.css">
	
</head>
<body>
	<!-- ##### Search Content ##### -->
	<c:import url="./template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="./template/new_header.jsp"></c:import>

			<!-- Product Catagories Area Start -->
			<div class="products-catagories-area clearfix">
				<div class="clearfix">

					  <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel" data-interval="4000">
						<div class="carousel-inner">
						  <div class="carousel-item active">
							<img src="./resources/img/index/clark-young-QdRnZlzYJPA-unsplash.jpg" class="d-block w-100">
						  </div>
						  <div class="carousel-item">
							<img src="./resources/img/index/kelly-sikkema-JDPDMaINjko-unsplash.jpg" class="d-block w-100">
						  </div>
						  <div class="carousel-item">
							<img src="./resources/img/index/eduardo-casajus-gorostiaga-aWUUEIJaSRw-unsplash.jpg" class="d-block w-100">
						  </div>
						  <div class="carousel-item">
							<img src="./resources/img/index/artboard-studio-c-KRSHct7Ho-unsplash.jpg" class="d-block w-100">
						  </div>
						  <div class="carousel-item">
							<img src="./resources/img/index/yellow-cactus-MTNN8IfrY6Y-unsplash.jpg" class="d-block w-100">
						  </div>
						</div>
						<button class="carousel-control-prev" type="button" data-target="#carouselExampleFade" data-slide="prev">
						  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						  <span class="sr-only">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-target="#carouselExampleFade" data-slide="next">
						  <span class="carousel-control-next-icon" aria-hidden="true"></span>
						  <span class="sr-only">Next</span>
						</button>
					  </div>
					
				</div>
			</div>
			<!-- Product Catagories Area End -->

	</div>
	<!-- ##### Main Content Wrapper End ##### -->


	<!-- ##### Footer Content ##### -->
	<c:import url="./template/new_footer.jsp"></c:import>


	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="./resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="./resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="./resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="./resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="./resources/js/active.js"></script>

</body>
</html>