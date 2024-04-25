<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("loginUser", null);
	session.removeAttribute("loginUser");
	session.invalidate();
%>

<script>
	alert("로그아웃 되었습니다.");
	location.replace("/index.jsp");
</script>