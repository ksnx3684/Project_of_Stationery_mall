<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h5><a href="./delete?productNum=${dto.productNum}">delete</a></h5>
<h5><a href="./update?productNum=${dto.productNum}">update</a></h5>

<body>
detail.jsp
<h3>상품명 : ${dto.name}</h3>
<h4>가격 : ${dto.price}</h4>
<h4>설명 : ${dto.contents}</h4>
</body>
</html>