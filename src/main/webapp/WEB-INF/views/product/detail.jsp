<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	<h3>상품명 : ${dto.name}</h3>
	<h4>가격 : ${dto.price}</h4>
	<h4>설명 : ${dto.contents}</h4>

	<c:forEach items="${dto.productFileDTOs}" var="f">
		<!-- 수정해라 나중에 f.fileName으로 -->
		<img alt="" src="../resources/upload/product/${f.fileName}">
	</c:forEach>
	<hr>
	
	<!-- qna Ajax로 가져오는 부분 -->
	<div id="qna-Result">
		<input type="hidden" name="productNum" value="${dto.productNum}" id="productNum">

	</div>



	<script type="text/javascript" src="../resources/js/product/qnas.js"></script>

</body>
</html>