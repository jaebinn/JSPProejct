<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinview</title>
<style>
	#txt{
		height: 21px;
	}
</style>
</head>
<body>
	<form name="joinForm" action="join_db.jsp" method="post">
		<fieldset>
			<legend>회원가입</legend>
			<p id="txt"></p>
			<p>
				<input name="userid" placeholder="아이디를 입력하세요">
				<input type="button" value="중복체크" onclick="checkId()">
			</p>
			<p>
				<input name="userpw" type="password" placeholder="비밀번호를 입력하세요">
			</p>
			<p>
				<input name="username" placeholder="이름을 입력하세요">
			</p>
			<p>
				<input type="submit" value="회원가입">
			</p>
		</fieldset>
	</form>
</body>
<script>
	function checkId(){
		const userid = document.joinForm.userid;
		const txtTag = document.getElementById("txt");
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					let txt = xhr.responseText;
					txt = txt.trim();
					if(txt == "O"){
						txtTag.innerHTML = "사용할 수 있는 아이디입니다!";
						userid.style.borderColor = "green";
						document.joinForm.userpw.focus();
					}
					else{
						txtTag.innerHTML = "중복된 아이디가 있습니다!";
						userid.style.borderColor = "red";
						userid.value = "";
						userid.focus();
					}
				}
			}
		}
		//1. GET 방식
		/*
		xhr.open("GET","checkId_db.jsp?userid="+userid.value);
		xhr.send();
		*/
		
		//2. POST 방식
		xhr.open("POST","checkId_db.jsp");
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
		xhr.send("userid="+userid.value);
	}
</script>
</html>




