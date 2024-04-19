<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/1924b51539.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<style>
@charset "UTF-8";

.main {
	margin-top: 15%;
	padding: 0 10%;
}

a {
	text-decoration: none;
	border-bottom: none;
}

table th {
	background-color: white !important;
	font-family: 'Pretendard-Regular';
}

table td {
	background-color: white !important;
}

.btn-area {
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn-area>tbody {
	width: 50%;
}

.btn-area>tbody>tr {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #fff !important;
	border: none;
}

.main>table tr th {
	text-align: center !important;
}

.star {
	font-size: 30px;
}

.star.on {
	color: #FFD438;
	pointer: cursor;
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

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
										<ul class="drop_menu">
											<li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
											<li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
											<li><a href="${cp}/reviewlist.rf">리뷰게시판</a></li>
										</ul>
									</li>
									<li class="mypage">
										<a href="${cp}/" class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
										<ul class="drop_menu">
											<li class="mypage"><a href="${cp}/">유저 정보</a></li>
											<c:if test="${not empty expertSession}">
												<li class="expertpage"><a href="${cp}/">전문가 정보</a></li>
											</c:if>
										</ul>
										</li>									
									<c:if test="${not empty sessionScope.loginUser}">
									    <!-- 세션이 있을 때 (로그인된 상태) -->    
									    <c:choose>
									        <c:when test="${not empty expertSession}">
									            <!-- 전문가 세션이 있을 때 -->
									            <li><a href="${cp}/app/expert/expertChatList.jsp"><input type="button" value="전문가채팅" id="expert_chat"></a></li>						            
									        </c:when>
									        <c:otherwise>
									            <!-- 전문가 세션이 없을 때 -->
									            <li><a href="${cp}/app/expert/expertRegister.jsp"><input type="button" value="전문가등록" id="expert_btn"></a></li>
									        </c:otherwise>
									    </c:choose>
									    <li><a href="${cp}/app/user/user-logout.jsp"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									    <li><p id="login_user" style="font-weight:bold">${sessionScope.loginUser}님</p></li>
									</c:if>
									<c:if test="${empty sessionScope.loginUser}"> 
										<li><a href="${cp}/app/user/user-login.jsp"><input type="button" value="로그인" id="login_btn"></a></li>
									</c:if>
								</ul>
							</nav>
					</header>

		<!-- Section -->
		<section id="one" class="main">
			<form id="reviewForm" method="post" name="reviewForm"
				action="${cp}/reviewwrite.rf">
				<%-- 				<input type="hidden" name="review_idx" value="${review.review_idx}">
				<input type="hidden" name="page" value="${param.page}"> --%>
				<h3 style="text-align: center;">리뷰 작성</h3>
				<table border="1">
					<tr>
						<th style="text-align: center;">제목</th>
						<td colspan="2"><input type="text" name="title"
							maxlength="50" placeholder="제목을 입력하세요" /></td>
					</tr>
					<tr>
						<th style="text-align: center;">별점</th>
						<td colspan="2">
							<div class="star_rating">
								<span class="star on fa-regular fa-star" value="1"></span> <span
									class="star fa-regular fa-star" value="2"></span> <span
									class="star fa-regular fa-star" value="3"></span> <span
									class="star fa-regular fa-star" value="4"></span> <span
									class="star fa-regular fa-star" value="5"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">작성자</th>
						<td colspan="2"><input type="text" name="user_id"
							maxlength="50" value="${loginUser}" readonly></td>
					</tr>
					<tr>
						<th style="text-align: center;">전문가</th>
						<td colspan="2"><input type="text" name="expert_name"
							maxlength="50" value="${param.expert_name}" readonly/></td>
					</tr>
					<tr>
						<th style="text-align: center;">내용</th>
						<td colspan="2"><textarea name="detail" rows="20"
								style="resize: none;"></textarea></td>
					</tr>
				</table>
				<table class="btn-area">
					<tbody>
						<tr>
							<td><a href="javascript:sendit();"> <input type="button"
									value="등록">
							</a></td>
							<td><a href="${cp}/reviewlist.rf?page=${param.page}"> 
									<input type="button" value="목록" />
							</a></td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>


		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<section>
					<h3>EveryCare</h3>
					<p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해
						사용자들이 안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-linkedin-in"><span
								class="label">LinkedIn</span></a></li>
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
					<p>EveryCare 고객센터는 여러분의 궁금증이나 문의사항에 친절하고 신속하게 대응해 드립니다. 저희 팀은
						24시간 365일 연중무휴로 운영되며, 다음과 같은 서비스를 제공합니다.
					<p>
					<p>
						<a href="#" class="major">(000) 000-0000</a>
					</p>
				</section>
			</div>
			<div class="copyright">
				<p>&copy; EveryCare. All rights reserved.</p>
			</div>
		</footer>
	</div>
</body>

<!-- Scripts -->
<script>
	const cp = '${cp}';
</script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${cp}/js/jquery.dropotron.min.js"></script>
<script src="${cp}/js/jquery.selectorr.min.js"></script>
<script src="${cp}/js/jquery.scrollex.min.js"></script>
<script src="${cp}/js/jquery.scrolly.min.js"></script>
<script src="${cp}/js/browser.min.js"></script>
<script src="${cp}/js/breakpoints.min.js"></script>
<script src="${cp}/js/util.js"></script>
<script src="${cp}/js/main.js"></script>

<script>
	function sendit() {
		const reviewForm = document.reviewForm;
		//유효성 검사
		reviewForm.submit();
	}

	$('.star_rating > .star').click(
			function() {
				$(this).parent().children('.star').removeClass(
						'fa-regular fa-star').addClass('fa-solid fa-star');
				$(this).addClass('on').prevAll('span').addClass('on');
			});
</script>
</html>