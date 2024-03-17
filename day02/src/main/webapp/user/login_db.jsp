<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");

	Connection conn = getConnection();

	String sql = "select * from user where userid=? and userpw=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, userid);
	ps.setString(2, userpw);
	
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		Cookie cookie = new Cookie("l",userid);
		response.addCookie(cookie);
		response.sendRedirect("main.jsp");
	}
	else{
		response.sendRedirect("loginview.jsp?l=f");
	}
%>










