<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h2>세션 로그인 처리 1</h2>
<%
//사용자로부터 데이터를 읽어드림 
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");
	
	//세션을 이용한 데이터 처리//아이디와 패스워드 저장
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	//세션 유효시간 
	session.setMaxInactiveInterval(60 *2);
	
	response.sendRedirect("sessionMain.jsp");
%>
	</center>
</body>
</html>