<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Product Add page</h1>
<form action="./add" method="post">
	상품 이름<input type="text" name="name">
	설명<textarea name="contents" rows="10" cols="10"></textarea>
	가격<input type="text" name="price">
	재고<input type="text" name="stock">	
	썸네일<input type="text" name="thumbnail">
	<div>
	category<input type="text" name="categoryNum">
	</div>
	
	
	<button type="submit">ADD</button>
</form>

</body>
</html>