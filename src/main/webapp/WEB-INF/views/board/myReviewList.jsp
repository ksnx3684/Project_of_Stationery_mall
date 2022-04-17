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
    <title>나의 리뷰 내역</title>

    <!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
    <link rel="stylesheet" href="../resources/css/board/myReviewList.css">

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

                    <div class="container reviewlist">
                        <h2>리뷰 작성 내역</h2>
                        <table class="table">
                            <thead>
                                <tr class="success">
                                    <th>글번호</th>
                                    <th>작성자</th>         
                                    <th>주문상품</th>
                                    <th>제목</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.reviewDTO}" var="dto">
                                    <tr class="active">
                                        <td>${dto.num}</td>
                                        <td>${dto.id}</td>
                                         <c:forEach items="${dto.orderDetailDTOs}" var="od">
                                        <td><a href="../product/detail?productNum=${od.productNum}">${od.name}</a></td>                        
                                        </c:forEach> 
                                        <td><a href="../review/reviewDetail?num=${dto.num}">${dto.title}</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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

    <script type="text/javascript" src="../resources/js/users/orderlist.js"></script>

</body>
</html>