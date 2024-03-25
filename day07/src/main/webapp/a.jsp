<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 입력, 데이터 전송 -->
	<form action="b">
		숫자 1 <input type="text" name="num1"><br>
		숫자 2 <input type="text" name="num2"><br>
		<input type="submit">
	</form>
	<hr>
	<a href="${pageContext.request.contextPath}/test1.ts">테스트 1</a><br>
	<a href="${pageContext.request.contextPath}/test2.ts">테스트 2</a><br>
	<hr>
	<a href="${pageContext.request.contextPath}/test/3">테스트 3</a><br>
	<a href="${pageContext.request.contextPath}/test/4">테스트 4</a><br>
</body>
</html>







