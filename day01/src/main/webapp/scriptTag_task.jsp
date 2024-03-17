<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag_task</title>
<style>
	.even_row{
		background-color: deeppink;
	}
	.odd_row{
		background-color: deepskyblue;
	}
	.even_col{
		color:white;
	}
	.odd_col{
		color:blue;
	}
</style>
</head>
<body>
	<h2>scriptTag_task</h2>
	<!--
		[1행 1열][1행 2열][1행 3열][1행 4열][1행 5열]
		[2행 1열][2행 2열][2행 3열][2행 4열]
		[3행 1열][3행 2열][3행 3열]
		[4행 1열][4행 2열]
		[5행 1열]
	-->
	<table border="1">
		<tbody>
			<%for(int i=1;i<=5;i++){ %>
				<tr>
					<%for(int j=1;j<=6-i;j++){ %>
						<td><%=i %>행 <%=j %>열</td>
					<%} %>
				</tr>
			<%} %>
		</tbody>
	</table>
	<!--
		[1행 1열]
		[2행 1열][2행 2열]
		[3행 1열][3행 2열][3행 3열]
		[4행 1열][4행 2열][4행 3열][4행 4열]
		[5행 1열][5행 2열][5행 3열][5행 4열][5행 5열]
		
		[6행 1열][6행 2열][6행 3열][6행 4열]
		[7행 1열][7행 2열][7행 3열]
		[8행 1열][8행 2열]
		[9행 1열]
	-->
	<table border="1">
		<tbody>
			<%for(int i=1;i<=5;i++){ %>
				<tr>
					<%for(int j=1;j<=i;j++){ %>
						<td><%=i %>행 <%=j %>열</td>
					<%} %>
				</tr>
			<%} %>
			<%for(int i=6;i<=9;i++){ %>
				<tr>
					<%for(int j=1;j<=10-i;j++){ %>
						<td><%=i %>행 <%=j %>열</td>
					<%} %>
				</tr>
			<%} %>
		</tbody>
	</table>
	
	<!-- 2번째 문제의 표를 짝수행은 배경색을 deeppink, 홀수행은 배경색을 deepskyblue
		짝수열은 글자색을 white, 홀수열은 글자색을 blue
	 -->

 	<table border="1">
		<tbody>
			<%for(int i=1;i<=5;i++){ %>
				<tr class="<%=i%2==0?"even_row":"odd_row"%>">
					<%for(int j=1;j<=i;j++){ %>
						<td class="<%=j%2==0?"even_col":"odd_col"%>"><%=i %>행 <%=j %>열</td>
					<%} %>
				</tr>
			<%} %>
			<%for(int i=6;i<=9;i++){ %>
				<tr class="<%=i%2==0?"even_row":"odd_row"%>">
					<%for(int j=1;j<=10-i;j++){ %>
						<td class="<%=j%2==0?"even_col":"odd_col"%>"><%=i %>행 <%=j %>열</td>
					<%} %>
				</tr>
			<%} %>
		</tbody>
	</table>
	<hr>
	 <input type="radio" <%=true?"checked":""%>>
	 <input type="radio" <%=false?"checked":""%>>
	 <%if(false){ %>
	 	<button>안녕</button>
	 <%}%>
	<!--
		tableMaker.jsp 만들어서 행과 열 개수 입력받고 폼을 제출한 후 해당 크기대로 표 만들기
	-->
</body>
</html>








