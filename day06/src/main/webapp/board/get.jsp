<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get</title>
</head>
<body>
	<%
		String loginUser = (String)session.getAttribute("loginUser");
	%>
	<h2 id="title"></h2>
	<h3 id="userid"></h3>
	<h3 id="regdate"></h3>
	<textarea readonly id="contents"></textarea>
	<hr>
	<div id="btn_area">
		<a href="list_db.jsp">목록보기</a>
	</div>
</body>
<script>
	window.onload = function(){
		const loginUser = "<%=loginUser%>"
		const boardnum = <%=request.getParameter("boardnum")%>;
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					const json = JSON.parse(xhr.responseText);
					const board = json.board;
					
					document.getElementById("title").innerHTML = board.boardtitle;
					document.getElementById("userid").innerHTML = board.userid;
					document.getElementById("regdate").innerHTML = board.regdate;
					document.getElementById("contents").value = board.boardcontents;
					
					if(loginUser == board.userid){
						const btn_area = document.getElementById("btn_area");
						
						btn_area.innerHTML += '<a href="modify.jsp?boardnum='+boardnum+'">수정</a> '
						btn_area.innerHTML += '<a href="remove_db.jsp?boardnum='+boardnum+'">삭제</a>'
					}
				}
			}
		}
		
		xhr.open("GET","get_db.jsp?boardnum="+boardnum);
		xhr.send();
	}

</script>
</html>





