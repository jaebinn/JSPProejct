<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_test3</title>
</head>
<body>
	<h2>JSTL 제어문(반복문)</h2>
	<c:forEach var="i" begin="1" end="10" step="1">
		<p id="pTag${i}"></p>
	</c:forEach>
	<hr>
	<c:set var="arData" value="<%=new int[]{10,20,30,40,50}%>"/>
	<c:forEach var="i" begin="0" end="${fn:length(arData) - 1}">
		${arData[i]}
	</c:forEach>
	<hr>
	<c:forEach var="data" items="${arData}">
		${data}
	</c:forEach>
	<hr>
	<%-- arData.length --> arData.getLength() : 사용 불가능 --%>
	<c:forEach var="i" begin="0" end="${fn:length(arData) - 1}">
		<c:set var="data" value="${arData[i]}"/>
		${i} : ${data}<br>
	</c:forEach>
	<hr>
	<%
		HashMap<String,Integer> map = new HashMap<>();
		map.put("하나",1);
		map.put("둘",2);
		map.put("셋",3);
		pageContext.setAttribute("map", map);
	%>
	<c:forEach items="${map}" var="entry">
		${entry.key} : ${entry.value }<br>
	</c:forEach>
</body>
</html>












