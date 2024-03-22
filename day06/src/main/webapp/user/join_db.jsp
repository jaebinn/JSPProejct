<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 데이터 수집
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String username = request.getParameter("username");

	UserDTO user = new UserDTO();
	user.setUserid(userid);
	user.setUserpw(userpw);
	user.setUsername(username);
	
	//2. 처리
	UserDAO udao = new UserDAO();
	
	//3. 결과 전송, 흐름 제어
	if(udao.insertUser(user)){
		//성공 화면으로 이동
		Cookie cookie = new Cookie("joinid",userid);
		response.addCookie(cookie);
		response.sendRedirect("loginview.jsp");
	}
	else{
		//실패 화면으로 이동
		//response.sendRedirect("../error/error.jsp");
	}
%>










