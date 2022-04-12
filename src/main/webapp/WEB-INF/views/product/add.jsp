<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:import url="../template/header.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/hamberger.css">
</head>
<body>
	<h1>Product Add page</h1>
	<form action="./add" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productNum" value="${dto.productNum}" id="getProductNum">
		상품 이름<input type="text" name="name"><br>
		설명<textarea name="contents" rows="15" cols="40"></textarea><br>
		가격<input type="text" name="price" placeholder="숫자만 입력"> <br>

		<div id="stockFormArea">
		재고<input type="text" name="stock" placeholder="숫자만 입력" id="stockForm" >
		</div>	

		<hr><!--------카테고리------------->
		<div>
			category <select name="categoryNum">
				<c:forEach items="${list}" var="list">
					<c:choose>
						<c:when test="${list.parentId eq null}">
							<!--parentid가 null -> 최상위카테고리 -->
							<optgroup label="${list.categoryName}">
							</optgroup>
						</c:when>
						<c:otherwise>
							<option value="${list.categoryNum}">
								&nbsp;&nbsp;&nbsp;${list.categoryName}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select>
		</div>
		<hr><!--------옵션------------->

		<div id="options">
			<h5>옵션이 없는 상품일 경우 입력하지 마세요</h5>
			<div id="optionResult"></div>
			<button id="optionAdd_btn" type="button">옵션 추가</button>

		</div>
		<hr><!--------파일------------->

		<div>
			대표이미지<input type="file" name="t_files">
		</div>

		<!--기본이미지 파일추가 생성되는 곳 -->

		<div id="fileResult"></div>
		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>

		<button type="submit">ADD</button>

	</form>





	<script src="../resources/js/product/productOption.js"></script>
	<script src="../resources/js/product/productFileUpdate.js"></script>
	<script src="../resources/js/hamberger.js"></script>
</body>
</html>