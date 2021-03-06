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
	<title>List</title>

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
	<link href="../resources/css/table.css" rel="styleSheet" />
	<link href="../resources/css/list.css" rel="styleSheet" />
	<link href="../resources/css/notice.css" rel="styleSheet" />
	<!-- <link rel="stylesheet" href="../resources/css/index.css"> -->
	<link href="../resources/css/reset.css" rel="styleSheet"/>
<style>

#searchField {
    border: 0px;
	display: flex;
    align-items: center;
}
#searchbtn {
margin: 10px;
outline: none;
}
#searchbar {
	margin-left: 10px;
    height: 40px;
}
.custom-btn {
width: 80px;
height: 40px;
border: 2px solid rgb(177, 177, 177);
font-family: 'Lato', sans-serif;
font-weight: 500;
background: transparent;
cursor: pointer;
transition: all 0.3s ease;
position: relative;
display: inline-block;

}

/* 1 */
.btn-1 {
transition: all 0.3s ease;
}
.btn-1:hover {
box-shadow:
-7px -7px 20px 0px #fff9,
-4px -4px 5px 0px #fff9,
7px 7px 20px 0px #0002,
4px 4px 5px 0px #0001;
color:black;
}

select {
     padding:5px;
	 width: 80px;
     border:1px solid #999;
     font-family:'Nanumgothic';
     background:url(../resources/img/down.png)  95.5% center no-repeat;
     border-radius:3px;
     -webkit-appearance: none;
     -moz-appearance: none;
     appearance : none;
}
table-container a:hover { 
    color:white; 
    background-color: red; 
    text-decoration: none; 
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
					<div class="table-container" style="margin-top: 60px; margin-bottom: 60px;">
						<c:choose>
							<c:when test="${board eq 'qnas'}">
								<h1>Q&A</h1>	
							</c:when>
							<c:when test="${board eq 'review'}">
								<h1>REVIEW</h1>
							</c:when>
							<c:otherwise>			
								<h1>NOTICES</h1>
							</c:otherwise>
						</c:choose>
						<!-- ?????? ??? -->
						<div class="search-container">
							<form action="./list" method="get" class="search-form">
								<fieldset id="searchField">
									<select name="kind">
										<option value="col1">??????</option>
										<option value="col2">??????</option>
										<option value="col3">?????????</option>
									</select> <input type="text" id="searchbar" name="search" value="${pager.search }" placeholder="search">
									<button type="submit" class="custom-btn btn-1" id="searchbtn">??????</button>
								</fieldset>
							</form>
							<c:choose>
								<c:when test="${auth.userAccount eq 0}">
									<c:if test ="${board eq 'notices'}">
									<a href="./add" class="add-board">?????????</a>
								</c:if> 
								</c:when>
							</c:choose>
						</div>
						<table class="table-basic">
							<thead>
								<tr>
									<th>?????????</th>
									<th>?????????</th>
									<th>?????????</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.list}" var="dto">
									<tr>
										<td>${dto.num}</td>
										<c:choose>
											<c:when test="${board eq 'qnas'}">
												<td>
													<a href="./qnaDetail?num=${dto.num}&productNum=${dto.productNum}">
														<c:catch>
															<c:forEach begin="1" end="${dto.depth}">???&nbsp;</c:forEach>
														</c:catch>
														${dto.title}
													</a>
												</td>
											</c:when>
											<c:when test="${board eq 'review'}">
												<td>
													<a class="title" href="./reviewDetail?num=${dto.num}">
														${dto.title}
													</a>
												</td>
											</c:when>
											<c:otherwise>
												<td><a class="titleLink" href="./detail?num=${dto.num}">${dto.title}</a></td>
											</c:otherwise>
										</c:choose>
										<td>${dto.id}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="pager">
							<c:if test="${pager.pre}">
								<a href="./list?page=${pager.startNum-1}">???</a>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<a href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
							</c:forEach>
							<c:if test="${pager.next}">
								<a href="./list?page=${pager.lastNum+1}">???</a>
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