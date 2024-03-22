<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int boardnum = Integer.parseInt(request.getParameter("boardnum"));
	BoardDAO bdao = new BoardDAO();
	BoardDTO board = bdao.findBoardByNum(boardnum);
%>
<body>
	<form name="modifyForm" action="modify_db.jsp" method="post">
		<input type="hidden" name="boardnum" value="<%=board.getBoardnum()%>">
		<input type="text" name="boardtitle" value="<%=board.getBoardtitle()%>">
		<h3><%=board.getUserid()%></h3>
		<textarea name="boardcontents"><%=board.getBoardcontents()%></textarea>
	</form>
	<hr>
	<div id="btn_area">
		<a href="list_db.jsp">목록보기</a>
		<a href="javascript:document.modifyForm.submit()">수정완료</a>
	</div>
</body>
</html>








