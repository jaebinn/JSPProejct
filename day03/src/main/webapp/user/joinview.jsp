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
	<%
		Object temp = session.getAttribute("check");
		String txt = "";
		String userid = "";
		if(temp == null){
			
		}
		else if(temp instanceof String){
			txt = "사용 가능한 아이디입니다.";
			userid = (String)temp;
	%>
			<script>
				window.onload = function(){ document.joinForm.userpw.focus(); }
			</script>
	<%
		}
		else if(temp instanceof Integer){
			txt = "중복된 아이디입니다.";
	%>
			<script>
				window.onload = function(){ document.joinForm.userid.focus(); }
			</script>
	<%
		}
		session.removeAttribute("check");
	%>
	<form name="joinForm" action="join_db.jsp" method="post">
		<fieldset>
			<legend>회원가입</legend>
			<p id="txt"><%=txt%></p>
			<p>
				<input name="userid" placeholder="아이디를 입력하세요" value="<%=userid%>">
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
		let userid = document.joinForm.userid.value;
		//checkId_db.jsp?userid=apple
		location.replace("checkId_db.jsp?userid="+userid);
		
		if(){}
	}
</script>
</html>




