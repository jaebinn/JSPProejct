<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardnum = Integer.parseInt(request.getParameter("boardnum"));

	BoardDAO bdao = new BoardDAO();
	BoardDTO board = bdao.findBoardByNum(boardnum);

	Gson gson = new Gson();
	
	JsonObject json = new JsonObject();
	
	json.add("board", gson.toJsonTree(board));
	
	out.print(gson.toJson(json));

%>