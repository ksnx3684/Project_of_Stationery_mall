<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
    <div id = total>
    <form class="frm" action="./pwchange" method="post" id="frm" enctype="multipart/form-data">
        <input type="hidden" name="id" id="id" value="${usersDTO.id}">
        <fieldset>
            <legend>새 비밀번호 입력</legend>
            <input type="password" placeholder="8글자 이상 12글자 이하" name="pw" id="pw">
            <div id="pwResult"></div>
        </fieldset>
        <fieldset>
            <legend>비밀번호 확인</legend>
            <input type="password" placeholder="8글자 이상 12글자 이하" name="pw2" id="pw2">
            <div id="pwResultCheck"></div>
        </fieldset>
        <fieldset>
            <button type="button" id="btn">가입</button>
        </fieldset>
    </form>
    </div>
    <script type="text/javascript" src="../resources/js/pwchange.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
</body>
</html>