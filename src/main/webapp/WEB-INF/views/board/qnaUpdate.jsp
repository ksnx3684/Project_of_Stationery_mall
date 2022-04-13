<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정 - SQUARE SHOP</title>
<c:import url="../template/header.jsp"></c:import>
	
	<link rel="stylesheet" href="../resources/css/hamberger.css">
	<link rel="stylesheet" href="../resources/css/index.css">
<link href="../resources/css/boardForm.css" rel="styleSheet" />
<!--  jQuery, bootstrap -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
#container {
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<h1>${board} Update Page</h1>

	<form action="./qnaUpdate" method="POST" enctype="multipart/form-data" onsubmit="return updateSubmit();">
		<!-- submit 버튼 누를 경우 updateSubmit 함수 호출 -->
		<div class="item">
			<table class="table-basic">
				<tbody>
					<tr>
						<td>
							문의유형
							<select id="subject" name="type">
								<!-- type=1 배송문의 type=2 상품문의 -->
								<option value="1">배송문의</option>
								<option value="2">상품문의</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><input type="hidden" name="num" value="${dto.num}"> </td>
					</tr>
					<tr>
						<td><input type="hidden" name="productNum" value="${dto.productNum}"></td>
					</tr>
					<tr>
						<td>작성자 <input type="text" name="id" disabled="disabled" value="${auth.id}"></td>
					</tr>
					<tr>
						<td>Title <input type="text" name="title" id="title" value="${dto.title}"></td>
					</tr>
					<tr>
						<td>
							본문
						</td>
					</tr>
					<tr>
						<td><textarea name="contents" rows="" cols="" id="summernote">${dto.contents}</textarea></td>
					</tr>
				</tbody>

			</table>

		</div>
		

		<c:if test="${auth.userAccount eq 1}">
		<hr>
		<div id="container">
		<div id="files">
			<c:forEach items="${dto.fileDTOs}" var="f">
				<div>
					${f.oriName}
					<button type="button" data-fileNum="${f.fileNum}"
						class="fileDeleteBtn">X</button>

					<img class="qnaImg" alt=""
						src="../resources/upload/qnas/${f.fileName}">
				</div>
			</c:forEach>
		</div>

		<div id="fileContainer">
			<div id="fileResult" class="alignCenter"></div>
			<div class="fileAdd">
				<button type="button" id="fileAdd">FileAdd</button>
			</div>
		</div>
		</div>
		</c:if>
		<hr>

		<div id="btnList">
			<c:choose>
				<c:when test="${auth.userAccount eq 0}">
					<button type="submit">답변수정</button>
				</c:when>
				<c:otherwise>
					<button type="submit">질문수정</button>
				</c:otherwise>

			</c:choose>
			<!-- 취소 버튼 누를 시 뒤로 가기-->
			<button type="button" id="addCancel">취소</button>
		</div>
	</form>
	<script src="../resources/js/hamberger.js"></script>
	<script>
    $(document).ready(function() {
        $('#summernote').summernote({
          height: 500,
          lang: 'ko-KR',
          toolbar: [
               
              // [groupName, [list of button]]
              ['Font Style', ['fontname']],
              ['style', ['bold', 'italic', 'underline']],
              ['font', ['strikethrough']],
              ['fontsize', ['fontsize']],
              ['para', ['paragraph']],
              ['color', ['color']],
              ['table', ['table']],
              ['height', ['height']],
              ['highlight', ['highlight']],
              ['Insert', ['link']],
                   ]
        });
      });
	</script>


	<script type="text/javascript" src="../resources/js/updateFile.js"></script>
</body>
</html>