<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="myErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directiveTag</title>
</head>
<body>
	<h2>directiveTag</h2>
	<p>
		NOW : <%=new Date() %>
	</p>
	<%
		String str = null;
		str.charAt(1);
	%>
</body>
</html>