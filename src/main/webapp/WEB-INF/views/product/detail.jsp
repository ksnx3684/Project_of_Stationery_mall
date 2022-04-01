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
	<h3>상품명 : ${dto.name}</h3>
	<h4>가격 : ${dto.price}</h4>
	<h4>설명 : ${dto.contents}</h4>

	<c:forEach items="${dto.productFileDTOs}" var="f">
		<!-- 수정해라 나중에 f.fileName으로 -->
		<img alt="" src="../resources/upload/product/${f.fileName}">
	</c:forEach>
	<hr>

	<div class="qna_board">
		<h2 class="titleArea">Q&A</h2>
		<div id="qnaArea" class="qna-inside">
			<p class="boardBtn">
				<button type="button">문의하기</button>
			</p>
			<div class="qna-board-list">
				<table class="table-basic">

					<tbody>
						<c:forEach items="${requestScope.list}" var="dto">
							<tr>
								<td>${dto.num}</td>
								<td><a href="./detail?num=${dto.num}"> <c:catch>
											<c:forEach begin="1" end="${dto.depth}">↳&nbsp;</c:forEach>
										</c:catch> ${dto.title}
								</a></td>
								<td>${dto.writer}</td>
								<td>${dto.regDate}</td>
								<td>${dto.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</div>

		</div>
	</div>
</body>
</html>