<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p id=txt></p>
	<input type="button" value="통신하기" onclick="f()">
</body>
<script>
	function f(){
		const xhr = new XMLHttpRequest();
		console.log(xhr);
		
		//onreadystatechange는 서버에서 응답이 도착하면 특정한 자바스크립트를 호출하는 것
		//XMLHttp의 상태(readystate)가 변경될 때마다(onchange)라는 의미
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					console.log(xhr.responseText);
					document.getElementById("txt").innerHTML = xhr.responseText;
				}
			}
		}
		
		xhr.onerror = function(){
			console.log("에러입니다...");
		}
		
		
		xhr.open("GET", "test.txt");
		xhr.send();
	}
	
</script>
</html>