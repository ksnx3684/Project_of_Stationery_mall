<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQUARE MALL</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="./template/header.jsp"></c:import>
	<link rel="stylesheet" href="./resources/css/hamberger.css">
	<link rel="stylesheet" href="./resources/css/index.css">
</head>
<body>

	<div class="title"><img src="./resources/img/index/TITLE.png"></div>
	<!-- <c:import url="/category/catelist"></c:import> -->

	<div class="container"> 
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		  </ol>
			<!-- <script>
				$('.carousel').carousel({ interval: 4000 });
			</script> -->
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
			<div class="item active">
			  <img src="./resources/img/index/eduardo-casajus-gorostiaga-aWUUEIJaSRw-unsplash.jpg">
			</div>
			<div class="item">
			  <img src="./resources/img/index/clark-young-QdRnZlzYJPA-unsplash.jpg">
			</div>
			<div class="item">
			  <img src="./resources/img/index/kelly-sikkema-JDPDMaINjko-unsplash.jpg">
			</div>
			<div class="item">
				<img src="./resources/img/index/artboard-studio-c-KRSHct7Ho-unsplash.jpg">
			  </div>
			  <div class="item">
				<img src="./resources/img/index/yellow-cactus-MTNN8IfrY6Y-unsplash.jpg">
			  </div>
		  </div>
	  
		  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		  </a>
		</div>

		<div class="main">
			<h2>
				<div class="subtitle">NEW ITEMS</div>
			</h2>
			<div class="items">
				<ul>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/3M포스트잇_노트_654_1500원.jpg">
								3M/포스트잇 노트 654<br>1500원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/모나미_유성_매직_5000원.jpg">
								모나미 유성 매직<br>5000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/스테들러_옐로우_지우개_연필_134HB_2B_12입_2000원.jpg">
								스테들러 옐로우 지우개 연필 2B 12입<br>2000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/아모스_만능_목공풀_36g_8000원.jpg">
								아모스 만능 목공풀 36g<br>8000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/아이콘스_카카오프렌즈_자동_연필깎이_15000원.jpg">
								아이콘스 카카오프렌즈 자동 연필깎이<br>15000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/제트스트림_유성볼펜_0.38mm_SXN-150-38.1500원.jpg">
								제트스트림 유성볼펜 0.38mm<br>1500원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/타이머쌤_듀얼_스톱워치_10000원.jpg">
								타이머쌤 듀얼 스톱워치<br>10000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/티티_하이샤파_블랙_에디션_연필깎이_KI-200B_28000원.png">
								티티 하이샤파 블랙 에디션 연필깎이<br>28000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/종이나라_핑크퐁_케이스_양면색종이_100매입_10000원.png">
								종이나라 양면색종이 100매입<br>10000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/펜텔_아인슈타인샤프_0.5mm_P315.4000원.jpg">
								펜텔 아인슈타인샤프 0.5mm P315<br>4000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/펜텔_아인지우개_1000원.jpg">
								펜텔 아인지우개<br>1000원
							</a>
						</div>
					</li>
					<li class="each">
						<div class="thumbnail">
							<a href="">
								<img src="./resources/img/index/items/포포팬시_룰루랄라_칸이_넓은_노트 10mm_8000원.jpg">
								포포팬시 룰루랄라 칸이 넓은 노트 10mm<br>8000원
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>

	





	<script src="./resources/js/hamberger.js"></script>
</body>
</html>