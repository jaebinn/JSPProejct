<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test3</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>
	아이디 : ${param.id}<br>
	비밀번호 : ${param.pw}<br>
	<%-- <%=request.getParameterValues("hobby")[0] %> --%>
	취미 : ${paramValues.hobby[0]} / ${paramValues.hobby[1]}<br>
	이름 : ${param.name == null ? "이름 없음" : param.name}<br>
	<hr>
	today 쿠키값 : ${cookie.today.value}<br>
	coffee 쿠키값 : ${empty cookie.coffee.value ? "쿠키 없음" : cookie.coffee.value}<br>
</body>
</html>