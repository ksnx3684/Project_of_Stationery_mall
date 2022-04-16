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

<div id="header">
<nav class="navbar navbar-default" style="background-color: #cee5d0;">
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
        
        <li><a href="/project/">HOME</a></li>
        <li><a href="/project/faq/faqList">FAQ</a></li>
        <li><a href="/project/qnas/list">Q&A</a></li>
        <li><a href="/project/review/list">Review</a></li>
        <li><a href="/project/notices/list">Notices</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right" style="margin-right: 0px;">
        <c:if test="${not empty auth}">
            <li><a href="/project/cart/cartlist">장바구니</a></li>
        </c:if>
        <li class="dropdown">
            <a href="" class="dropdown-toggle rightmenu" data-toggle="dropdown" role="button" aria-expanded="false" style="margin-right: 0px">메뉴&nbsp;<span class="caret"></span></a>
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

</div>
</body>
</html>