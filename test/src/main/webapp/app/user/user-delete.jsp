<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>everycare</title>
<link rel="icon" href="${cp}/images/everycare.ico" />
<link rel="stylesheet" href="${cp}/css/newstyle.css" />
</head>
<body>
	<div id="wrapper">

		<!-- Header -->
		<header id="header">

			<!-- Logo -->
			<div class="logo">
				<a href="${cp}/index.jsp"><strong>&nbsp;&nbsp;&nbsp;everycare</strong>
					<span class="extra"></span></a>
			</div>

		</header>

		<!-- Section -->
		<section id="one" class="main alt">
			<header class="accent1">
				<div id="wrap" class="delete_user">
					<form action="${cp}/userdeleteok.us" method="post" name="joinForm">
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="user_id"
									value="${loginUser}" placeholder="아이디를 입력하세요"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="btn_area">
										<input type="submit" value="회원탈퇴" >
									</div>

								</td>
							</tr>
						</tbody>
					</table>
					</form>
					
				</div>
			</header>
		</section>
	</div>

</body>
<script src="${cp}/js/user.js"></script>
<script src="${cp}/js/user.js"></script>
<script>
function delete_user(){
	
	/*const User_id = document.joinForm.user_id;
	const User_pw = document.joinForm.pw;*/
	
	if(confirm("탈퇴하시겠습니까??")){
		alert("정상적으로 탈퇴처리 되었습니다.");
	}else{
		alert("탈퇴처리에 실패했습니다");
	}

	
}
</script>
</html>
<!-- onclick="delete_user" -->
