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
								<th>지도</th>
								<td><div id="map" style="width:300px; height:300px"></div></td>
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
								<c:choose>
								    <c:when test="${expert.is_drivable}">
								        <td>가능</td>
								    </c:when>
								    <c:otherwise>
								        <td>불가능</td>
								    </c:otherwise>
								</c:choose>														
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

					<div class="analytics" data-expert_idx="${expert.expert_idx}">
						<div class="data">
							  <i class="fa-regular fa-heart toggle"></i>
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
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23697895f1f73fcadc63e0aa3f1d0bf9"></script>
			<script>

			$(document).ready(function () {
			    $('.analytics .data').click(function () {
			        let heart = $(this).find('.toggle');
			        let like_cnt = parseInt($(this).find('span').text());
			        let expert_idx = $('.analytics').data('expert_idx');

			        
			        // 하트 클래스 토글 및 색상 변경
			        heart.toggleClass('fa-regular fa-heart fa-solid fa-heart');
			        if (heart.hasClass('fa-solid')) {
			            heart.css('color', 'red');
			            // 좋아요 숫자 증가
			            like_cnt++;
			        } else {
			            heart.css('color', '');
			            // 좋아요 숫자 감소
			            like_cnt--;
			        }

			        $(this).find('span').text(like_cnt);
			        
			        $.ajax({
			            type: "POST",
			            url: cp+"/expertlikecnt.ep", 
			            data: { expert_idx: expert_idx, like_cnt: like_cnt },			            
			            success: function(response) {
			                console.log("좋아요 숫자 업데이트 성공");
			            },
			            error: function(xhr, status, error) {
			                console.error("좋아요 숫자 업데이트 실패: " + error);
			            }
			        });
			    });
			});
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
			
			var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			marker.setMap(map);
			</script>
	</body>
</html>