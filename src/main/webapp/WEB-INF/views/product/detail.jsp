<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/product/detail.css">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*  	.detailBox {
		border : 1px solid black;
		width : 500px;
		heigth : 200px;
	}  */
button.accordion {
	background-color: #FFF;
	cursor: pointer;
	width: 100%;
	border: none;
	font-size: 16px;
	transition: 0.5s;
	text-align: left;
	padding: 10px;
}

button.accordion>p {
	float: left;
	margin-left: 10px;
	width: 76%;
}

button.accordion.active {
	font-weight: bold;
	color: #000;
}

button.accordion:after { // 아코디언이 닫혀 있을 때 화살표 background-size:18px18px;
	display: inline-block;
	width: 18px;
	height: 18px;
	content: "";
	float: right;
	position: relative;
	top: 18px;
}

button.accordion.active:after { // 아코디언이 열렸을 때 화살표 이미지를 바꿔준다. content:"";
	
}

div.panel {
	padding: 0 18px;
	background-color: #f7f7f7;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	border-top: 1px solid #F0F0F0;
	color: #666666;
	font-size: 14px;
	/* line-height: 1.5px; */
}
</style>
</head>

<body>
	<h1>Detail Page</h1>
	<a href="./delete?productNum=${dto.productNum}">delete</a>
	<a href="./update?productNum=${dto.productNum}">update</a>
	<hr>


<div class="main">
<div class="product">

<div class="product-images">
	<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">
			<c:if test="${state.first}">
				<img alt="" class="product-image main-product-image" src="../resources/upload/product/${f.fileName}">
			</c:if>
	</c:forEach>
	
	<div class="other-images">
	<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">	
	
				<c:if test="${not state.first}">
					<img alt="" class="small-product-image" src="../resources/upload/product/${f.fileName}">
				</c:if>
			
	</c:forEach>
	</div>	
</div>
<div class="right-side">
		<h1>${dto.name}</h1>
		<hr>
		<h1>${dto.price}원</h1>
		<hr>
		<h4>${dto.contents}</h4>
		<hr>
	
	<!-- js로 보내주기 위함 -->
	<input type="hidden" value="${dto.productNum}" id="productNum">
	
	
	
	<form action="./addCart" method="post" enctype="multipart/form-data">
		<c:if test="${not empty option}">
			<c:forEach items="${option}" var="option">
			<div class="formrow">
				<input type="radio" class="checkbox" value="${option.optionNum}" name="optionNum">
				<label class="checklabel" for="${option.optionContents}">${option.optionContents}</label>
			</div>
			</c:forEach>
		</c:if>	
	<div class="addToCart">
	<input type="number" name="productCount" class="piece" value="1" id="piece" min="1" max="100"/>
        <button type="button" id="submitBtn"><span class="material-icons-outlined">shopping_cart</span></button> 
	 </div>
	</form>
	



</div><!-- right-side -->

</div><!-- product -->
</div><!-- main -->

	<hr>
	
	<!-- qna Ajax로 가져오는 부분 -->
	<div id="qna-Result">
		<input type="hidden" name="productNum" value="${dto.productNum}" id="productNum">

	</div>


	<script src="../resources/js/product/cart.js"></script>
	<script type="text/javascript" src="../resources/js/product/qnas.js"></script>


</body>
</html>