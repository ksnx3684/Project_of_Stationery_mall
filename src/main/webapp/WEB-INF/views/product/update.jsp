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
<form action="./update" method="post">
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
					대표사진 ${f.oriName} <button type="button" data-fileNum="${f.fileNum}" class="fileDeleteBtn">X</button> 
						<%-- 대표사진<input type="file" name="file" value="${f.fileName}"> --%>
					</c:when>
					
					<c:otherwise>
					사진 ${f.oriName} <button type="button" data-fileNum="${f.fileNum}" class="fileDeleteBtn">X</button> 
					
						<%-- 사진 <input type="file" name="file" value="${f.fileName}"> --%>
					</c:otherwise>
					
				</c:choose>
			</div>
		</c:forEach>
	</div>
	
	
		<div id="fileResult"> 
		
		</div>
		<div>
			<button type="button" id="fileAdd">FileAdd</button>
		</div>
	
	<button type="submit">Update</button>
	<script type="text/javascript" src="../resources/js/file.js"></script>
</form>
</body>
</html>