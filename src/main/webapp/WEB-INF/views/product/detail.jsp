<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>Detail Page</h1>
	<a href="./delete?productNum=${dto.productNum}">delete</a>
	<a href="./update?productNum=${dto.productNum}">update</a>
	<hr>

	<table>
		<tr>
			<th scope="row">상품명</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th scope="row">가격</th>
			<td>${dto.price}원</td>
		</tr>
		<tr>
			<th scope="row">상품설명</th>
			<td>${dto.contents}</td>
		</tr>
		<tr>
			<th scope="row">색상</th>
			
			<td>
				<ul>
				<c:forEach items="${option}" var="option">
					<li><button type="button">${option.optionContents}</button></li>
					<button type="hidden" name="optionNum" value="${option.optionNum}"></button>
				</c:forEach>

				</ul>

			</td>
		</tr>

	</table>


	<c:forEach items="${dto.productFileDTOs}" var="f">
		<!-- 수정해라 나중에 f.fileName으로 -->
		<img alt="" src="../resources/upload/product/${f.fileName}">
	</c:forEach>


	<hr>
</body>
</html>