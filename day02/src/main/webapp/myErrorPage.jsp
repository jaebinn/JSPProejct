<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러가 발생했습니다.</title>
</head>
<body>
	<h2 style="color:yellow; background: black; font-size:2em;">알 수 없는 오류 발생!</h2>
	<a href="#">백신 프로그램 설치하기</a>
	<p style="color:red; font-weight: bold">
	<%
		out.print("예외 종류 : "+exception);
	%>
	</p>
</body>
</html>