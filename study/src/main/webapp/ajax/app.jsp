<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
<script>
	const xhr = new XMLHttpRequest();
	
	xhr.onload = function(){
		console.log("It LOADED!!");
		const data = JSON.parse(xhr.responseText);
		console.log(data.name, data.height);
		
	}
	xhr.onerror = function(){
		console.log("ERROR...")
		
	}
	
	xhr.open("GET", "https://swapi.dev/api/people/1/");
	xhr.send();
</script>
</html>