<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	UserDAO udao = new UserDAO();
	UserDTO temp = udao.findUserById(userid);
	if(temp != null){
		if(temp.getUserpw().equals(userpw)){
			session.setAttribute("loginUser", userid);
			response.sendRedirect("main.jsp");
		}
		else{
			response.sendRedirect("loginview.jsp?l=f");
		}
	}
	else{
		response.sendRedirect("loginview.jsp?l=f");
	}
%>
