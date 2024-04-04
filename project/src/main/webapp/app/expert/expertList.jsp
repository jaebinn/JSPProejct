<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>에브리케어</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cp}/css/main.css" />
		<link rel="stylesheet" href="${cp}/css/expert_list.css" />
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
									<li><a href="generic.html">전문가 매칭</a></li>
									<li><a href="login.html"><input type="button" value="로그인" id="login_btn"></a></li>
									<li><a href="logout.html"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									<li><a href="login.html"><input type="button" value="전문가등록" id="expert_btn"></a></li>		
								</ul>
							</nav>
					</header>

				<!-- Section -->
					<section id="one" class="main alt">
						<header class="expert_banner">
							<h1>전문가 매칭</h1>
						</header>
					</section>
					<main id="content">
						<div class="div_list">
							<div class="search">
								<div class="text01" id="area_text"><span class="exam01">지역을 선택하시려면 클릭해주세요.</span></div>
								<div class="text01" id="sphere_text"><span class="exam01">분야를 선택하시려면 클릭해주세요.</span></div>
							</div>
							<div class="tit"><span>전문가찾기</span>
								<span class="sort01">
								<select name="psort" class="psort" id="psort">
									<option value="1">좋아요순</option>
						
									<!--<option value="2" >후기순</option>-->
									<!-- <option value="8">보험여부</option> -->
									<!-- <option value="3">인증수순</option> -->
									<!--<option value="4" >응답률순</option>-->
									<option value="5">시급낮은순</option>
									<option value="6">시급높은순</option>
									<!--<option value="7" >좋아요순</option>-->
								</select>
								</span>
							</div>
							<div class="expert_list">
								<ul class="ul01">
									<li class="li01">
										<a href="#">
											<p class="tab01">
												<img src="/images/profile.png" class="profile">
												<p class="like" id="follow43350" data-val="43350" data-code="MXFNd3JGL29tTlc3cnJPN0JJb1lGdz09"><span class="temperate">36.5도</span><span class="heart01 ">&nbsp;</span></p>
												
											</p>
											<p class="tab02">
												<p class="sphere"><span class="edit_date"></span></p>
												<span class="name" style="text-align: left;"> 박OO <span class="age">만 34세</span></span>
												
												<p class="addr" style="text-align: center;">희망지역: 경기 용인시 수지구, 성남시 분당구, 용인시 기흥구</p>
												<p class="cost">시급 13,000원 <span class="bar0101">&nbsp;</span> <span class="week01">10시~18시가능</span></p>
											</p>
											<span class="tab03">
												<span class="text01">10년이상</span>
												<span class="text01">유아(4~7세) 희망</span>
												<span class="text01">kh정보교육원</span>
												
											</span>
										</a>
									</li>	
								</ul>
								<ul class="ul01">
									<li class="li01">
										<a href="#">
											<p class="tab01">
												<img src="/images/profile.png" class="profile">
												<p class="like" id="follow43350" data-val="43350" data-code="MXFNd3JGL29tTlc3cnJPN0JJb1lGdz09"><span class="temperate">36.5도</span><span class="heart01 ">&nbsp;</span></p>
												
											</p>
											<p class="tab02">
												<p class="sphere"><span class="edit_date"></span></p>
												<span class="name" style="text-align: left;"> 박OO <span class="age">만 34세</span></span>
												
												<p class="addr" style="text-align: center;">희망지역: 경기 용인시 수지구, 성남시 분당구, 용인시 기흥구</p>
												<p class="cost">시급 13,000원 <span class="bar0101">&nbsp;</span> <span class="week01">10시~18시가능</span></p>
											</p>
											<span class="tab03">
												<span class="text01">10년이상</span>
												<span class="text01">유아(4~7세) 희망</span>
												<span class="text01">kh정보교육원</span>
												
											</span>
										</a>
									</li>	
								</ul>
								<ul class="ul01">
									<li class="li01">
										<a href="#">
											<p class="tab01">
												<img src="/images/profile.png" class="profile">
												<p class="like" id="follow43350" data-val="43350" data-code="MXFNd3JGL29tTlc3cnJPN0JJb1lGdz09"><span class="temperate">36.5도</span><span class="heart01 ">&nbsp;</span></p>
												
											</p>
											<p class="tab02">
												<p class="sphere"><span class="edit_date"></span></p>
												<span class="name" style="text-align: left;"> 박OO <span class="age">만 34세</span></span>
												
												<p class="addr" style="text-align: center;">희망지역: 경기 용인시 수지구, 성남시 분당구, 용인시 기흥구</p>
												<p class="cost">시급 13,000원 <span class="bar0101">&nbsp;</span> <span class="week01">10시~18시가능</span></p>
											</p>
											<span class="tab03">
												<span class="text01">10년이상</span>
												<span class="text01">유아(4~7세) 희망</span>
												<span class="text01">kH정보교육원</span>
											</span>
										</a>
									</li>	
								</ul>
								<ul class="ul01">
									<li class="li01">
										<a href="#">
											<p class="tab01">
												<img src="/images/profile.png" class="profile">
												<p class="like" id="follow43350" data-val="43350" data-code="MXFNd3JGL29tTlc3cnJPN0JJb1lGdz09"><span class="temperate">36.5도</span><span class="heart01 ">&nbsp;</span></p>
												
											</p>
											<p class="tab02">
												<p class="sphere"><span class="edit_date"></span></p>
												<span class="name" style="text-align: left;"> 박OO <span class="age">만 34세</span></span>
												
												<p class="addr" style="text-align: center;">희망지역: 경기 용인시 수지구, 성남시 분당구, 용인시 기흥구</p>
												<p class="cost">시급 13,000원 <span class="bar0101">&nbsp;</span> <span class="week01">10시~18시가능</span></p>
											</p>
											<span class="tab03">
												<span class="text01">10년이상</span>
												<span class="text01">유아(4~7세) 희망</span>
												<span class="text01">kh정보교육원</span>
												
											</span>
										</a>
									</li>	
								</ul>
								
							</div>
						</div>

					</main>
				<table class="pagination">
					<tbody>
						<tr>
							<td>
								<c:if test="${startPage != 1}">
									<a class="btn" href="${cp}/boardlist.bo?page=${startPage-1}&keyword=${keyword}">&lt;</a>
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" var="i">
									<c:choose>
										<c:when test="${page == i}">
											<span class="nowPage">${i}</span>
										</c:when>
										<c:otherwise>
											<a class="btn" href="${cp}/boardlist.bo?page=${i}&keyword=${keyword}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${endPage != totalPage}">
									<a class="btn" href="${cp}/boardlist.bo?page=${endPage+1}&keyword=${keyword}">&gt;</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
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
			<script src="js/jquery.min.js"></script>
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