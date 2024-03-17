<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection getConnection(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/gb";
			String user = "root";
			String password = "rootroot";
	
			Connection conn = DriverManager.getConnection(url, user, password);
			return conn;
		}
		catch(Exception e){
			System.out.println("DB 연결 실패!");
		}
		return null;
	}
%>
