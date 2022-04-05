<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인확인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <h2>본인확인을 위하여 아이디와 비밀번호를 입력해 주십시오</h2>
	<form class="frm" action="./mychangecheck" method="post">
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
	</form> -->

    <div class="container" style="width:500px; margin-top: 200px;">
        <h4 style="text-align: center;">본인확인을 위하여 아이디와 비밀번호를 입력해 주십시오</h4>
        <form class="frm" action="./mychangecheck" method="post">
            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" class="form-control" placeholder="ID" name="id" value="${cookie.remember.value}">
            </div>
            <div class="form-group">
                <label for="pwd">PW</label>
                <input type="password" class="form-control" placeholder="PW" name="pw">
            </div>
            <fieldset>
                <button type="submit" class="btn btn-primary">로그인</button>
            </fieldset>
        </form>
    </div>
</body>
</html>