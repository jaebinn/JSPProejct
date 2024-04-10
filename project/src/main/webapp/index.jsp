<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
	<head>
		<title>everycare</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cp}/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">

						<!-- Logo -->
							<div class="logo">
								<a href="#"><strong>everycare</strong> <span class="extra">by 3</span></a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="current"><a href="index.html">Home</a></li>
									<li>
										<a href="#" class="icon solid fa-angle-down">Notice</a>
										<ul>
											<li><a href="#">Q&A</a></li>
											<li><a href="${cp}/expertlist.ep">전문가매칭</a></li>
											<li><a href="#">Review</a></li>
										</ul>
									</li>
									<li><a href="generic.html">Find</a></li>
									<li><a href="generic.html">Join</a></li>
									<li><a href="elements.html">User</a></li>
									<li><a href="elements.html">log-out</a></li>
									<li><a href="elements.html">apply</a></li>
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
									<section>
										<span class="icon fa-light fa-address-card major"></span>
										<h3>총 가입자 수</h3>
										<div class="count">0</div>
										<p>Morbi in sem quis dui placerat ornare. Pellentesque ipsum dolor</p>
									</section>
									<section>
										<span class="icon solid fa-users major"></span>
										<h3>메이트 수</h3>
										<div class="count1">0</div>
										<p>Integer vitae libero ac risus eges placerat voluptrus magna</p>
									</section>
									<section>
										<span class="icon solidfa-regular fa-heart major"></span>
										<h3>총 이용 건수</h3>
										<div class="count2">0</div>
										<p>Fusce lobortis lorem ipsum semper sagittis etiam consequat</p>
									</section>
								</div>
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
								<h3>신 <span class="extra">재빈</span></h3>
								<div class="spotlight">
									<ul>
										<li>
											<h4>분야 베이비시터 </h4>
											<p>신생아(0~6개월), 영아(7~36개월)</p>
										</li>
										<li>
											<h4>경력</h4>
											<p>10년이상 오랜기간 아이돌봄베이비시터 선생님으로 활동한 경력이 있습니다.
											</p>
										</li>
									</ul>
									<span class="image"><img src="https://i.pinimg.com/564x/20/b8/9c/20b89cfdf5297a973ae2a9803ae0d4be.jpg" alt="" /></span>
									<ul>
										<li>
											<h4>사랑과 정성으로 아이를 돌보는 선생님을 찾으신다면 연락주세요^^ </h4>
											<p>	늘 언제나 아이가 부모님에 빈자리를 느끼지 않고 사랑으로 올바르게 잘 양육하는 아이돌봄 선생님을 찾으신다면 연락주시기 바랍니다.</p>
										</li>
										<li>
											<h4>희망근무지역</h4>
											<p>인천 서구 </p>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<h3>최 <span class="extra">영환</span></h3>
								<div class="spotlight">
									<ul>
										<li>
											<h4>Erat aliquam</h4>
											<p>Praesent dapibus, neque id cursus fauci quam erat volutpat nam dui mitin.</p>
										</li>
										<li>
											<h4>Neque veroeros</h4>
											<p>Sed adipiscing ornare risus. Morbi lorem lentesque egestas sem consequat.</p>
										</li>
									</ul>
									<span class="image"><img src="https://i.pinimg.com/564x/a6/0f/42/a60f42eafff6589cc35c95bd6f7cae3e.jpg" alt="" /></span>
									<ul>
										<li>
											<h4>Quis portitor</h4>
											<p>Donec nec justo eget felis facilisis ferme Aenean dignissim pellen.</p>
										</li>
										<li>
											<h4>Magna accumsan</h4>
											<p>Lorem in sem quis dui placerat ornare tra sed etiam veroeros consequat.</p>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<h3>박 <span class="extra">민수</span></h3>
								<div class="spotlight">
									<ul>
										<li>
											<h4>Neque veroeros</h4>
											<p>Sed adipiscing ornare risus. Morbi lorem lentesque egestas sem consequat.</p>
										</li>
										<li>
											<h4>Quis portitor</h4>
											<p>Donec nec justo eget felis facilisis ferme Aenean dignissim pellen.</p>
										</li>
									</ul>
									<span class="image"><img src="https://i.pinimg.com/736x/1b/a0/b6/1ba0b69d92b079e303d4392b8e99fbeb.jpg" alt="" /></span>
									<ul>
										<li>
											<h4>Magna accumsan</h4>
											<p>Lorem in sem quis dui placerat ornare tra sed etiam veroeros consequat.</p>
										</li>
										<li>
											<h4>Erat aliquam</h4>
											<p>Praesent dapibus, neque id cursus fauci quam erat volutpat nam dui mitin.</p>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</section>

				<!-- Section -->
				<section id="one" class="main">
					<header class="accent1">
						<h2>Review</h2>
						<p>'애브리케어'가 여러분을 위해 최선을 다해 돌봐드릴게요.</p>
					</header>
					<div class="image-roll">
						<div class="image-container">
						  <img src="https://withmate.kr/assets/images/review/review5.png" alt="Image 1">
						  <img src="https://withmate.kr/assets/images/review/review5.png" alt="Image 2">
						  <img src="https://withmate.kr/assets/images/review/review5.png" alt="Image 3">
						</div>
						<button id="prev-btn" class="icon solid fa-arrow-left major"></button>
						<button id="next-btn" class="icon solid fa-arrow-right major"></button>
					</div>
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
							<p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue eu vulpu magna erat. Aliquam erat volutpat. Nam dui mi tincidunt magna accumsan.</p>
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
						<div id="chat-circle" class="icon solid fa-regular fa-comments major"></div>
						<div id="chat-box" class="chat-box hidden">
						  <div class="chat-header">
							<h3>Message us</h3>
							<button id="close-chat">&times;</button>
						  </div>
						  <div class="chat-body">
						  </div>
						  <div class="chat-footer">
							<input type="text" id="chat-input" placeholder="메시지 입력">
							<button type="submit" id="chat-submit">전송</button>
						  </div>
						</div>
					  </div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h3>About us</h3>
								<p>위드메이트는 온라인 병원 동행 서비스 매칭 플랫폼을 시작으로,
									대한민국에서 사회적 의미의 ‘시니어’라는 단어를 없애기 위해 설립된
									시니어 라이프 스타일 혁신 기업입니다.</p>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Kakao</span></a></li>
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
								</ul>
							</section>
							<section class="narrow">
								<h4>Magna tempus</h4>
								<ul class="links">
									<li><a href="#">Feugiat ligula</a></li>
									<li><a href="#">Vulputate tristique</a></li>
									<li><a href="#">Ultrices nulla</a></li>
									<li><a href="#">Cursus sed magna</a></li>
									<li><a href="#">Sed lectus donec</a></li>
								</ul>
							</section>
							<section>
								<h3>고객행복센터</h3>
								<p>월 ~ 토요일 오전 9시 ~ 오후 6시<p>
								<p><a href="#" class="major">(000) 000-0000</a></p>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; everycare. All rights reserved.</p>
						</div>
					</footer>
			</div>

		<!-- Scripts -->
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

	</body>
	<script>
		const prevBtn = document.querySelector('#prev-btn');
		const nextBtn = document.querySelector('#next-btn');
		const imageContainer = document.querySelector('.image-container');
		
		let count = 0;
		
		nextBtn.addEventListener('click', () => {
		  count++;
		  slideImage();
		});
		
		prevBtn.addEventListener('click', () => {
		  count--;
		  slideImage();
		});
		
		function slideImage() {
		  const imageWidth = document.querySelector('.image-container img').clientWidth;
		  imageContainer.style.transform = `translateX(${-imageWidth * count}px)`;
		}
	
		var swiper = new Swiper (".slide-container", {
			pagination : {
				el :  ".swiper-pagination",
				clickable : true,
				dynamicBullets: true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swper-button-prev",
			},
		});
	</script>

</html>


