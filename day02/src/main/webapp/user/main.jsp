<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 1. 로그인 하지 않고 main.jsp로 왔을 때 --%>
	<%--
		alert으로 "로그인 후 이용하세요!" 띄운 후 loginview.jsp로 이동(자바스크립트 페이지 이동)
	 --%>
	 
	<%-- 2. 로그인 후 main.jsp로 왔을 때
		아래 화면 띄우기
	--%>
	<%
		String loginid = "";
		String check = request.getHeader("Cookie");
		if(check != null){
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("l")){
					loginid = cookie.getValue();
				}
			}
		}

		if(loginid.equals("")){
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
		<p><%=loginid%>님 환영합니다</p>
		<a href="">로그아웃</a>
	<%
		}
	%>
</body>
</html>








