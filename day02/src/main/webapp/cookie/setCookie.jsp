<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setCookie</title>
</head>
<body>
	<%
		Cookie cookie1 = new Cookie("chicchoc","Good");
		Cookie cookie2 = new Cookie("matdongsan","no_mat");
		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	%>
</body>
</html>