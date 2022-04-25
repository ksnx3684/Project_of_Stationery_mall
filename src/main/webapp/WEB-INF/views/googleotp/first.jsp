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
        <div class="container" style="width:400px; margin-top: 50px;">
            <h2 style="text-align: center;">관리자 로그인 페이지</h2>
            <form name="f" method="post" action="second">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" placeholder="ID" name="user_id">
                </div>
                <div class="form-group">
                    <label for="pwd">PW</label>
                    <input type="password" class="form-control" placeholder="PW" name="user_pw">
                </div>
                <fieldset>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>
