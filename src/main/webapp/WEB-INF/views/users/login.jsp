<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="../resources/css/users/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('../resources/img/joanna-kosinska-RE-8WswW95o-unsplash.jpg')">
    <div class="total">
        <div class="container" style="width:400px; margin-top: 50px;">
            <h2 style="text-align: center;">로그인 페이지</h2>
            <form class="frm" action="./login" method="post">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" placeholder="ID" name="id" value="${cookie.remember.value}">
                </div>
                <div class="form-group">
                    <label for="pwd">PW</label>
                    <input type="password" class="form-control" placeholder="PW" name="pw">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="remember" value="1">ID 저장</label>
                </div>
                <fieldset>
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <a href="./joinCheck"><button type="button" class="btn btn-primary">회원가입</button></a>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>