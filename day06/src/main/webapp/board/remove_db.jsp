<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardnum = Integer.parseInt(request.getParameter("boardnum"));

	BoardDAO bdao = new BoardDAO();
	if(bdao.deleteBoardByNum(boardnum)){
		out.print("<script>");
		out.print("alert('"+boardnum+"번 게시글 삭제!');");
		out.print("location.replace('list_db.jsp');");
		out.print("</script>");
	}
	else{
		
	}
%>