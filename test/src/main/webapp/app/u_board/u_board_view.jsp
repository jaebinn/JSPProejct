<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<link rel="stylesheet" href="${cp}/css/u_boardview.css">
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
			<table class="board_area">
				<tr>
					<th>제목</th>
					<td><input type="text" name="boardtitle" value="${u_board.title}" readonly></td>
					<th>작성자</th>
					<td><input type="text" name="userid" value="${u_board.user_id}(${u_board.name})" readonly></td>
					<th>조회수</th>
					<td>${u_board.readcount}</td>
				</tr>

				<tr class="content-area">
					<th>내용</th>
					<td colspan="10"><textarea name="boardcontents" readonly>${u_board.contents}</textarea></td>
				</tr>
				<c:choose>
					<c:when test="${files != null and files.size()>0 }">
						<c:forEach var="i" begin="0" end="${files.size()-1}">
							<c:set var="file" value="${files[i]}" />
							<tr>
								<th>첨부파일${i+1}</th>
								<td colspan="10"><a href="${cp}/filedownload.ub?system_name=${file.system_name}&original_name=${file.original_name}">${file.original_name}</a>
								</td>
							</tr>
							<c:forTokens items="${file.original_name }" delims="." var="token" varStatus="tokenStat">
								<c:if test="${tokenStat.last}">
									<c:if test="${token eq 'jpeg' or token eq 'jpg' or token eq 'png' or token eq 'gif' or token eq 'webp' }">
										<!-- 썸네일 제작 -->
										<tr>
											<th></th>
											<td><img style="width: 200px;" src="${cp}/file/${file.system_name}"></td>
										</tr>
									</c:if>
								</c:if>
							</c:forTokens>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="no-file">
							<td colspan="10">첨부 파일이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<table class="btn_area">
				<tbody>
					<tr>
						<td><%-- <c:if test="${u_board.user_id == loginUser}"> --%>
								<a href="${cp}/u_boardupdate.ub?board_idx=${u_board.board_idx}&page=${param.page}">수정</a>
								<a href="${cp}/u_boarddelete.ub?board_idx=${u_board.board_idx}&page=${param.page}">삭제</a>
							<%-- </c:if>  --%><a href="${cp}/u_boardlist.ub?page=${param.page}">목록</a>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="reply_line">
				<form name="replyForm" method="post" action="${cp}/u_replywrite.ur">
					<input type="hidden" name="board_idx" value="${u_board.board_idx}">
					<input type="hidden" name="page" value="${param.page}"> 
					<%-- <input type="hidden" name="keyword" value="${param.keyword}"> --%>
					<table class="write_box">
						<tbody>
							<tr>
								<td>댓글</td>
								<td><textarea name="contents"></textarea> <a href="javascript:document.replyForm.submit();">등록</a></td>
							</tr>
						</tbody>
					</table>
				</form>
				<form name="updateForm" method="post">
					<input type="hidden" name="board_idx" value="${u_board.board_idx}">
					<input type="hidden" name="page" value="${param.page}">  
					<input type="hidden" name="u_reply_idx" value=""> 
					<input type="hidden" name="i" value="">
					<table class="update_box">
						<tbody>
						<c:if test="${replies.size()>0}">
							<c:forEach var="i" begin="0" end="${replies.size()-1}">
								<c:set var="u_reply" value="${replies[i]}"/>
									<tr>
										<td>${u_reply.user_id}</td>
										<td>
											<textarea readonly name="reply${i}" id="reply${i}" class="replycontents">${u_reply.contents}</textarea>
										</td>
										<td>
											${u_reply.regdate}<c:if test="${u_reply.updatechk == 'o'}">(수정됨)</c:if>
											<%-- <c:if test="${reply.userid == loginUser}"> --%>
												<div class="btns">
													<a class="btn" href="javascript:updateReply(${i})" id="start${i}">수정</a>
													<a class="btn" href="javascript:updateReplyOk(${i},${u_reply.u_reply_idx})" style="display:none;" id="end${i}">수정완료</a>
													<a class="btn" href="javascript:deleteReply(${u_reply.u_reply_idx})">삭제</a>
												</div>
											<%-- </c:if> --%>
										</td>
									</tr>
								</c:forEach>
						</c:if>
						<c:if test="${replies.size() <= 0}">
							<tr>
								<td colspan="3">등록된 댓글이 없습니다</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</form>
			</div>
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
		const updateForm = document.updateForm;
		let flag = false;
		function deleteReply(u_reply_idx){
			updateForm.setAttribute("action","${cp}/u_replydelete.ur");
			updateForm.u_reply_idx.value = u_reply_idx;
			updateForm.submit();
		}
		function updateReply(i){
			const start = document.getElementById("start"+i);
			const end = document.getElementById("end"+i);
			const reply = document.getElementById("reply"+i);
			
			if(!flag){
				start.style.display = "none";
				end.style.display = "inline-block";
				reply.removeAttribute("readonly");
				reply.focus();
				flag = true;
			}
			else{
				alert("수정중인 댓글이 있습니다!");
			}
		}
		function updateReplyOk(i,u_reply_idx){
			updateForm.setAttribute("action","${cp}/u_replyupdate.ur");
			updateForm.u_reply_idx.value = u_reply_idx;
			updateForm.i.value = i;
			updateForm.submit();
		}
	</script>
</body>
</html>