<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default" style="background-color: rgb(224, 242, 255);">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./">네모생각</a>
    </div>
    <ul class="nav navbar-nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">카테고리<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="./product/list">전체상품보기</a></li>
            </ul>
        </li>
        <li><a href="./faq/list">FAQ</a></li>
        <li><a href="#">Q&A</a></li>
        <li><a href="./notices/list">Notices</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <c:if test="${not empty auth}">
            <li><a href="./cart/cartlist">장바구니</a></li>
        </c:if>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">메뉴&nbsp;<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <c:choose>
                    <c:when test="${not empty auth}">
                        <li><a href="./users/mypage">마이페이지</a></li>
                        <li class="divider"></li>
                        <li><a href="./users/logout">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="./users/login">로그인</a></li>
                        <li class="divider"></li>
                        <li><a href="./users/joinCheck">회원가입</a></li>
                    </c:otherwise>    
                </c:choose>
            </ul>
        </li>
    </ul>
</nav>

  
</div>

</body>
</html>