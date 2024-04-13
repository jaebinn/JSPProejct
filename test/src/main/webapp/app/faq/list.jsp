<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="cp" value="${pageContext.request.contextPath}"
	scope="session" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>faq게시판</title>
<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css">
<link rel="stylesheet" href="${cp}/css/faqlist.css">
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
				<ul>
					<li class="current"><a href="${cp}/index.jsp">Home</a></li>
					<li><a href="${cp}/expertlist.ep">전문가매칭</a></li>
					<li>									
						<a href="${cp}/u_boardlist.ub" class="icon solid fa-angle-down">게시판</a>
						<ul>
							<li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
							<li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
							<li><a href="${cp}">리뷰게시판</a></li>
						</ul>
					</li>
					<li>
						<a href="${cp}/" class="icon solid fa-angle-down">마이페이지</a>
							<ul>
								<li><a href="${cp}/">유저 정보</a></li>
								<li><a href="${cp}/">전문가 정보</a></li>
							</ul>
					</li>									
					<c:if test="${empty sessionScope.loginUser}">
					<!-- 세션이 없을 때 (로그인되지 않은 상태) -->
					<li><a href="${cp}/app/user/user-login.jsp"><input type="button" value="로그인" id="login_btn"></a></li>
					</c:if>
					<c:if test="${not empty sessionScope.loginUser}">
					<!-- 세션이 있을 때 (로그인된 상태) -->
						<li><a href="${cp}/expertok.ep"><input type="button" value="전문가등록" id="expert_btn"></a></li>
						<li><a href="${cp}/app/user/user-logout.jsp"><input type="button" value="로그아웃" id="logout_btn"></a></li>
					</c:if>
				</ul>
			</nav>
		</header>
		<section id="banner">
			<div class="content primary">
				<header>
					<br><br><br><br>
					<p>여러분들의 궁금증을 해소시켜드릴게요!</p>
				</header>
			</div>
		</section>
		<section class="main">
			<br>
			<table class="list">
				<tbody>
					<c:choose>
						<c:when test="${list != null and list.size() > 0}">
							<c:forEach var="i" begin="0" end="${list.size() - 1}">
								<c:set var="faq" value="${list[i]}" />
								<tr class="title">
									<td>❔</td>
									<td><a href="" class="toggle-content">${faq.title}</a></td>
								</tr>
								<tr class="contents" style="display:none">
									<td>✔</td>
									<td colspan="2">${faq.contents}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>등록된 게시글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<br>
			<table class="pagination">
				<tbody>
					<tr>
						<td><c:if test="${startPage != 1}">
								<a class="btn" href="${cp}/faqlist.fa?page=${startPage-1}">&lt;</a>
							</c:if> <c:forEach begin="${startPage}" end="${endPage}" var="i">
								<c:choose>
									<c:when test="${page == i}">
										<span class="nowPage">${i}</span>
									</c:when>
									<c:otherwise>
										<a class="btn" href="${cp}/faqlist.fa?page=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${endPage != totalPage}">
								<a class="btn" href="${cp}/faqlist.fa?page=${endPage+1}">&gt;</a>
							</c:if></td>
					</tr>
				</tbody>
			</table>
		</section>
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<section>
					<h3>Nullam sed gravida</h3>
					<p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus.
						Donec consectetuer ligula vulputate sem tristique cursus sed magna
						gravida non.</p>
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
					<h4>Lorem aliquam</h4>
					<ul class="links">
						<li><a href="#">Ultrices nulla</a></li>
						<li><a href="#">Quis lectus donec</a></li>
						<li><a href="#">Magna ligula</a></li>
						<li><a href="#">Sed etiam tristique</a></li>
						<li><a href="#">Cursus magna</a></li>
						<li><a href="#">Gravida dolore</a></li>
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
					<h3>Morbi sed volutpat</h3>
					<p>Sed vulputate sem tristique cursus sed magna gravida non
						lorem ipsum dolor sit amet.
					<p>
					<p>
						<a href="#" class="major">(000) 000-0000</a>
					</p>
				</section>
			</div>
			<div class="copyright">
				<p>&copy; Untitled. All rights reserved.</p>
			</div>
		</footer>
	</div>

	<!-- Scripts -->
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
		$(document).ready(function(){
		  $('.toggle-content').click(function(e){
		    e.preventDefault();
		    $(this).closest('tr').next('.contents').toggle();
		  });
		});
	</script>
</body>
</html>










