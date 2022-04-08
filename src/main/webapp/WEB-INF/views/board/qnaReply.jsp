<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/boardForm.css" rel="styleSheet" />
<!-- favicon.ico 404 (Not Found) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- summernote import -->
<!--  jQuery, bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
	.qnaImg {
		width:300px;
		height:300px;
	}
</style>

</head>
<body>
	<h1>${board}Reply Page</h1>
	<!-- <div id="container"> -->
	<form action="./qnaReply" method="post" style="width: 100%"
		onsubmit="return addSubmit();">
		<div class="item">
			<table class="table-basic">
				<tbody>
					<tr>
						<td><input type="hidden" value="${dto.num}" name="num">
						</td>
					</tr>
					<tr>
						<td><input type="hidden" name="type" value="${dto.type}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td><input type="hidden" name="productNum"
							value="${dto.productNum}"></td>
					</tr>
					<tr>
						<td>Writer <input type="text" name="id" value="${auth.id}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td>Title <input type="text" name="title" id="title"
							value="${dto.id}님, 질문 답변입니다❤" readonly="readonly"></td>
					</tr>
					<tr>
						<td>본문</td>
					</tr>
					<tr>
						<td><textarea name="contents" rows="" cols="" id="summernote">${dto.contents} 답변 : </textarea></td>
					</tr>
					<tr>
						<td>
							<c:forEach items="${dto.fileDTOs}" var="f">
								<h3>${f.oriName}</h3>
								<img class="qnaImg" alt="" src="../resources/upload/qnas/${f.fileName}">
							</c:forEach>
							
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 	</div>
 -->

		<hr>
		<div id="btnList">
			<button type="submit">글 작성</button>
			<button type="button" id="addCancel">취소</button>
		</div>
	</form>

	<script>
		$(document)
				.ready(
						function() {
							$('#summernote')
									.summernote(
											{
												placeholder : '본문을 입력하세요.',
												height : 500,
												lang : 'ko-KR',
												toolbar : [
														// [groupName, [list of button]]
														[ 'Font Style',
																[ 'fontname' ] ],
														[
																'style',
																[
																		'bold',
																		'italic',
																		'underline' ] ],
														[
																'font',
																[ 'strikethrough' ] ],
														[ 'fontsize',
																[ 'fontsize' ] ],
														[ 'para',
																[ 'paragraph' ] ],
														[ 'color', [ 'color' ] ],
														[ 'table', [ 'table' ] ],
														[ 'height',
																[ 'height' ] ],
														[ 'highlight',
																[ 'highlight' ] ],
														[ 'Insert', [ 'link' ] ], ]
											});
						});
	</script>


	<script src="../resources/js/file.js"></script>
</body>
</html>