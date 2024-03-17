<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag2</title>
</head>
<body>
	<h2>scriptTag2</h2>
	<!-- HTML 주석은 컴파일이 모두 되고 나서 화면으로 표현될 때 페이지에서 감춰지는 형태이다. 따라서 내부 내용들이 전부 실행된다. -->
	<%-- JSP 주석은 안에 작성된 모든 코드가 서블릿으로 변환될 때 주석처리 된다.(무시된다) JSP 주석을 권장한다. --%>
	
	<%! String className = "btn"; %>
	<%-- <%
		for(int i=0;i<10;i++){
			//<a class='btn0'>버튼</a>
			out.print("<a class='"+className+i+"'>버튼</a>");
		}
	%> --%>
	<%
	for(int i=0;i<10;i++){
	%>
		<a class="<%=className+i%>">버튼</a>
	<%
	}
	%>
</body>
</html>







