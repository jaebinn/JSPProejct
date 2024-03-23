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
//로그아웃 클릭시 파라미터를 통해 로그아웃인지 여부 확인
	String logout = request.getParameter("logout");
   
	if(logout != null){
		//아이디에 널을 부여하고 세션 유효시간 없애기
				session.setAttribute("id", null);
				session.setMaxInactiveInterval(0);
	}
//세션을 통하여 아이디를 읽어들임 
	String id = (String)session.getAttribute("id");
//로그인이 되어 있지 않다면 session 값이 null처리를 해줌
 if(id == null){
 	id ="guest";
 }
%>
 		<!--Top  -->
 		<table width = "800"> 
 			<tr height="100">
			<!--로고 이미지  -->
				<td colspan = "2" align = "center" width= "200">
					<img alt = "" src = "images/1.png" width="200" height="70">
				</td>
				
				<td colspan = "4" align = "center">
					<font size= "10">낭만 캠핑 </font>
				</td>
			</tr>
			<tr height="50">
				<td width = "100" align = "center">텐트</td>
				<td width = "100" align = "center">의자</td>
				<td width = "100" align = "center">식기류</td>
				<td width = "100" align = "center">침낭</td>
				<td width = "100" align = "center">테이블</td>
				<td width = "200" align = "center"> 
		<%
				if(id.equals("guest")){
		%>
				<%=id %> 님 <button onclick="location.href ='sessionMain.jsp?center=sessionLoginForm.jsp'">로그인</button>
		<%	}else{ %>
				<%=id %> 님 <button onclick="location.href ='sessionMain.jsp?logout=1'">로그아웃</button>
				
				<%}%>
				</td>
			</tr>
		</table>
</body>
</html>