<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/project/resources/css/header.css" rel="styleSheet" />



<header class="header">
	<nav class="nav_top">
		<ul>
			<!-- <a>메서드 형식 : GET -->
		
			<li><a href="/project/notices/list">Notice</a></li>
			<li><a href="/project/faq/list">FaQ</a></li>
			<li><a href="/s1/bankbook/list">Product</a></li>
		</ul>
	</nav>

	<nav class="nav_sub">
		<ul>
			<c:choose>
				<c:when test="${not empty auth}">
					<li><a href="/project/users/mypage">마이페이지</a></li>
					<li><a href="/project/users/logout">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/project/users/login">로그인</a></li>
					<li><a href="/project/users/join">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</header>
<!--header 끝 --> 