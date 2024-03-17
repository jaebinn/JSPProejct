<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag1</title>
</head>
<body>
	<h2>scriptTag1</h2>
	<%!
		int count = 3;
		String sayHello(String data){
			return "Hello "+data;
		}
	%>
	<%=sayHello("JSP")%>
	<hr>
	<%
		for(int i=0;i<count;i++){
			//out 객체 : 웹 페이지의 화면을 구현하기 위한 JSP의 내장 객체
			out.print(sayHello("JSP")+"<br>");
		}
	%>
</body>
</html>








