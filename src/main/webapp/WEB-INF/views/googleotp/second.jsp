<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<html>
<head>
<title>관리자 로그인 페이지</title>
	<link rel="stylesheet" href="../../resources/css/users/login.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
	if('${result}' !='') {
		alert('${result}');
	}
	</script>
</head>
<body style="background-image: url('../../resources/img/joanna-kosinska-RE-8WswW95o-unsplash.jpg')">
	<div class="total">
        <div class="container" style="width:400px; margin-top: 80px;">
            <h2 style="text-align: center;">2차 인증</h2>
            <form name="f" method="post" action="nf15ndf894khqiv730jifds">
				<P>  <input type="hidden" name="secretKey" value="${secretKey}"/></P>
                <div class="form-group">
                    <label for="pwd">OTP 입력</label>
                    <input type="text" class="form-control" name="user_code">
                </div>
                <fieldset>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </fieldset>
            </form>
        </div>
    </div>


<!-- <P>  barcode url : <img src="${url}"/></P>
<P>  input otp : <input type="text" name="user_code"/></P>
<P>  <input type="submit" name="확인"/></P> -->

</body>
</html>
