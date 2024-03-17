<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCookie</title>
</head>
<body>
	<%
		String check = request.getHeader("Cookie");
		
		if(check != null){
			Cookie[] cookies = request.getCookies();
			
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("matdongsan")){
					//초단위로 지정하고, 음수를 입력하면 브라우저 종료시 쿠키 삭제(default)
					//유효기간 한달
					//cookie.setMaxAge(60*60*24*30);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	%>
</body>
</html>





