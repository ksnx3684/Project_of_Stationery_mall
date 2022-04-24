<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>  
    <!-- Mobile Nav (max width 767px)-->
    <div class="mobile-nav">
        <!-- Navbar Brand -->
        <div class="amado-navbar-brand">
            <a href="/project"><img src="/project/resources/img/header-img/title.png" alt=""></a>
        </div>
        <!-- Navbar Toggler -->
        <div class="amado-navbar-toggler">
            <span></span><span></span><span></span>
        </div>
    </div>

    <!-- Header Area Start -->
    <header class="header-area clearfix">
        <!-- Close Icon -->
        <div class="nav-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <!-- Logo -->
        <div class="logo">
            <a href="/project"><img src="/project/resources/img/header-img/title.png" alt=""></a>
        </div>
        <!-- Amado Nav -->
        <nav class="amado-nav">
            <ul>
                <li><a href="/project/">Home</a></li>
                <li><a href="/project/product/list">Shop</a></li>
                <li><a href="/project/faq/faqList">FAQ</a></li>
                <li><a href="/project/qnas/list">Q&A</a></li>
                <li><a href="/project/review/list">Review</a></li>
                <li><a href="/project/notices/list">Notices</a></li>
            </ul>
        </nav>
        <!-- Button Group -->
        <div class="amado-btn-group mt-30 mb-30">
            <c:choose>
                <c:when test="${not empty auth}">
                    <a href="/project/users/mypage" class="btn amado-btn mb-15">Mypage</a>
                    <a href="/project/users/logout" class="btn amado-btn active">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="/project/users/login" class="btn amado-btn mb-15">Login</a>
                    <a href="/project/users/joinCheck" class="btn amado-btn active">Join</a>
                </c:otherwise>
            </c:choose>
        </div>
        <!-- Cart Menu -->
        <div class="cart-fav-search mb-30">
            <c:if test="${not empty auth}">
                <a href="/project/cart/cartlist" class="cart-nav"><img src="/project/resources/img/header-img/cart.png" alt="">Cart</a>
            </c:if>
            <a href="#" class="search-nav"><img src="/project/resources/img/header-img/search.png" alt="">Search</a>
        </div>
    </header>
</body>
</html>