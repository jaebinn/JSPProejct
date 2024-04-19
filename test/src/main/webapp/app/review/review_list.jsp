<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	margin-top: 10%;
	padding: 0 10%;
}

a {
	text-decoration: none;
	border-bottom: none;
}

.main .board-area {
	width: 100%;
}

#banner .content {
	background:
		url("https://cdn.pixabay.com/photo/2019/10/30/15/45/thumbs-up-4589867_1280.jpg");
	background-position: center;
	background-size: cover;
}

.board-area {
	font-size: .9em;
	box-shadow: 0 1px 5px rgba(252, 231, 231, 0.25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
}

.board-area>thead>tr>th {
	text-align: center;
	font-weight: bold;
	background: #1bcea5 !important;
	color: #fff;
	padding-top: 10px;
	line-height: 20px;
}

.board-area tr:nth-child(even) {
	background-color: transparent; /* 투명 색상으로 설정 */
}

.board-area>tbody>tr>td {
	text-align: center;
	font-family: 'Pretendard-Regular';
}

.banner-header h1 {
	font-family: 'Pretendard-Regular' !important;
	font-weight: bold;
}

.pagination {
	text-align: center;
}

.pagination>tbody>tr {
	background-color: #fff !important;
	border: none;
}

.pagination .nowPage {
	display: inline-block;
	color: #1bcea5;
	font-weight: bold;
	font-size: 20px;
	line-height: 20px;
	text-align: center;
	cursor: pointer;
	padding-right: 15px;
}

.pagination .btn {
	font-weight: bold;
	font-size: 20px;
	line-height: 20px;
	text-align: center;
	cursor: pointer;
	padding-right: 15px;
}

.title-tog {
	pointer: cursor;
	font-weight: bold;
	font-size: 15px;
}

.review-num span {
	font-size: 40px;
	font-family: 'Pretendard-Regular';
}

.contents {
	display: none;
	font-weight: normal;
	font-size: 13px;
	padding-top: 30px;
	padding-bottom: 30px;
}

.fa-chevron-down {
	margin-left: 10px;
	font-size: 10px;
}

.modal {
	margin-top: 30px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
	border-radius: 10px;
	border-radius: 10px;
}

.modal:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.edit-container {
	margin-top: 20px;
}

#editbox button, .edit-container input, .update_btn input, .update_btn button
	{
	box-shadow: none;
}

#editbox button:hover, .edit-container input:hover, .update_btn input:hover
	{
	background-color: initial;
}

.update_btn input:nth-child(even), .edit-container input:nth-child(even),
	.editbox tr:nth-child(even) {
	background-color: transparent; /* 투명 색상으로 설정 */
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

		<!-- Banner -->
		<section id="banner">
			<div class="content primary">
				<header class="banner-header">
					<h1>이용 후기</h1>
				</header>
				<ul class="actions special">
					<li><a href=${cp}/app/review/review_write.jsp?page=${page}
						class="button large wide scrolly">후기 작성하기</a></li>
				</ul>
			</div>
		</section>

		<!-- Section -->
		<section id="one" class="main">

			<div class="review-num">
				<span>건</span>
			</div>
			<table class="board-area">
				<thead>
					<tr>
						<th width="5%">번호</th>
						<th width="40%">제목</th>
						<th width="10%">전문가</th>
						<th width="10%">작성자</th>
						<th width="10%">별점</th>
						<th width="10%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list !=null and list.size() > 0 }">
							<c:forEach var="i" begin="0" end="${list.size() -1}">
								<c:set var="review" value="${list[i]}" />
								<tr>
									<!--번호 -->
									<td>${review.review_idx}</td>

									<!--타이틀/내용  -->
									<td>
										<div class="title-tog" onclick="toggleContent(event)">
											${review.title} <span class="fa-solid fa-chevron-down"></span>
											<div class="contents">${review.detail}
												<div class="edit-container">
													<input type="button" id="open_btn" value="수정" /> <a
														href="${cp}/reviewupdate.rf?review_idx=${review.review_idx}&page=${param.page}">
													</a> <a
														href="${cp}/reviewdelete.rf?review_idx=${review.review_idx}&page=${param.page}">삭제</a>
												</div>



												<!--수정  -->
												<form id="updateForm" method="post" name="updateForm"
													action="${cp}/reviewupdate.rf">
													<div class="modal">
														<div id="editbox" style="display: none;">
															<table border="1">
																<tr>
																	<th style="text-align: center;">제목</th>
																	<td colspan="2"><input type="text" name="title"
																		maxlength="50" placeholder="제목을 입력하세요"></td>
																</tr>
																<tr>
																	<th style="text-align: center;">별점</th>
																	<td colspan="2">
																		<div class="star_rating">
																			<span class="star on fa-regular fa-star" value=1></span>
																			<span class="star fa-regular fa-star" value=2></span>
																			<span class="star fa-regular fa-star" value=3></span>
																			<span class="star fa-regular fa-star" value=4></span>
																			<span class="star fa-regular fa-star" value=5></span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th style="text-align: center;">내용</th>
																	<td colspan="2"><textarea name="detail" rows="5"
																			style="resize: none;"></textarea></td>
																</tr>
															</table>
														</div>
													</div>
												</form>

												<div class="update_btn">
													<a href="javascript:sendit();"> <input type="button"
														value="등록"></a>
													<button class="close_btn">닫기</button>
												</div>
											</div>
										</div>
									</td>
									<!--전문가 -->
									<td>${review.expert_idx}</td>
									<!--작성자 -->
									<td>${review.name}${review.user_id}</td>
									<!--별점  -->
									<td>${review.star}</td>
									<!--작성일  -->
									<td><c:set var="now" value="${now}" /> <c:choose>
											<c:when
												test="${fn:substring(review.regdate, 0, 10) == fn:substring(now, 0, 10)}">
												<fmt:parseDate value="${review.regdate}"
													pattern="yyyy-MM-dd" var="parsedDate" />
												<fmt:formatDate value="${parsedDate}" pattern="HH:mm" />
											</c:when>
											<c:otherwise>
												<fmt:parseDate value="${review.regdate}"
													pattern="yyyy-MM-dd" var="parsedDate" />
												<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">등록된 리뷰가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<table class="pagination">
				<tbody>
					<tr>
						<td><c:if test="${startPage != 1}">
								<a class="btn" href="${cp}/reviewlist.rf?page=${startPage-1}">&lt;</a>
							</c:if> <c:forEach begin="${startPage}" end="${endPage}" var="i">
								<c:choose>
									<c:when test="${page == i}">
										<span class="nowPage">${i}</span>
									</c:when>
									<c:otherwise>
										<a class="btn" href="${cp}/reviewlist.rf?page=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${endPage != totalPage}">
								<a class="btn" href="${cp}/reviewlist.rf?page=${endPage+1}">&gt;</a>
							</c:if></td>
					</tr>
				</tbody>
			</table>
		</section>
	</div>
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<section>
				<h3>EveryCare</h3>
				<p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해 사용자들이
					안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
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
		// 수정 폼 제출
		function sendit() {
			const updateForm = document.getElementById('updateForm');
			updateForm.submit();
		}

		//타이틀,콘텐츠 토글 스크립트
		function toggleContent(event) {
			// 클릭한 요소가 타이틀 영역인 경우에만 toggle 실행
			if (event.target.className === 'title-tog') {
				var contents = event.currentTarget.querySelector('.contents');
				contents.style.display = contents.style.display === 'none' ? 'block'
						: 'none';
			}
		}

		$(document).ready(function() {
			$("#open_btn").click(function() {
				$("#editbox").fadeIn();
			});
		});
		const editButton = document.getElementById('open_btn');
		const editBox = document.getElementById('editbox');

		editButton
				.addEventListener(
						'click',
						function() {
							editBox.style.display = (editBox.style.display === 'none') ? 'block'
									: 'none';
						});
		// 별 리뷰 등록
		$('.star_rating > .star').click(
				function() {
					$(this).parent().children('.star').removeClass(
							'fa-regular fa-star').addClass('fa-solid fa-star');
					$(this).addClass('on').prevAll('span').addClass('on');
				});
	</script>
</body>
</html>