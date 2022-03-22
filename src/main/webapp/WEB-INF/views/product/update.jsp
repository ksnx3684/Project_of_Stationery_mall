<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	썸네일<input type="text" name="thumbnail" value="${dto.thumbnail}">
	
	<button type="submit">Update</button>
</form>
</body>
</html>