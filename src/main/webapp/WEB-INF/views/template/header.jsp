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

<nav class="navbar navbar-default" style="background-color: #c9de73;">
    <!-- <div class="container-fluid"> -->
        <div class="navbar-header" style="z-index:4">
            <a class="navbar-brand menu-trigger" href=""><input class="leftmenu" type="hidden" value="0">
                <span></span>
                <span></span>
                <span></span>
            </a>
        </div>
    <!-- </div> -->
    <ul class="nav navbar-nav">
        <!-- <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">카테고리<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="./product/list">전체상품보기</a></li>
            </ul>
        </li> -->
        <li><a href="/project/">HOME</a></li>
        <li><a href="/project/faq/list">FAQ</a></li>
        <li><a href="#">Q&A</a></li>
        <li><a href="/project/notices/list">Notices</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <c:if test="${not empty auth}">
            <li><a href="/project/cart/cartlist">장바구니</a></li>
        </c:if>
        <li class="dropdown">
            <a href="" class="dropdown-toggle rightmenu" data-toggle="dropdown" role="button" aria-expanded="false">메뉴&nbsp;<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <c:choose>
                    <c:when test="${not empty auth}">
                        <li><a href="/project/users/mypage">마이페이지</a></li>
                        <li class="divider"></li>
                        <li><a href="/project/users/logout">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/project/users/login">로그인</a></li>
                        <li class="divider"></li>
                        <li><a href="/project/users/joinCheck">회원가입</a></li>
                    </c:otherwise>    
                </c:choose>
            </ul>
        </li>
    </ul>
</nav>

<aside style="z-index: 3;">
    <div class="sidebar_menu">
        <ul class="menu_wrap" style="font-size:30px">
            <br>
            <br>
            <li><a href="/project/product/list">전체상품보기</a></li>
            <li><a href="2.Information.html">Information</a></li>
            <li><a href="3.게시글.html">게시글</a></li>
        </ul>
</div>
</aside>

</body>
</html>