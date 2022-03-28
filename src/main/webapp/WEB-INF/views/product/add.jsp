<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Product Add page</h1>
<form action="./add" method="post" enctype="multipart/form-data">
	<input type="hidden" name="productNum" value="${dto.productNum}">
	상품 이름<input type="text" name="name">
	설명<textarea name="contents" rows="10" cols="10"></textarea>
	가격<input type="text" name="price">
	재고<input type="text" name="stock">	
	
	<!-- product에 카테고리 번호를 넣어야됨  -->
	<!-- 카테고리 이름을 가져와야됨 -->
	<!-- 여기에 어케 카테고리 이름을 가져옴? -->
	<!-- 컨트롤러에서  카테고리 서비스 호출-->
	<div>
	category
		<select name="categoryNum">
		<c:forEach items="${list}" var="list">
		<c:choose>
			<c:when test="${list.parentId eq null}">  <!--parentid가 null -> 최상위카테고리 -->
			<optgroup label="${list.categoryName}"> </optgroup>
			</c:when>
			<c:otherwise>
				<option value="${list.categoryNum}"> &nbsp;&nbsp;&nbsp;${list.categoryName}</option>
			</c:otherwise>
		</c:choose>
		
		</c:forEach>
	</select>

<!-- 파일  -->
<!-- <div>

	<div>
		대표이미지등록<input type="checkbox" name=>
		기본이미지등록<input type="checkbox">
	</div>

		<div id="fileResult"> </div>

		<div>
			<button type="button" id="fileAdd">FileAdd</button>
			<button type="button" class="del">Sample DEL</button>
		</div>
			<button type="submit">ADD</button>
</form>
		
	
</div> -->


<hr>
<!--  -->

	<div>
	썸네일<input type="file" name="t_files">
	</div>

		<div id="fileResult"> 
		
		</div>
		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>

	<button type="submit">ADD</button>



 <script src="../resources/js/product/productFileUpdate.js"></script> 
</body>
</html>