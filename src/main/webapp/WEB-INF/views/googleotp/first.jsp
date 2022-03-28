<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<html>
<head>
	<title>First</title>
	<script>
	if('${result}' !='') {
		alert('${result}');
	}
	</script>
</head>
<body>
<h1>
	password?  
</h1>
 <form name="f" method="post" action="second">
<P>  ID <input type="text" name="user_id"/></P>
<P>  PW <input type="password" name="user_pw"/></P>
<P>  <input type="submit" name="확인"/></P>
</form>
</body>
</html>
