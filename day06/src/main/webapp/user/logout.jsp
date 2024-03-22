<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("loginUser", null);
	//session.removeAttribute("loginUser");
	session.invalidate();
%>
<script>
	alert("다음에 꼭 다시 오세요...☆");
	location.replace("loginview.jsp");
</script>