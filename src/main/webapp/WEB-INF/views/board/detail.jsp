<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
	
	<link rel="stylesheet" href="../resources/css/hamberger.css">
	<link rel="stylesheet" href="../resources/css/index.css">
	<link rel="stylesheet" href="../resources/css/boardDetail.css">

</head>
<body>
<div id="detailArea">
	<c:choose>
		<c:when test="${board eq 'notices'}">
			<h1>공지사항</h1>	
		</c:when>
		<c:when test="${board eq 'faq'}">
			<h1>자주 묻는 질문</h1>
		</c:when>
		<c:otherwise>			
			<h1>${board} Detail Page</h1>
		</c:otherwise>
	</c:choose>
<header>
        <h3 id="bo_v_title">
            ${dto.title}       </h3>
</header>
<section id="bo_v_info">
        작성자 <strong><span class="sv_member">${dto.id}</span></strong>
        <c:if test="${board eq 'notices'}">
        <span class="sound_only">작성일</span><strong>${dto.createdDate}</strong>
        </c:if>
    </section>
    <hr>
    <section id="bo_v_atc">
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
        ${dto.contents}
</div>
                <!-- } 본문 내용 끝 -->

    </section>
    
    

	<c:if test="${board eq 'notices'}">
		<br>
		<c:forEach items="${dto.fileDTOs}" var="f"> <!-- 파일 다운로드 -->
		<!-- 	<img alt="" src="../resources/upload/product/fileName(UUID)">  -->
			<img alt="" src="../resources/upload/notices/${f.fileName}">
		</c:forEach>
	</c:if>
	
	<hr>
	
	
	
	<a href="./list">글 목록</a>
	<!-- 작성자만 수정과 삭제가 가능하게끔  -->
	<c:if test="${auth.id eq dto.id}">
		<!-- <button type="button" onclick="button_del();">삭제하기</button> -->
		<a href="./delete?num=${dto.num}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
		<a href="./update?num=${dto.num}">수정</a>
	</c:if>
	
</div>


	<script src="../resources/js/hamberger.js"></script>
</body>
</html>