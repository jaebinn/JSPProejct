<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String loginUser = (String)session.getAttribute("loginUser");

		if(loginUser == null){
	%>
			<script>
				alert("로그인 후 이용하세요!");
				//자바스크립트로 페이지 이동하는 방법
				//location.href = "페이지 경로";
				//location.replace("페이지 경로");
				location.replace("loginview.jsp");
			</script>
	<%
		}
		else{
	%>
		<p><%=loginUser%>님 환영합니다</p>
		<a href="logout.jsp">로그아웃</a>
	<%
		}
	%>
</body>
</html>








