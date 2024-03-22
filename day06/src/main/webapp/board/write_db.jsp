<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String boardtitle = request.getParameter("boardtitle");
	String boardcontents = request.getParameter("boardcontents");
	String userid = request.getParameter("userid");
	
	BoardDTO board = new BoardDTO();
	board.setBoardtitle(boardtitle);
	board.setBoardcontents(boardcontents);
	board.setUserid(userid);
	
	BoardDAO bdao = new BoardDAO();
	
	if(bdao.insertBoard(board)){
		response.sendRedirect("list_db.jsp");
	}
	else{
		response.sendRedirect("boardwrite.jsp");
	}
%>


