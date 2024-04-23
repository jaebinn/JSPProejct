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
<title>everycare</title>
<script src="https://kit.fontawesome.com/1924b51539.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css">
<style>
@charset "UTF-8";
* {
   font-family: 'Pretendard-Regular';
}

.main {
   margin-top: 5%;
   padding: 0 10%;
}

a {
   text-decoration: none;
   border-bottom: none;
}
#wrapper #banner{
   height: 400px;
   background: url(/images/faq_banner.jpg) no-repeat;
   background-size: contain;
   background-position: center;
}
.banner-header h3{
   margin:0 auto;
   margin-top: 100px;
   
}

.list{
   width:100%;
   margin:0 auto;
}

.top{
   font-size: 40px;
   font-weight:bold;
   font-family: 'Pretendard-Regular';
}

.list > tbody > tr > td:first-child{
   width: 20%;
   color:#1bcea5;
   text-align: center;
}
.list > tbody > tr > td:nth-child(2){
   width:80%;
   text-align: left;
}
.list > tbody > tr{
   background-color: #fff !important; 
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

table tbody tr:nth-child(2n + 1) {
   background-color: #fff;      
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
				<ul style="display: flex">
					<li class="current"><a href="${cp}/index.jsp">Home</a></li>
					<li><a href="${cp}/expertsort.ep?psort=1">전문가매칭</a></li>
					<li><a href="${cp}/u_boardlist.ub"
						class="icon solid fa-angle-down" style="pointer-events: none;">게시판</a>
						<ul class="drop_menu">
							<li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
							<li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
							<li><a href="${cp}/reviewlist.rf">리뷰게시판</a></li>
						</ul></li>
					<c:if test="${not empty loginUser}">
						<li class="mypage"><a href="${cp}/"
							class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
							<ul class="drop_menu">
								<li class="mypage"><a href="${cp}/userinfo.us">유저 정보</a></li>
								<c:if test="${not empty expertSession}">
									<li class="expertpage"><a href="${cp}/expertinfo.ep">전문가
											정보</a></li>
								</c:if>
							</ul></li>
					</c:if>
					<c:if test="${not empty sessionScope.loginUser}">
						<!-- 세션이 있을 때 (로그인된 상태) -->
						<c:choose>
							<c:when test="${not empty expertSession}">
								<!-- 전문가 세션이 있을 때 -->
								<li><a href="${cp}/app/expertChat/expertChatList.jsp"><input
										type="button" value="전문가채팅" id="expert_chat"></a></li>
								<!-- <span class="note-num"></span>	 -->
							</c:when>
							<c:otherwise>
								<!-- 전문가 세션이 없을 때 -->
								<li><a href="${cp}/app/expert/expertRegister.jsp"><input
										type="button" value="전문가등록" id="expert_btn"></a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="${cp}/app/user/user-logout.jsp"><input
								type="button" value="로그아웃" id="logout_btn"></a></li>
						<li><p id="login_user" style="font-weight: bold">${sessionScope.loginUser}님</p></li>
					</c:if>
					<c:if test="${empty sessionScope.loginUser}">
						<li><a href="${cp}/app/user/user-login.jsp"><input
								type="button" value="로그인" id="login_btn"></a></li>
					</c:if>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
      <section id="banner">
         <div class="content primary">
            <header class="banner-header">
               <h3>여러분들의 궁금증을 해소시켜드릴게요!</h3>
            </header>
         </div>
      </section>
      
      <section class="main">
            <span class="top">공통 FAQ</span>
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
                        <tr class="contents" style="display: none">
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
      $(document).ready(function() {
         $('.toggle-content').click(function(e) {
            e.preventDefault();
            $(this).closest('tr').next('.contents').toggle();
         });
      });
   </script>
</body>
</html>









