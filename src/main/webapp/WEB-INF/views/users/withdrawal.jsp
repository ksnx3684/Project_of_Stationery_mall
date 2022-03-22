<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<h1>탈퇴를 진행하시겠습니까?</h1>
<h1>본인확인을 위하여 아이디와 비밀번호를 입력해 주십시오</h1>
	<form class="frm" action="./withdrawal" method="post">
        <fieldset>
            <legend>ID</legend>
            <input type="text" placeholder="ID" name="id">
        </fieldset>
        <fieldset>
            <legend>PW</legend>
            <input type="password" placeholder="PW" name="pw">
        </fieldset>
        <fieldset>
            <button type="submit">로그인</button>
        </fieldset>
	</form>
</body>
</html>