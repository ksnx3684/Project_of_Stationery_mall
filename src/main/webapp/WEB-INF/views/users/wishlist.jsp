<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
</head>
	<link rel="stylesheet" href="../resources/css/wishlist.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
<body>
	<div class="container" style="text-align:center; width:800px">
		<h2>위시리스트</h2>
		<table class="table">
		  <thead>
			<tr class="success">
			  <th style="text-align:center; background-color: #cee5d0;">번호</th>
			  <th style="text-align:center; background-color: #cee5d0;">상품명</th>
			</tr>
		  </thead>
		  <tbody>
			<c:forEach items="${wishlistDTO}" var="dto">
				<tr class="active">
					<td><input class="check" name="wishNum" type="checkbox" data-wishNum="${dto.wishNum}" value="${dto.wishNum}">&nbsp;${dto.wishNum}</td>
					<td><a href="../product/detail?productNum=${dto.productNum}">
						<c:if test="${dto.productDTO.thumbnail ne null}">
							<img class="image" src="../resources/upload/product/${dto.productDTO.thumbnail}" style="width:32px; height: 32px;">&nbsp;
						</c:if>
						${dto.productDTO.name}</a>
					</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
		<form class="frm" action="./wishlistDelete" method="post" style="display: inline;">
			<span id="selectDelete_btn"><button type="button" class="btn btn-danger">선택된 상품 삭제</button></span>
			<script>
				$("#selectDelete_btn").click(function () {
					let confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");

					if (confirm_val) {
						let checkArr = new Array();

						$("input[class='check']:checked").each(function () {
							checkArr.push($(this).attr("data-wishNum"));
						});

						$.ajax({
							url: "wishlistDelete",
							type: "post",
							data: { checkbox : checkArr},
							traditional : true,

							success: function () {
								location.href = "./wishlist";
							}
						});
						const frm = document.getElementsByClassName("frm");
						frm.submit();
					} else {
						//location.reload;
					}
				});
			  </script>
		</form>
	</div>
	<script src="../resources/js/hamberger.js"></script>
</body>
</html>