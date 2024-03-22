<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO bdao = new BoardDAO();
	List<BoardDTO> list = bdao.getList();
	
	request.setAttribute("list", list);
	
	//select된 결과물을 request에 세팅해서 들고가는 경우에는
	//redirect가 아닌 forward 방식으로 페이지를 이동한다.	
	request.getRequestDispatcher("main.jsp").forward(request, response);
%>