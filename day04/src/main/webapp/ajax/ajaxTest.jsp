<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest</title>
</head>
<body>
	<p id="result"></p>
	<input type="button" value="통신하기" onclick="f();">
</body>
<script>
	function f(){
		const xhr = new XMLHttpRequest();
		//console.log(xhr);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				console.log(xhr.responseText);
				document.getElementById("result").innerHTML = xhr.responseText;
				
			}
		}
		
		xhr.open("GET","test.txt");
		xhr.send();
	}
</script>
</html>






