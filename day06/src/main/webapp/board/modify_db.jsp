<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int boardnum = Integer.parseInt(request.getParameter("boardnum"));
	String boardtitle = request.getParameter("boardtitle");
	String boardcontents = request.getParameter("boardcontents");
	
	BoardDTO board = new BoardDTO();
	board.setBoardnum(boardnum);
	board.setBoardtitle(boardtitle);
	board.setBoardcontents(boardcontents);
	
	BoardDAO bdao = new BoardDAO();
	if(bdao.updateBoard(board)){
		response.sendRedirect("get.jsp?boardnum="+boardnum);
	}
	else{
		
	}
%>





