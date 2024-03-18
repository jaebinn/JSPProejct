<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String username = request.getParameter("username");

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/gb";
		String user = "root";
		String password = "rootroot";
		
		Connection conn = DriverManager.getConnection(url, user, password);
		String sql = "insert into user values(?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, userid);
		ps.setString(2, userpw);
		ps.setString(3, username);
		
		int result = ps.executeUpdate();
		
		if(result == 1){
			//성공 화면으로 이동
			Cookie cookie = new Cookie("joinid",userid);
			response.addCookie(cookie);
			response.sendRedirect("loginview.jsp");
		}
		else{
			//실패 화면으로 이동
			//response.sendRedirect("../error/error.jsp");
		}
	}
	catch(Exception e){

	}
%>










