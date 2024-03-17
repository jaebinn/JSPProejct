<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateCookie</title>
</head>
<body>
	<%
		String check = request.getHeader("Cookie");
		
		if(check != null){
			Cookie[] cookies = request.getCookies();
			
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("matdongsan")){
					cookie.setValue("dont_eat");
					response.addCookie(cookie);
				}
			}
		}
	%>
</body>
</html>





