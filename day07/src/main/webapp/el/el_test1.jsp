<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test1</title>
</head>
<body>
	<%-- <%=10+20%> --%>
	\${10+20} : ${10+20}<br>
	\${10>20} : ${10>20}<br>
	<%
		String data = "Hello";
		pageContext.setAttribute("data", "Hello");
		request.setAttribute("data", "Bye");
		session.setAttribute("data", "신기하다");
	%>
	<hr>
	<%--
		아래의 ${data}의 data라는 이름은 변수명을 의미하는 것이 아니라
		setAttribute() 할 때의 Key값을 의미한다. 아래는 세팅되어 있는 attribute를 찾는 우선순위
		
		pageContext -> request -> session -> application
	--%>
	<%-- <%=data%> --%>
	<%=pageContext.getAttribute("data")%> / ${data}<br>
	\${data} : ${data}<br>
	\${requestScope.data} : ${requestScope.data}<br>
	\${sessionScope.data} : ${sessionScope.data}<br>
</body>
</html>








