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
	<title>상세보기</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link rel="stylesheet" href="../resources/css/index.css">

	<style type="text/css">
		#detailArea {
			width: 70%;
			margin: 0 auto;
			text-align: center;
			padding-top: 60px;
			padding-bottom: 60px;
		} 
	</style>

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
									${dto.title}
								</h3>
						</header>
						<section id="bo_v_info">
							작성자 <strong><span class="sv_member">${dto.id}</span></strong>
							<c:if test="${board eq 'notices'}">
							<span class="sound_only">작성일</span><strong>${dto.createdDate}</strong>
							</c:if>
						</section>
						<hr>
						<section id="bo_v_atc">
							<div id="bo_v_con">
								${dto.contents}
							</div>
						</section>
						<c:if test="${board eq 'notices'}">
							<br>
							<c:forEach items="${dto.fileDTOs}" var="f">
								<img alt="" src="../resources/upload/notices/${f.fileName}">
							</c:forEach>
						</c:if>
						<hr>
						<c:choose>
							<c:when test="${board eq 'faq'}">
								<a href="./faqList">글 목록</a>
							</c:when>
							<c:otherwise>
								<a href="./list">글 목록</a>
							</c:otherwise>
						</c:choose>
						<!-- 작성자만 수정과 삭제가 가능하게끔  -->
						<c:if test="${auth.id eq dto.id}">
							<a href="./delete?num=${dto.num}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
							<a href="./update?num=${dto.num}">수정</a>
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