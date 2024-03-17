<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinview</title>
</head>
<body>
	<form name="joinForm" action="join_db.jsp" method="post">
		<fieldset>
			<legend>회원가입</legend>
			<input name="userid" placeholder="아이디를 입력하세요"><br>
			<input name="userpw" type="password" placeholder="비밀번호를 입력하세요"><br>
			<input name="username" placeholder="이름을 입력하세요"><br>
			<input type="submit" value="회원가입">
		</fieldset>
	</form>
</body>
</html>