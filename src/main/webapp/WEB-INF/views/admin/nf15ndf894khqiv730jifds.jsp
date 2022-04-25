<%@page import="com.stationery.project.util.Otp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
    <link rel="stylesheet" href="../resources/css/users/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('../resources/img/joanna-kosinska-RE-8WswW95o-unsplash.jpg')">
    <div class="total">
        <div class="container" style="width:400px; margin-top: 70px;">
            <h2 style="text-align: center;">관리자 페이지</h2>
            <div class="row" style="margin-top: 20px;">
                <a href="./usersList"><button class="btn btn-info col-sm-6">회원관리</button></a>
                <a href="./usersOrderList"><button class="btn btn-info col-sm-6">회원주문내역</button></a>
            </div>
            <br>
            <div class="row">
                <a href="../category/add"><button class="btn btn-info col-sm-6">카테고리 추가 및 삭제</button></a>
                <a href="./faqManage"><button class="btn btn-info col-sm-6">자주 묻는 질문 추가 및 삭제</button></a>
            </div>
            <br>
            <div class="row">
                <a href="../"><button class="btn btn-success col-sm-12">메인으로 가기</button></a>
            </div>
        </div>
    </div>
</body>
</html>