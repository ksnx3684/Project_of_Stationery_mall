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
	<title>FAQ</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp" rel="stylesheet">
	<link rel="stylesheet" href="../resources/css/index.css">
	<link href="../resources/css/reset.css" rel="styleSheet"/>
	<link href="../resources/css/faqList.css" rel="styleSheet" />

</head>
<body>
	<!-- ##### Search Content ##### -->
	<c:import url="../template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="../template/new_header.jsp"></c:import>

			<!-- FAQ Area Start -->
			<div class="products-catagories-area clearfix">
				<div class="clearfix">
					<div id="faqArea">
						<h1><i class="fa fa-question-circle"></i>&nbsp;FAQ</h1>
						<c:if test ="${auth.userAccount eq 0}">
							<a href="./add" class="add-board">글작성</a>
						</c:if> 
						<!-- 검색 창 -->
						<div class="search-container">
							<form action="./faqList" method="get" class="search-form">
								<fieldset id="searchField">
									<select name="kind">
										<option value="col1">제목</option>
										<option value="col2">본문</option>
										<!-- <option value="col3">작성자</option> -->
									</select> <input type="text" name="search" value="${pager.search }" placeholder="search">
									<button type="submit" class="custom-btn btn-1">검색</button>
								</fieldset>
							</form>
						</div>
						<div class="contentsArea">
							<c:forEach items="${requestScope.list}" var="dto">
								<!-- <a class="titleLink accordion" href="./detail?num=${dto.num}">${dto.title}</a> -->
								<div class="qnaKind"><button class="titleLink accordion" type="button">${dto.title}</button></div>
								<div class="panels">${dto.contents}</div>	
							</c:forEach>
						</div>
						<div class="pager">
							<c:if test="${pager.pre}">
								<a href="./faqList?page=${pager.startNum-1}">◀</a>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<a href="./faqList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
							</c:forEach>
							<c:if test="${pager.next}">
								<a href="./faqList?page=${pager.lastNum+1}">▶</a>
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


	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;
		
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active1");
				var panels = this.parentElement.nextElementSibling;
				if (panels.style.maxHeight) {
			  	panels.style.maxHeight = null;
				} else {
			  	panels.style.maxHeight = panels.scrollHeight + "px";
				}
		  	});
		}
	</script>
	
</body>
</html>