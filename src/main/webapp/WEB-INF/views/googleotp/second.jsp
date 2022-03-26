<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<html>
<head>
	<title>Second</title>
	<script>
	if('${result}' !='') {
		alert('${result}');
	}
	</script>
</head>
<body>
<h1>
	otp 
</h1>
 <form name="f" method="post" action="nf15ndf894khqiv730jifds">
<P>  <input type="hidden" name="secretKey" value="${secretKey}"/></P>
<P>  barcode url : <img src="${url}"/></P>
<P>  input otp : <input type="text" name="user_code"/></P>
<P>  <input type="submit" name="확인"/></P>
</form>
</body>
</html>
