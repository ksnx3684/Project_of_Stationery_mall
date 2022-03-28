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
<form action="./update" method="post" enctype="multipart/form-data">
<input type="hidden" name="productNum" value="${dto.productNum}">
	상품 이름<input type="text" name="name" value="${dto.name}">
	설명<textarea name="contents" rows="10" cols="10">${dto.contents}</textarea>
	가격<input type="text" name="price" value="${dto.price}">
	재고<input type="text" name="stock" value="${dto.stock}">	
	<div>
	category<input type="text" name="categoryNum" value="${dto.categoryNum}">
	</div>
	
	<div id="files">
		<c:forEach items="${dto.productFileDTOs}" var="f"  varStatus="state">
			<div>
				<c:choose>
					<c:when test="${state.first}">
					대표이미지 ${f.oriName} <button type="button" data-fileNum="${f.fileNum}" class="fileDeleteBtn_t">X</button> 
						<%-- 대표사진<input type="file" name="files" value="${f.fileName}"> --%>
				<!-- 		나중에 썸네일 수정하기
						
						파일선택버튼을 눌렀으면 히든 보내줌 아니면 지워 
						수정안하는 경우에는 히든 보내지마   -->
					<%-- 	<input type="hidden" name="fileNum" value="${f.fileNum}" id="hiddenfileNum">  --%>
				
					</c:when>
						
					
					<c:otherwise>
					기본이미지 ${f.oriName} <button type="button" data-fileNum="${f.fileNum}" class="fileDeleteBtn">X</button> 
					
						<%-- 사진 <input type="file" name="files" value="${f.fileName}"> --%>
					</c:otherwise>
					
				</c:choose>
			</div>
			<div id="fileResult_t"></div>
			<!-- 썸네일에 fileName을 넣어야되는데 fileManger를 거쳐야 얻을 수 있음 여러 파일중에서 썸네일을 어떻게 구분해서 prductcontroller까지 보내지  -->
		 
		</c:forEach>
		<input type="hidden" name="check" id="tCheck" >
	</div>
	
	
		<div id="fileResult"> 
		
		</div>
		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>
	
	<button type="submit">Update</button>
</form>

	<script type="text/javascript" src="../resources/js/file.js"></script>
</body>
</html>