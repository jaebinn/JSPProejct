<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test2</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("today","24/03/25");
		response.addCookie(cookie);
	%>
	<form action="el_test3.jsp" method="post">
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="password" name="pw"><br>
		취미<br>
		게임 <input type="checkbox" name="hobby" value="게임"><br>
		영화<input type="checkbox" name="hobby" value="영화"><br>
		<input type="submit">
	</form>
</body>
</html>