<%@page import="java.util.List"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String loginUser = (String)session.getAttribute("loginUser");
		List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("list");
		if(loginUser == null){
	%>
			<script>
				alert("로그인 후 이용하세요!");
				//자바스크립트로 페이지 이동하는 방법
				//location.href = "페이지 경로";
				//location.replace("페이지 경로");
				location.replace("loginview.jsp");
			</script>
	<%
		}
	%>
	<p><%=loginUser%>님 환영합니다</p>
	<a href="../user/logout.jsp">로그아웃</a>
	<hr>
	<div>
		<!--
			글쓰기 버튼 클릭시 게시판 작성 페이지로 이동
			게시글 제목, 게시글 내용 작성 후 [작성완료] 버튼 클릭
			데이터베이스에 작성된 게시글 데이터 하나 추가
			(게시글 제목-boardtitle, 게시글 내용-boardcontents, 작성시간-regdate, 게시글 작성자-userid)
		-->
		<a href="../board/boardwrite.jsp">글쓰기</a>
		<hr>
		<table border="">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<%for(BoardDTO board : list){ %>
				<tr>
					<td><%=board.getBoardnum() %></td>
					<!--
						게시글 제목 클릭 시 게시글을 보는 페이지(get.jsp)로 이동
						게시글 제목, 게시글 작성자, 게시글 작성일, 게시글 내용 네 가지 보여주기
						<hr>
						[목록보기] 버튼, 게시글이 로그인한 유저의 게시글이라면 [수정], [삭제] 버튼
						
						[수정] 버튼 클릭 시 게시글을 수정하는 페이지(modify.jsp)로 이동
						그 곳에 있는 [수정완료] 버튼 클릭 시 게시글 수정 후 메인으로 이동
						
						[삭제] 버튼 클릭 시 게시글을 삭제하며 메인으로 이동
					-->
					<td><a href="get.jsp?boardnum=<%=board.getBoardnum()%>"><%=board.getBoardtitle() %></a></td>
					<td><%=board.getUserid() %></td>
					<td><%=board.getRegdate() %></td>
				</tr>
			<%} %>
			</tbody>		
		</table>
	</div>
</body>
</html>








