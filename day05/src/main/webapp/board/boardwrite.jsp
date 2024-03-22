<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardwrite</title>
</head>
<body>
	<form action="write_db.jsp" method="post">
		<p>
			제목 <input type="text" name="boardtitle">
		</p>
		<p>
			작성자 <input type="text" name="userid" value="<%=session.getAttribute("loginUser")%>" readonly>
		</p>
		<p>
			내용 <textarea name="boardcontents"></textarea>
		</p>
		<p>
			<input type="submit" value="작성완료">
		</p>
	</form>
</body>
</html>