<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>에브리케어</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
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
					<!--프로필  -->
				<section class="profile-card">
					<div class="image">
						<img src="./images/profile.png" alt="" class="profile-img">
					</div>

					<div class="text-data">
						<span class="name">${expert.name}</span>
						<span class="age">나이: ${expert.age}</span>
						<table>							
							<tr>
								<th>가능시간:</th>
								<td>${expert.available_time}</td>
							</tr>
							<tr>
								<th>가능지역:</th>
								<td>${expert.location}</td>
							</tr>
							<tr>
								<th>시간당 요금:</th>
								<td>${expert.cost}</td>
							</tr>
							<tr>
								<th>분야:</th>
								<td>${expert.keyword_list}</td>
							</tr>
							<tr>
								<th>운전여부:</th>
								<td>${expert.is_drivable}</td>
							</tr>
							<tr>
								<th>계좌번호:</th>
								<td>${expert.account}</td>
							</tr>
							<tr>
								<th>경력:</th>
								<td>${expert.career_name}</td>
							</tr>
							<tr>
								<th>자기소개:</th>
								<td>${expert.resume}</td>
							</tr>
						</table>
					</div>

					<div class="media-buttons">
						<a href="#" style="background: #4267b2;" class="link">
							<i class="fa-brands fa-facebook"></i>
						</a>
						<a href="#" style="background: #1da1f2;" class="link">
							<i class="fa-brands fa-twitter"></i>
						</a>
						<a href="#" style="background: #e1306c;" class="link">
							<i class="fa-brands fa-instagram"></i>
						</a>
						<a href="#" style="background: #ff0000;" class="link">
							<i class="fa-brands fa-youtube"></i>
						</a>
					</div>

					<div class="chat_btn">
						<button class="chating">1:1 채팅하기</button>
					</div>

					<div class="analytics">
						<div class="data">
							  <i class="fa-regular fa-heart toggle" onclick="toggleLike(${expert.expert_idx}, ${expert.like_cnt})"></i>
							<span>${expert.like_cnt}</span>					
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
			<script> const cp = '${cp}';</script>
			<script src="${cp}/js/jquery.min.js"></script>
			<script src="${cp}/js/jquery.dropotron.min.js"></script>
			<script src="${cp}/js/jquery.selectorr.min.js"></script>
			<script src="${cp}/js/jquery.scrollex.min.js"></script>
			<script src="${cp}/js/jquery.scrolly.min.js"></script>
			<script src="${cp}/js/browser.min.js"></script>
			<script src="${cp}/js/breakpoints.min.js"></script>
			<script src="${cp}/js/util.js"></script>
			<script src="${cp}/js/main.js"></script>
			<script>
				$(document).ready(function () {
			        $('.analytics .data').click(function () {
			            let heart = $(this).find('.toggle');
			            heart.toggleClass('fa-regular fa-heart fa-solid fa-heart');
			            if (heart.hasClass('fa-solid')) {
			                heart.css('color', 'red'); 
			            } else {
			               heart.css('color', ''); 
			            }
			        });
			    });
				function toggleLike(expertIdx, currentLikeCount) {
				    // AJAX를 사용하여 서버에 요청을 보냄
				    $.ajax({
				        url: '${cp}/expertlikecnt.ep', // 좋아요 증가 또는 감소를 처리하는 서블릿 URL
				        method: 'POST',
				        data: { expert_idx: expertIdx, like_cnt: currentLikeCount }, // 전달할 데이터: 전문가 인덱스와 현재 좋아요 수
				        success: function(response) {
				            // 서버로부터 성공적인 응답을 받으면 좋아요 수 업데이트
				            $('#likeCount').text(response.newLikeCount); // 업데이트된 좋아요 수를 표시
				        }
				    });
				}
			</script>
	</body>
</html>