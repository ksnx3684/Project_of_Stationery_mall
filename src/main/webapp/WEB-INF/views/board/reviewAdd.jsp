<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 - SQUARE SHOP</title>
<link href="../resources/css/boardForm.css" rel="styleSheet" />
<!-- favicon.ico 404 (Not Found) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<c:import url="../template/header.jsp"></c:import>

<link rel="stylesheet" href="../resources/css/hamberger.css">
<link rel="stylesheet" href="../resources/css/index.css">
<!-- summernote import -->
 <!--  jQuery, bootstrap -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


</head>
<body>
	<!-- <div id="container"> -->
	<form action="./reviewAdd" method="post" style="width: 100%" onsubmit="return addSubmit();" enctype="multipart/form-data">
		<div class="item">
			<table class="table-basic">
				<tbody>
					<tr>
						<td>
							<a href="../product/detail?productNum=${param.productNum}">주문상품으로 이동</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="productNum" value="${param.productNum}">
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="detailNum" value="${param.detailNum}">
						</td>
					</tr>
					<tr>
						<td>Writer <input type="text" name="id" value="${auth.id}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td>Title <input type="text" name="title" id="title" placeholder="글 제목"></td>
					</tr>
					<tr>
						<td>본문</td>
					</tr>
					<tr>
						<td><textarea name="contents" rows="" cols=""
								placeholder="글 내용을 입력하세요." id="summernote"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		
			<div id="fileContainer">
				<div id="fileResult" class="alignCenter">


				</div>
				<div class="fileAdd">
					<button type="button" id="fileAdd">파일추가</button>
				</div>
			</div>
		
		<hr>
		<div id="btnList">
			<button type="submit">글 작성</button>
			<button type="button" id="addCancel">취소</button>
		</div>
	</form>
	
<script>
    $(document).ready(function() {
      $('#summernote').summernote({
        placeholder: '본문을 입력하세요.',
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


	<script src="../resources/js/file.js"></script>
	<script src="../resources/js/hamberger.js"></script>
</body>
</html>