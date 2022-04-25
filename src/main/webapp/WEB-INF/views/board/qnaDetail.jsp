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
	<title>Q&A</title>

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
						<a href="../product/detail?productNum=${param.productNum}">질문상품으로 이동</a>
						<header>
							<h3 id="bo_v_title">
								${dto.title}
							</h3>
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