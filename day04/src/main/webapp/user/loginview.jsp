<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginview</title>
</head>
<body>
	<%
		String userid = "";
		String check = request.getHeader("Cookie");
		if(check != null){
			Cookie[] cookies = request.getCookies();
			
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("joinid")){
					userid = cookie.getValue();
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		
		if(!userid.equals("")){
	%>
			<script>
				alert("<%=userid%>님 회원가입을 축하드립니다!")
				window.onload = function(){
					document.loginForm.userpw.focus();
				}
			</script>
	<%
		}
		else{
	%>
			<script>
				window.onload = function(){
					document.loginForm.userid.focus();
				}
			</script>
	<%
		}
		
		String l = request.getParameter("l");
		if(l != null && l.equals("f")){
	%>
			<script>
				alert("로그인 실패! 다시 시도하세요!");
			</script>
	<%
		}
	%>
	<!-- 로그인 성공시 main.jsp로 이동 / 실패시 다시 loginview.jsp로 돌아오기 -->
	<form name="loginForm" action="login_db.jsp" method="get">
		<input name="userid" placeholder="아이디를 입력하세요" value="<%=userid%>"><br>
		<input name="userpw" type="password" placeholder="비밀번호를 입력하세요"><br>
		<input type="submit" value="로그인">
	</form>
</body>
<script>
	document.loginForm.userid.focus();
</script>
</html>


