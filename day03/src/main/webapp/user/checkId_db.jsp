<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");

	UserDAO udao = new UserDAO();
	
	UserDTO temp = udao.findUserById(userid);
	
	if(temp == null){
		session.setAttribute("check", userid);
		//out.print("O");
	}
	else{
		session.setAttribute("check", 0);
		//out.print("X");
	}
	response.sendRedirect("joinview.jsp");

%>
