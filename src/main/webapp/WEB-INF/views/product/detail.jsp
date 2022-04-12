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

</head>

<body>

<!--title -->
	<div id="titleArea">
    <h2>상품상세 정보</h2>
    <span class="xans-element- xans-layout xans-layout-mobileaction "><a href="javascript:history.back();" ><img src="//img.echosting.cafe24.com/skin/mobile_ko_KR/layout/btn_back.gif" width="33" alt="뒤로가기"></a>
</span>
</div>

<!-- 관리자 수정 -->
			<c:if test="${auth.userAccount eq 0}">
	<button><a href="./delete?productNum=${dto.productNum}">delete</a></button>
	<button><a href="./update?productNum=${dto.productNum}">update</a></button>
		</c:if>
	<hr>


<div class="main">
<div class="product">
<div class="product-images">
	<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">
			<c:if test="${state.first}">
				<img alt="" class="product-image main-product-image" src="../resources/upload/product/${f.fileName}">
			</c:if>
	</c:forEach>
	
	
</div>
<div class="right-side">
		<h1>${dto.name}</h1>
		<hr>
		<h1>${dto.price}원</h1>
		<hr>
		<h4>${dto.contents}</h4>
		<hr>
		<h4>배송비 2500원 
		(30,000원 이상 구매 시 무료) </h4>
	
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

<div class="other-images">
	<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">	
	
				<c:if test="${not state.first}">
					<img alt="" class="small-product-image" src="../resources/upload/product/${f.fileName}">
				</c:if>
			
	</c:forEach>
	</div>	
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