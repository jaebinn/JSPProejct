<!--  로그인 jsp입니다.  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE HTML>

<html>
<head>
<title>EveryCare-Login</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="css/newstyle.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">

			<!-- Logo -->
			<div class="logo">
				<a href="index.jsp"><strong>&nbsp;&nbsp;&nbsp;EveryCare</strong>
					<span class="extra"></span></a>
			</div>



		</header>

		<!-- Section -->
		<section id="one" class="main alt">
			<header class="accent1">
				<div id="wrap" class="login">
					<form action="${cp}/userloginok.us" method="post" name="loginForm">
						<table>
							<tbody>
								<tr>
									<th>아이디</th>
									<td><input type="text" name="user_id"
										value="${cookie.joinid.value}"></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="pw"></td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="btn_area">
											<input type="submit" value="로그인">
										</div>

									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<a class="btn" href="user-join.jsp"><input type="submit"
						value="회원가입"></a>
				</div>
			</header>
		</section>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.selectorr.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/user.js"></script>
	<script>
		document.cookie = "joinid=; path=/;"
		window.setTimeout(function() {
			document.querySelector("#wrap.login+img").classList = "hdd";
			document.querySelector("#wrap.login").style.display = "block";
		}, 1300)

		xhr.onre = function() {

		}
		/* xhr.open("GET","boardlist.bo") */
	</script>

</body>
</html>