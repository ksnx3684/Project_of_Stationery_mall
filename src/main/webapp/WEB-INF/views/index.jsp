<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모생각</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="./template/header.jsp"></c:import>
	<link rel="stylesheet" href="./resources/css/hamberger.css">
</head>
<body>

	<h1>네모생각</h1>
	<c:import url="/category/catelist"></c:import>

	<div class="container" style="margin-bottom: 100px; max-width: 900px; max-height: 450px; z-index: 1;"> 
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
			  <img src="./resources/img/eduardo-casajus-gorostiaga-aWUUEIJaSRw-unsplash.jpg" style="width:100%;">
			</div>
			<div class="item">
			  <img src="./resources/img/clark-young-QdRnZlzYJPA-unsplash.jpg" style="width:100%;">
			</div>
			<div class="item">
			  <img src="./resources/img/kelly-sikkema-JDPDMaINjko-unsplash.jpg" style="width:100%;">
			</div>
			<div class="item">
				<img src="./resources/img/artboard-studio-c-KRSHct7Ho-unsplash.jpg" style="width:100%;">
			  </div>
			  <div class="item">
				<img src="./resources/img/yellow-cactus-MTNN8IfrY6Y-unsplash.jpg" style="width:100%;">
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
	</div>
	<script src="./resources/js/hamberger.js"></script>
</body>
</html>