<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>에브리케어</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cp}/css/main.css" />
		<link rel="stylesheet" href="${cp}/css/expert_list.css" />
		<link rel="stylesheet" href="${cp}/css/expert_view.css" />
		
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">

						<!-- Logo -->
							<div class="logo">
								<a href="index.html"><strong>EveryCare</strong> </a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li>
										<a href="#" class="icon solid fa-angle-down">내정보</a>
										<ul>
											<li><a href="#"></a></li>
											<li><a href="#">Option Two</a></li>
											<li><a href="#">Option Three</a></li>
											<li>
												<a href="#">Submenu</a>
											</li>
										</ul>
									</li>
									<li><a href="generic.html">전문가 찾기</a></li>
									<li><a href="login.html"><input type="button" value="로그인" id="login_btn"></a></li>
									<li><a href="logout.html"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									<li><a href="login.html"><input type="button" value="전문가등록" id="expert_btn"></a></li>		
								</ul>
							</nav>
					</header>

				<section class="main">
                    <div class="content">
                        <div class="profile">
					        <div class="profile-picture">
					            <img src="${cp}/images/profile.png" alt="Profile Picture">
					        </div>
					        <div class="profile-details">
					            <h2>${expert.name}</h2>
					            <p><strong>나이:</strong> ${expert.age}</p>
					            <p><strong>가능 지역:</strong> ${expert.location}</p>
					            <p><strong>가격:</strong> ${expert.cost}</p>
					            <p><strong>가능 시간:</strong> ${expert.available_time}</p>
					            <p><strong>경력 소개:</strong> ${expert.career_name}</p>				           
					        </div>
					    </div>
                    </div>
                </section>
				
				<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<section>
							<h3>EveryCare</h3>
							<p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해 사용자들이 안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
							<ul class="icons">
								<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
							</ul>
						</section>
						<section class="narrow">
							<h4>EveryCare SNS</h4>
							<ul class="links">
								<li><a href="#">인스타그램</a></li>
								<li><a href="#">페이스북</a></li>
								<li><a href="#">유튜브</a></li>
							</ul>
						</section>
						<section class="narrow">
							<h4>EveryCare 오픈채팅</h4>
							<ul class="links">
								<li><a href="#">링크</a></li>
								<li><a href="#">Vulputate tristique</a></li>
								<li><a href="#">Ultrices nulla</a></li>
								<li><a href="#">Cursus sed magna</a></li>
								<li><a href="#">Sed lectus donec</a></li>
							</ul>
						</section>
						<section>
							<h3>고객센터</h3>
							<p>EveryCare 고객센터는 여러분의 궁금증이나 문의사항에 친절하고 신속하게 대응해 드립니다. 저희 팀은 24시간 365일 연중무휴로 운영되며, 다음과 같은 서비스를 제공합니다.<p>
							<p><a href="#" class="major">(000) 000-0000</a></p>
						</section>
					</div>
					<div class="copyright">
						<p>&copy; EveryCare. All rights reserved.</p>
					</div>
				</footer>

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
	</body>
</html>