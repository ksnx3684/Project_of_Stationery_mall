<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Document</title>

</head>
<body>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="검색할 상품을 입력하세요">
                            <button type="submit"><img src="./resources/img/header-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="./resources/img/header-img/title.png" alt=""></a>
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
                <a href="index.html"><img src="./resources/img/header-img/title.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="/project/">Home</a></li>
                    <li><a href="shop.html">Shop</a></li>
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
                    <a href="cart.html" class="cart-nav"><img src="./resources/img/header-img/cart.png" alt="">Cart</a>
                </c:if>
                <a href="#" class="search-nav"><img src="./resources/img/header-img/search.png" alt="">Search</a>
            </div>
        </header>
        <!-- Header Area End -->

        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">

            </div>
        </div>
        <!-- Product Catagories Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
</body>
</html>