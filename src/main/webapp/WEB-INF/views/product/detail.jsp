<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.detailBox {
		border : 1px solid black;
		width : 500px;
		heigth : 200px;
	}
</style>
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
				<a href="../qnas/qnaAdd?productNum=${dto.productNum}" class="add-board">문의하기</a>
			</p>
			

	<div class="table-container">
		<h1>${board} qnas Page</h1>



		<table class="table-basic" id="qnaTable">
			<thead>
				<tr>
					<th>글번호</th>
					<th>문의유형</th>
					<th>글제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.qnaDto}" var="dto" varStatus="i">
					<tr>
						<td>${dto.num}</td>
						<td>
							<c:choose>
								<c:when test="${dto.type eq 1}">배송문의</c:when>
								<c:otherwise>상품문의</c:otherwise>
							</c:choose>
						</td>
					<%-- 	<td><a href="../qnas/qnaDetail?num=${dto.num}" class="qna" data-num="qnaDetail${i.index}">${dto.title}</a></td> --%>
							<td><a href="#" class="qna" data-num="${dto.num}">${dto.title}</a></td>
							<td><input type="hidden" class="contents" value="${dto.contents}"></td>
						<td>${dto.id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

 		<div class="pager">
			<c:if test="${pager.pre}">
				<a href="./list?page=${pager.startNum-1}">◀</a>
			</c:if>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<a href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
			</c:forEach>

			<c:if test="${pager.next}">
				<a href="./list?page=${pager.lastNum+1}">▶</a>
			</c:if>

		</div>
 
	</div>
				
		</div>
	</div>
			
	<script type="text/javascript" src="../resources/js/product/qnas.js"></script>
	
	
</body>
</html>