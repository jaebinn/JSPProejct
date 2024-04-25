<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>everycare</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="icon" href="${cp}/images/everycare.ico" />
<script src="https://kit.fontawesome.com/1924b51539.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<style>
@charset "UTF-8";

* {
   font-family: 'Pretendard-Regular' !important;
}

.main {
   margin-top: 5%;
   padding: 0 10%;
   width:90%;
}

a {
   text-decoration: none;
   border-bottom: none;
}

.main .board-area {
   width: 100%;
}

#banner .content {
   background: url("/images/u_boa_banner.jpg");
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

.board-area>tbody>tr>td {
   text-align: center;
}

.btn-box {
   text-align: right;
}

.btn-box input[type="button"] {
   box-shadow: none;
}

.btn-box input[type="button"]:hover {
   background-color: initial;
}

.pagination {
   text-align: center;
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

.reply-cnt {
   color: #1bcea5;
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
               <h1>도와줄 전문가를 찾아요!</h1>
               <p>빠르게 도와줄 전문가를 찾을 수 있어요</p>
            </header>
            <ul class="actions special">
               <li><a href="#one" class="button large wide scrolly">바로
                     글쓰기</a></li>
            </ul>
         </div>
      </section>

      <!-- Section -->
      <section id="one" class="main">
         <table class="board-area">
            <thead>
               <tr>
                  <th>글쓴이</th>
                  <th>제목</th>
                  <th>등록시간</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
               <c:choose>
                  <c:when test="${list !=null and list.size() > 0 }">
                     <c:forEach var="i" begin="0" end="${list.size() -1}">
                        <c:set var="u_board" value="${list[i]}" />
                        <tr>
                           <td>${u_board.name}(${u_board.user_id})</td>
                           <td><a
                              href="${cp}/u_boardview.ub?board_idx=${u_board.board_idx}&page=${page}">${u_board.title}<span
                                 class="reply-cnt" style="color: #1bcea5;">[${u_reply_cnt_list[i]}]</span></a></td>
                           <td><c:set var="now" value="${now}" /> <c:choose>
                                 <c:when
                                    test="${fn:substring(u_board.regdate, 0, 10) == fn:substring(now, 0, 10)}">
                                    <fmt:parseDate value="${u_board.regdate}"
                                       pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="HH:mm" />
                                 </c:when>
                                 <c:otherwise>
                                    <fmt:parseDate value="${u_board.regdate}"
                                       pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="MM-dd HH:mm" />
                                 </c:otherwise>
                              </c:choose></td>
                           <td>${u_board.readcount}</td>
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
         <div class="btn-box">
            <input type="button" value="글쓰기"
               onClick="location.href='${cp}/app/u_board/u_board_write.jsp?page=${page}'">
            <table class="pagination">
               <tbody>
                  <tr>
                     <td><c:if test="${startPage != 1}">
                           <a class="btn" href="${cp}/u_boardlist.ub?page=${startPage-1}">&lt;</a>
                        </c:if> <c:forEach begin="${startPage}" end="${endPage}" var="i">
                           <c:choose>
                              <c:when test="${page == i}">
                                 <span class="nowPage">${i}</span>
                              </c:when>
                              <c:otherwise>
                                 <a class="btn" href="${cp}/u_boardlist.ub?page=${i}">${i}</a>
                              </c:otherwise>
                           </c:choose>
                        </c:forEach> <c:if test="${endPage != totalPage}">
                           <a class="btn" href="${cp}/u_boardlist.ub?page=${endPage+1}">&gt;</a>
                        </c:if></td>
                  </tr>
               </tbody>
            </table>
         </div>
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
      const loginUser = "${loginUser}";
      $(document).ready(function() {
         if (!loginUser) {
            $(".btn-box input").on("click", function(event) {
               // 로그인하지 않은 경우
               event.preventDefault();
               alert("로그인 후 이용해주세요.");
               window.location.href = "${cp}/app/user/user-login.jsp";
            });
         }
      });
   </script>

</body>
</html>