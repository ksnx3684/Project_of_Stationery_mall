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
    <title>본인확인</title>

    <!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">

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

                    <div class="container" style="width:500px; margin-top: 200px; margin-bottom: 200px;">
                        <h4 style="text-align: center;">본인확인을 위하여 아이디와 비밀번호를<br>입력해 주십시오</h4>
                        <form class="frm" action="./mychangecheck" method="post">
                            <div class="form-group">
                                <label for="id">ID</label>
                                <input type="text" class="form-control" placeholder="ID" name="id" value="${cookie.remember.value}">
                            </div>
                            <div class="form-group">
                                <label for="pwd">PW</label>
                                <input type="password" class="form-control" placeholder="PW" name="pw">
                            </div>
                            <fieldset>
                                <button type="submit" class="btn btn-primary">로그인</button>
                            </fieldset>
                        </form>
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