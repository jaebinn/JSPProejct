<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag3</title>
</head>
<body>
	<h2>scriptTag3</h2>
	<p>
		NOW : <%=new java.util.Date() %>
	</p>
	<table border="1">
		<tbody>
		<%
			for(int i=0;i<3;i++){
		%>
				<tr>
				<%
					for(int j=0;j<5;j++){
				%>
						<td><%=i+1 %>행 <%=j+1 %>열</td>
				<%
					}
				%>
				</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>








