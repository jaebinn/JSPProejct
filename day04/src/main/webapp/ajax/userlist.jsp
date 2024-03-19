<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tbody id="tbody">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
			</tr>
		</tbody>
	</table>
	<hr>
	<input type="button" value="데이터 불러오기" onclick="f()">
</body>
<script>
	function f(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					const obj = JSON.parse(xhr.responseText);
					const datas = obj.datas;
					console.log(datas[0]);
					
					const tbody = document.getElementById("tbody");
					let str = "";					
					for(let user of datas){
						str += "<tr>";
						str += "<td>"+user.userid+"</td>"
						str += "<td>"+user.userpw+"</td>"
						str += "<td>"+user.username+"</td>"
						str += "</tr>";
					}
					tbody.innerHTML += str;
				}
			}
			
		}
		
		xhr.open("GET","list_db.jsp");
		xhr.send();
	}
</script>
</html>









