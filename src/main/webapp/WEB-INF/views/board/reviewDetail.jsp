<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 자세히 보기 - SQUARE SHOP</title>
<c:import url="../template/header.jsp"></c:import>
	
	<link rel="stylesheet" href="../resources/css/hamberger.css">
	<link rel="stylesheet" href="../resources/css/index.css">
<style type="text/css">
img {
	width: 400px;
	height: 400px;
}
#detailArea {
    margin: 0 auto;
    text-align: center;
} 
</style>
</head>
<body>
	<div id="detailArea">
		
		<header>
			<h3 id="bo_v_title">
				${dto.title}       </h3>
	</header>
	
	<section id="bo_v_info">
		작성자 <strong><span class="sv_member">${dto.id}</span></strong>
	</section>
	<h3 class="contents">본문 : ${dto.contents}</h3>
	<hr>
	<section id="bo_v_atc">
		<div id="bo_v_con">
		<h3>첨부사진</h3>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<img alt="" src="../resources/upload/review/${f.fileName}">
		</c:forEach>
		</div>
	</section>
	<hr>

	<div class="btnList">
	<a href="./list">목록</a>
	<!-- 작성자만 수정과 삭제가 가능하게끔  -->
	<c:if test="${auth.id eq dto.id}">
		<!-- <button type="button" onclick="button_del();">삭제하기</button> -->
		<a href="./reviewUpdate?num=${dto.num}">수정하기</a>
		<a href="./reviewDelete?num=${dto.num}"
			onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</a>
	</c:if>
</div>
	</div>

	<script src="../resources/js/hamberger.js"></script>
</body>
</html>