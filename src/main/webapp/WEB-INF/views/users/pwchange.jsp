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
    <title>비밀번호 변경</title>

    <!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
    <link rel="stylesheet" href="../resources/css/users/pwchange.css">

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

                    <div id = total>
                        <div class="container pwchange">
                            <h2 style="text-align: center;">비밀번호 변경</h2>
                            <form class="frm" action="./pwchange" method="post" id="frm" enctype="multipart/form-data">
                                <input type="hidden" name="id" id="id" value="${usersDTO.id}">
                                <div class="form-group">
                                    <label for="pwd">새 비밀번호 입력</label>
                                    <span id="pwResult1"></span>
                                    <span id="pwResult2"></span>
                                    <input type="password" class="form-control" placeholder="8글자 이상 16글자 이하" name="pw" id="pw">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">비밀번호 확인</label>
                                    <span id="pwResultCheck1"></span>
                                    <span id="pwResultCheck2"></span>
                                    <input type="password" class="form-control" placeholder="8글자 이상 16글자 이하" name="pw2" id="pw2">
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btn">변경</button>
                                </div>
                            </form>
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

    <script type="text/javascript" src="../resources/js/users/pwchange.js"></script>

</body>
</html>