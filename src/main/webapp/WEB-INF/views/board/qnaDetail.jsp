<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 자세히보기 - SQUARE SHOP</title>
<c:import url="../template/header.jsp"></c:import>
	
	<link rel="stylesheet" href="../resources/css/hamberger.css">
	<link rel="stylesheet" href="../resources/css/index.css">
<style type="text/css">
img {
	width : 400px;
	height : 400px;
	}

#detailArea {
    margin: 0 auto;
    text-align: center;
}   
</style>
</head>
<body>
<div id="detailArea">
	<a href="../product/detail?productNum=${param.productNum}">질문상품으로 이동</a>
	<header>
        <h3 id="bo_v_title">
            ${dto.title}       </h3>
</header>

<section id="bo_v_info">
	작성자 <strong><span class="sv_member">${dto.id}</span></strong>
</section>
<hr>
<!-- 본문 내용 시작 { -->
<h3 class="contents">본문 : ${dto.contents}</h3>
<hr>
<section id="bo_v_atc">
	<div id="bo_v_con">
	<!-- 회원이 남긴 qna의 경우에만 사진이 보이게끔 -->
	<c:if test="${dto.num eq dto.ref}">
		<h3>첨부사진</h3>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<img alt="" src="../resources/upload/qnas/${f.fileName}">
		</c:forEach>
	</c:if>
</div>
			<!-- } 본문 내용 끝 -->

</section>
	<hr>
<div class="btnList">
	<a href="./list">목록으로 돌아가기</a>
	<!-- 작성자만 수정과 삭제가 가능하게끔  -->
	<c:if test="${auth.id eq dto.id}">
		<!-- <button type="button" onclick="button_del();">삭제하기</button> -->
		<a href="./qnaUpdate?num=${dto.num}&prodcutNum=${dto.productNum}">수정하기</a>
			<a href="./qnaDelete?num=${dto.num}"
			onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</a>
	</c:if>
</div>
</div>
	<script src="../resources/js/hamberger.js"></script>
</body>
</html>