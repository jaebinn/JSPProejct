<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="cp" value="${pageContext.request.contextPath}"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<title>everycare</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				${expert}
				<!-- Header -->
					<header id="header" class="alt">

						<!-- Logo -->
							<div class="logo">
								<a href="${cp}/index.jsp"><strong>everycare</strong></a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul style="display:flex">
									<li class="current"><a href="${cp}/index.jsp">Home</a></li>
									<li><a href="${cp}/expertlist.ep">전문가매칭</a></li>
									<li>									
										<a href="${cp}/u_boardlist.ub" class="icon solid fa-angle-down" style="pointer-events: none;">게시판</a>
										<ul>
											<li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
											<li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
											<li><a href="${cp}">리뷰게시판</a></li>
										</ul>
									</li>
									<li class="mypage">
										<a href="${cp}/" class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
										<ul>
											<li class="mypage"><a href="${cp}/">유저 정보</a></li>
											<li class="expertpage"><a href="${cp}/">전문가 정보</a></li>
										</ul>
									</li>									
									<c:if test="${empty sessionScope.loginUser}">
									    <!-- 세션이 없을 때 (로그인되지 않은 상태) -->
									    <li><a href="${cp}/app/user/user-login.jsp"><input type="button" value="로그인" id="login_btn"></a></li>
									</c:if>
									<c:if test="${not empty sessionScope.loginUser}">
									    <!-- 세션이 있을 때 (로그인된 상태) -->
									    <li><a href="${cp}/app/expert/expertRegister.jsp"><input type="button" value="전문가등록" id="expert_btn"></a></li>
									    <li><a href="${cp}/app/user/user-logout.jsp"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									    <li><p id="login_user" style="font-weight:bold">${sessionScope.loginUser}님</p></li>
									</c:if>								
								</ul>
							</nav>

					</header>

				<!-- Banner -->
					<section id="banner">
						<div class="content primary">
							<header>
								<h2>당신의 가족이니까 <br />
								믿고 맡길 수 있게,</h1>
								<p>애브리케어가 여러분의 소중한 여정을 함께 합니다.</p>
							</header>
							<div class='typing'><h1 class="text"></h1></div>
							<ul class="actions special">							
								<li><a href="#one" class="button large wide scrolly">Learn more</a></li>
							</ul>
						</div>
						<div class="content secondary">
							<div class="inner">
								<div class="features">
									<section id="total-users">
									    <span class="icon fa-light fa-address-card major"></span>
									    <h3>총 가입자 수</h3>
									    <div class="count">0</div>
									</section>
									
									<section id="mates-count">
									    <span class="icon solid fa-users major"></span>
									    <h3>메이트 수</h3>
									    <div class="count1">0</div>
									</section>
									
									<section id="total-usage">
									    <span class="icon solidfa-regular fa-heart major"></span>
									    <h3>총 이용 건수</h3>
									    <div class="count2">0</div>
									</section>

								</div>
							</div>
							<div class="review">
								<h5>Review</h5>
								<div class="review-box">
									<div class="review-contents">
										<div class="review1">
											<h5>자녀보단 애브리케어를 불러 달라세요</h5>
											<p>직장과 먼 거리 때문에 방문하기가 힘든데 잘 도와주셔서 감사해요</p>
											<p>❤❤❤❤❤</p>
										</div>
										<div class="review2">
											<h5>자녀보단 애브리케어를 불러 달라세요</h5>
											<p>일년에 한번씩 내시경할때 항상 서비스 이용하고 있는데

												너무 좋고 감사한 서비스 입니다.
												
												올해도 잘 부탁드리겠습니다.</p>
											<p>❤❤❤❤</p>
										</div>
										<div class="review3">
											<h5>자녀보단 애브리케어를 불러 달라세요</h5>
											<p>병원동행서비스를 처음 받았는데요 친절하시고 환자가 안심할 수 있도록 잘해주시고 병원 진료 절차도 잘 알고 계셔서 많은 도움이 되었습니다.<br> 
												앞으로도 위드메이트 서비스 이용을 계속 신청할 예정입니다. <br>
												만족도 최고입니다!!!</p>
											<p>❤❤❤❤❤</p>
										</div>
										<div class="review1">
											<h5>자녀보단 애브리케어를 불러 달라세요</h5>
											<p>직장과 먼 거리 때문에 방문하기가 힘든데 잘 도와주셔서 감사해요</p>
											<p>❤❤❤❤❤</p>
										</div>
										<div class="review2">
											<h5>자녀보단 애브리케어를 불러 달라세요</h5>
											<p>일년에 한번씩 내시경할때 항상 서비스 이용하고 있는데

												너무 좋고 감사한 서비스 입니다.
												
												올해도 잘 부탁드리겠습니다.</p>
											<p>❤❤❤❤</p>
										</div>
										<div class="review3">
											<h5>자녀보단 애브리케어를 불러 달라세요</h5>
											<p>병원동행서비스를 처음 받았는데요 친절하시고 환자가 안심할 수 있도록 잘해주시고 병원 진료 절차도 잘 알고 계셔서 많은 도움이 되었습니다.<br> 
												앞으로도 위드메이트 서비스 이용을 계속 신청할 예정입니다. <br>
												만족도 최고입니다!!!</p>
											<p>❤❤❤❤❤</p>
										</div>
									</div>
								</div>
									<a href="#" class="button">More</a>
							</div>
						</div>


						<video src="https://cdn.pixabay.com/video/2022/08/28/129422-744370591_large.mp4" muted autoplay loop playsinline></video>
					</section>

				<!-- Section -->
					<section id="one" class="main">
						<header class="accent1">
							<h2>Best care Manager</h2>
							<p>'애브리케어'가 여러분을 위해 최선을 다해 돌봐드릴게요.</p>
						</header>
						<ul class="tabs">
							<li>
								<h3 id="best1"></h3>
								<div class="spotlight">
									<ul>
										<li>
											<h4>분야</h4>
											<p id="keyword_list1"></p>
										</li>
										<li>
											<h4>경력</h4>
											<p id="career_name1"></p>
										</li>
									</ul>
									<span class="image"><img src="https://i.pinimg.com/564x/20/b8/9c/20b89cfdf5297a973ae2a9803ae0d4be.jpg" alt="" /></span>
									<ul>
										<li>
											<h4>한 줄 소개</h4>
											<p id="resume1"></p>
										</li>
										<li>
											<h4>희망근무지역</h4>
											<p id="location1"></p>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<h3 id="best2"></h3>
								<div class="spotlight">
									<ul>
										<li>
											<h4>분야</h4>
											<p id="keyword_list2"></p>
										</li>
										<li>
											<h4>경력</h4>
											<p id="career_name2"></p>
										</li>
									</ul>
									<span class="image"><img src="https://i.pinimg.com/564x/a6/0f/42/a60f42eafff6589cc35c95bd6f7cae3e.jpg" alt="" /></span>
									<ul>
										<li>
											<h4>한 줄 소개</h4>
											<p id="resume2"></p>
										</li>
										<li>
											<h4>희망근무지역</h4>
											<p id="location2"></p>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<h3 id="best3"></h3>
								<div class="spotlight">
									<ul>
										<li>
											<h4>분야</h4>
											<p id="keyword_list3"></p>
										</li>
										<li>
											<h4>경력</h4>
											<p id="career_name3"></p>
										</li>
									</ul>
									<span class="image"><img src="https://i.pinimg.com/736x/1b/a0/b6/1ba0b69d92b079e303d4392b8e99fbeb.jpg" alt="" /></span>
									<ul>
										<li>
											<h4>한 줄 소개</h4>
											<p id="resume3"></p>
										</li>
										<li>
											<h4>희망근무지역</h4>
											<p id="career_name3"></p>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</section>
				<!-- Section -->
					<section id="two" class="main accent2">
						<header>
							<h2>당신의 일상이 무너질 때, 돌봄이 온다.</h2>
							<p> 재가돌봄 : 요양보호사가 이용자의 가정을 방문해 돌봄 및 일상 지원 서비스(세면, 옷 입기 등 활동 지원) 제공<br>
								가사지원 : 가정관리사, 홈 매니저가 이용자의 가정을 방문해 청소, 식사준비, 설거지 등의 가사서비스 제공<br>
								병원동행 : 이용자의 병원 이동, 접수 및 수납 절차 지원 등 서비스 제공</p>
						</header>
						<div class="inner">
							<span class="video main">
								<iframe width="850" height="500" src="https://www.youtube.com/embed/u9wbHJK0tjg?si=QOMQXRrsz0uXdhZ2&amp;controls=0&amp;muted=1&amp;autoplay=1&amp;loop=1&amp;playsinline=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen ></iframe>
							</span>

						</div>
					</section>
				<!-- Section -->
					<section id="three" class="main alt">
						<header>
							<h2>Latest news and updates</h2>	
						</header>
						<div class="inner">
							<div class="posts">
								<div>
									<article>
										<a href="#" class="image"><img src="https://s3.ap-northeast-2.amazonaws.com/withmate.photo/1698369994726" alt="" /></a>
										<div class="content">
											<h3>서대문 커넥티드 돌봄 시스템 대상자 모집</h3>
											<p>거동이 불편하여 병원 방문동행이 필요한 고객 -스마트폰 활용 역량 보유 고객 위주 [내과, 신경과, 정신과 우선 선발]</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</div>
									</article>
									<article>
										<div class="content">
											<h3>Amet euismod</h3>
											<p>Sed ligula vulputate et amet tristique cursus. Lorem nulla sed gravida non magna sed feugiat consequat.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</div>
									</article>
								</div>
								<div>
									<article>
										<div class="content">
											<h3>Sed amet feugiat</h3>
											<p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Lorem nulla sed gravida non.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</div>
									</article>
									<article>
										<a href="#" class="image"><img src="https://kcpass.or.kr/resources/component/daumeditor-7.4.27/images/upload/1704247356545.jpg" alt="" /></a>
										<div class="content">
											<h3>사회서비스 이용자 권익보호 지침서</h3>
											<p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Lorem nulla sed gravida non.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</div>
									</article>
								</div>
								<div>
									<article>
										<a href="#" class="image"><img src="https://kcpass.or.kr/resources/component/daumeditor-7.4.27/images/upload/1703661999163.jpg" alt="" /></a>
										<div class="content">
											<h3>사회복지시설 종사자 대체인력지원사업, 중앙사회서비스원으로 이관</h3>
											<p>거동이 불편하여 병원 방문동행이 필요한 고객 -스마트폰 활용 역량 보유 고객 위주 [내과, 신경과, 정신과 우선 선발]</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</div>
									</article>
									<article>
										<div class="content">
											<h3>Amet euismod</h3>
											<p>Sed ligula vulputate et amet tristique cursus. Lorem nulla sed gravida non magna sed feugiat consequat.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</div>
									</article>
								</div>
							</div>
						</div>
					</section>



		
					<div class="chat-container">
							<button id="chat-circle" class="icon solid fa-regular fa-comments major"></button>
					</div>
						<div id="chatbox" style="display: none;" >
							<div id="friendslist">
								<div id="topmenu">
									<span class="friends"></span>
									</div>
									
									<div id="friends">
									<div class="friend">
										<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<p>
											<strong>임은정</strong>
											</p>
											<div class="status available"></div>
										</div>
										
										<div class="friend">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<p>
											<strong>임은정</strong>
											</p>
											<div class="status away"></div>
										</div>
										
										<div class="friend">
										<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<p>
											<strong>임은정</strong>
											</p>
											<div class="status inactive"></div>
										</div>
										
										<div class="friend">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<p>
											<strong>임은정</strong>
											</p>
											<div class="status inactive"></div>
										</div>
										
										<div class="friend">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<p>
											<strong>임은정</strong>
											</p>
											<div class="status inactive"></div>
										</div>
										
										<div id="search">
										<input type="text" id="searchfield" value="Search" />
										</div>
										
									</div>                
									
								</div>  
								
								<div id="chatview" class="p1">      
									<div id="profile">
										<div id="close">
											<div class="cy"></div>
											<div class="cx"></div>
										</div>
										<p>임은정</p>
									</div>
									<div id="chat-messages">
									<label>Thursday 02</label>
										
										<div class="message">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<div class="bubble">
											안녕하세요
												<div class="corner"></div>
												<span>3 min</span>
											</div>
										</div>
										
										<div class="message right">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<div class="bubble">
												안녕하세요
												<div class="corner"></div>
												<span>1 min</span>
											</div>
										</div>
										
										<div class="message">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<div class="bubble">
												안녕하세요
												<div class="corner"></div>
												<span>Now</span>
											</div>
										</div>
										
										<div class="message right">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<div class="bubble">
												안녕하세요
												<div class="corner"></div>
												<span>1 min</span>
											</div>
										</div>
										
										<div class="message">
											<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
											<div class="bubble">
												안녕하세요
												<div class="corner"></div>
												<span>Now</span>
											</div>
										</div>
										
									</div>
								
									<div id="sendmessage">
									<input type="text" value="Send message..." />
										<button id="send"></button>
									</div>
								</div>        
							</div>  
						</div>
					</div>
			

					  
					
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
			<script src="${cp}/js/chat.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
        $(".loginLink").click(function () {
            window.location.href = "${cp}/app/user/user-login.jsp";
        });

        $(".logoutLink").click(function () {
            window.location.href = "${cp}/app/user/user-logout.jsp";
        });

        $("nav ul li:nth-child(4)").click(function () {
            if (${empty sessionScope.loginUser}) {
            	window.alert("로그인 후 이용해주세요!");
                window.location.href = "${cp}/app/user/user-login.jsp";
            }
        });
        $(".mypage").click(function () {
            if (${empty sessionScope.loginUser}) {
            	window.alert("로그인 후 이용해주세요!");
                window.location.href = "${cp}/app/user/user-login.jsp";
            }
        });
        $(".expertpage").click(function () {
            if (${empty sessionScope.loginUser}) {
            	window.alert("로그인 후 이용해주세요!");
                window.location.href = "${cp}/app/user/user-login.jsp";
            }
        });
    });
	const counter = ($counter, max) => {
		let now = max;
		
		const handle = setInterval(() => {
			$counter.innerHTML = Math.ceil(max - now);
			
			// 목표수치에 도달하면 정지
			if (now < 1) {
				clearInterval(handle);
			}
			
			// 증가되는 값이 계속하여 작아짐
			const step = now / 10;
			
			// 값을 적용시키면서 다음 차례에 영향을 끼침
			now -= step;
		}, 50);
	}

	window.onload = () => {
	    // 각 카운터에 대한 요소 선택
	    const $counter = document.querySelector(".count");
	    const $counter1 = document.querySelector(".count1");
	    const $counter2 = document.querySelector(".count2");
	    
	    // 서버에서 데이터 가져오기
	    fetch('/getjoincnt.us')
	        .then(response => response.json())
	        .then(data => {
	            // 서버에서 받은 데이터를 변수에 할당
	            const totalUsers = data.totalUsers;
	            const expertCount = data.expertCount;
	            const matchingCount = data.matchingCount;

	            // 각 카운터의 목표 수치 설정
	            const max = totalUsers; // 총 가입자 수의 목표 수치
	            const max1 = expertCount; // 메이트 수의 목표 수치
	            const max2 = matchingCount; // 총 이용 건수의 목표 수치
				console.log(max);
				console.log(max1);
				console.log(max2);
	            // 카운터 함수 호출
	            setTimeout(() => counter($counter, max), 800); // 총 가입자 수 카운트
	            setTimeout(() => counter($counter1, max1), 900); // 메이트 수 카운트
	            setTimeout(() => counter($counter2, max2), 1000); // 총 이용 건수 카운트
	        })
	        .catch(error => console.error('Error fetching data:', error));
	}
	// Ajax 요청 생성
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/getexpertinfo.ep', true);

	// 서버 응답 처리
	xhr.onload = function() {
    if(xhr.readyState == 4){
        if(xhr.status == 200){
            var response = JSON.parse(xhr.responseText);
            // 전문가 정보를 각각의 요소에 할당
            console.log(response[0].name);
            var best1 = document.querySelector("#best1");
            best1.innerHTML = response[0].name;

            var keywordList1 = document.querySelector("#keyword_list1");
            keywordList1.innerHTML = response[0].keyword_list;

            var careerName1 = document.querySelector("#career_name1");
            careerName1.innerHTML = response[0].career_name;

            var resume1 = document.querySelector("#resume1");
            resume1.innerHTML = response[0].resume;

            var location1 = document.querySelector("#location1");
            location1.innerHTML = response[0].location;
            
            var best1 = document.querySelector("#best2");
            best1.innerHTML = response[1].name;

            var keywordList1 = document.querySelector("#keyword_list2");
            keywordList1.innerHTML = response[1].keyword_list;

            var careerName1 = document.querySelector("#career_name2");
            careerName1.innerHTML = response[1].career_name;

            var resume1 = document.querySelector("#resume2");
            resume1.innerHTML = response[1].resume;

            var location1 = document.querySelector("#location2");
            location1.innerHTML = response[0].location;
            
            var best1 = document.querySelector("#best3");
            best1.innerHTML = response[0].name;

            var keywordList1 = document.querySelector("#keyword_list3");
            keywordList1.innerHTML = response[2].keyword_list;

            var careerName1 = document.querySelector("#career_name3");
            careerName1.innerHTML = response[2].career_name;

            var resume1 = document.querySelector("#resume3");
            resume1.innerHTML = response[2].resume;

            var location1 = document.querySelector("#location3");
            location1.innerHTML = response[2].location;
            
        } else {
            console.error(xhr.statusText); // 요청이 실패한 경우 에러 메시지 출력
        }
    }
};
//요청 보내기
xhr.send();

</script>

</body>
</html>

	