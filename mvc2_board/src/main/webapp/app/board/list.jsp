<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
body {
	background-color: #fff;
}

table {
	border: 0px;
	width: 900px;
}

.title h3 {
	font-size: 2em;
	font-weight: bold;
	color: #43a047;
	padding: 10px 0;
	display: inline-block;
	border: 2px solid #43a047;
	border-radius: 100px;
	width: 60%;
}

.title img {
	width: 80%;
}

#wrap {
	margin: 0 auto;
	width: 1000px;
}

.list, .pagination, .pagination+table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 840px;
}

.list>thead>tr:nth-child(1)>td {
	text-align: right;
}

.list>thead>tr>th {
	border-top: 1px solid #384d75;
	border-bottom: 1px solid #ccc;
	padding: 5px;
}

.list>tbody>tr:nth-child(2n+1) {
	background-color: rgb(240, 255, 240);
}

.list>tbody>tr:nth-child(n+1):hover {
	background-color: rgb(239, 233, 252);
}

.list>tbody>tr>td {
	border-bottom: 1px solid #ccc;
	padding: 5px;
	text-align: center;
}

.list>tbody>tr>td:nth-child(2) {
	width: 8%;
	text-align: left;
}

.list th:nth-child(1){width:8%;}
.list th:nth-child(2){width:50%;}
.list th:nth-child(3){width:15%;}
.list th:nth-child(4){width:17%;}
.list th:nth-child(5){width:10%;}

a {
	display: inline-block;
	border-radius: 3px;
	background-color: rgb(0, 200, 80);
	color: #fff;
	font-weight: bold;
	text-decoration: none;
}

.list a {
	background-color: transparent;
	color: #424242;
}

.list #reply_cnt {
	font-weight: 900;
	color: red;
}

.list .hot {
	display: inline-block;
	font-weight: bold;
	position: relative;
	animation: hot 1s infinite alternate;
}

.list .new {
	display: inline-block;
	font-weight: bold;
	position: relative;
	left: 7px;
	animation: new 1s infinite alternate;
}

@keyframes hot {
	from {
		color:yellow;
		transform: scale(1);
	}
	to {
		color: red;
		transform: scale(1.05);
	}
}
@keyframes new {
	from {
		color:yellow;
		transform: scale(1);
	}
	to {
		color: orange;
		transform: scale(1.05);
	}
}
.header_area a {
	width: 100px;
	padding: 10px;
	text-align: center;
}

.header_area span {
	font-weight: bold;
}
.pagination{
	margin-top:20px;
}
.pagination a {
	padding: 5px;
	width: 20px;
	height: 20px;
}

.pagination a:hover {
	background-color: rgb(198, 175, 245);
}

.nowPage {
	padding: 5px;
	width: 20px;
	height: 20px;
	display: inline-block;
	border-radius: 3px;
	background-color: rgb(198, 175, 245);
	color: #fff;
	font-weight: bold;
}

a.write {
	padding: 5px;
	width: 70px;
	height: 25px;
	text-align: center;
}

.search_area {
	text-align: center;
	vertical-align: middle;
	width: 840px;
	margin-bottom:20px;
}

.search_area #keyword {
	outline: none;
	border: 2px solid rgb(0, 200, 80);
	border-radius: 3px;
	width: 300px;
	padding: 10px;
}

.search_area [type=button] {
	background-color: rgb(0, 200, 80);
	width: 70px;
	padding: 10px;
	height: 38px;
	display: inline-block;
	border: 1px solid rgb(0, 200, 80);
	position: relative;
	top: 1.5px;
	border-radius: 3px;
	color: #fff;
	font-weight: bold;
}
/*  */
#chat-circle {
	box-sizing: border-box;
	position: fixed;
	bottom: 25px;
	right: 25px;
	background: #43a047;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	color: white;
	padding: 18px;
	font-size: 20px; cursor : pointer;
	box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px
		rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
	cursor: pointer;
}

.btn#my-btn {
	background: white;
	padding-top: 13px;
	padding-bottom: 12px;
	border-radius: 45px;
	padding-right: 40px;
	padding-left: 40px;
	color: #5865C3;
}

#chat-overlay {
	background: rgba(255, 255, 255, 0.1);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	display: none;
}

.chat-box {
	display: none;
	background: #efefef;
	position: fixed;
	right: 30px;
	bottom: 50px;
	width: 350px;
	max-width: 85vw;
	max-height: 100vh;
	border-radius: 5px;
	/*   box-shadow: 0px 5px 35px 9px #464a92; */
	box-shadow: 0px 5px 35px 9px #ccc;
}

.chat-box-toggle {
	float: right;
	margin-right: 15px;
	cursor: pointer;
}

.chat-box-header {
	background: #43a047;
	height: 27px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color: white;
	text-align: center;
	font-size: 20px;
	padding: 17px 0;
}

.chat-box-body {
	position: relative;
	height: auto;
	border: 1px solid #ccc;
	overflow: hidden;
}

.chat-box-body:after {
	content: "";
	background-image:
		url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAgOCkiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+PGNpcmNsZSBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgY3g9IjE3NiIgY3k9IjEyIiByPSI0Ii8+PHBhdGggZD0iTTIwLjUuNWwyMyAxMW0tMjkgODRsLTMuNzkgMTAuMzc3TTI3LjAzNyAxMzEuNGw1Ljg5OCAyLjIwMy0zLjQ2IDUuOTQ3IDYuMDcyIDIuMzkyLTMuOTMzIDUuNzU4bTEyOC43MzMgMzUuMzdsLjY5My05LjMxNiAxMC4yOTIuMDUyLjQxNi05LjIyMiA5LjI3NC4zMzJNLjUgNDguNXM2LjEzMSA2LjQxMyA2Ljg0NyAxNC44MDVjLjcxNSA4LjM5My0yLjUyIDE0LjgwNi0yLjUyIDE0LjgwNk0xMjQuNTU1IDkwcy03LjQ0NCAwLTEzLjY3IDYuMTkyYy02LjIyNyA2LjE5Mi00LjgzOCAxMi4wMTItNC44MzggMTIuMDEybTIuMjQgNjguNjI2cy00LjAyNi05LjAyNS0xOC4xNDUtOS4wMjUtMTguMTQ1IDUuNy0xOC4xNDUgNS43IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+PHBhdGggZD0iTTg1LjcxNiAzNi4xNDZsNS4yNDMtOS41MjFoMTEuMDkzbDUuNDE2IDkuNTIxLTUuNDEgOS4xODVIOTAuOTUzbC01LjIzNy05LjE4NXptNjMuOTA5IDE1LjQ3OWgxMC43NXYxMC43NWgtMTAuNzV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjcxLjUiIGN5PSI3LjUiIHI9IjEuNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjE3MC41IiBjeT0iOTUuNSIgcj0iMS41Ii8+PGNpcmNsZSBmaWxsPSIjMDAwIiBjeD0iODEuNSIgY3k9IjEzNC41IiByPSIxLjUiLz48Y2lyY2xlIGZpbGw9IiMwMDAiIGN4PSIxMy41IiBjeT0iMjMuNSIgcj0iMS41Ii8+PHBhdGggZmlsbD0iIzAwMCIgZD0iTTkzIDcxaDN2M2gtM3ptMzMgODRoM3YzaC0zem0tODUgMThoM3YzaC0zeiIvPjxwYXRoIGQ9Ik0zOS4zODQgNTEuMTIybDUuNzU4LTQuNDU0IDYuNDUzIDQuMjA1LTIuMjk0IDcuMzYzaC03Ljc5bC0yLjEyNy03LjExNHpNMTMwLjE5NSA0LjAzbDEzLjgzIDUuMDYyLTEwLjA5IDcuMDQ4LTMuNzQtMTIuMTF6bS04MyA5NWwxNC44MyA1LjQyOS0xMC44MiA3LjU1Ny00LjAxLTEyLjk4N3pNNS4yMTMgMTYxLjQ5NWwxMS4zMjggMjAuODk3TDIuMjY1IDE4MGwyLjk0OC0xOC41MDV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxwYXRoIGQ9Ik0xNDkuMDUgMTI3LjQ2OHMtLjUxIDIuMTgzLjk5NSAzLjM2NmMxLjU2IDEuMjI2IDguNjQyLTEuODk1IDMuOTY3LTcuNzg1LTIuMzY3LTIuNDc3LTYuNS0zLjIyNi05LjMzIDAtNS4yMDggNS45MzYgMCAxNy41MSAxMS42MSAxMy43MyAxMi40NTgtNi4yNTcgNS42MzMtMjEuNjU2LTUuMDczLTIyLjY1NC02LjYwMi0uNjA2LTE0LjA0MyAxLjc1Ni0xNi4xNTcgMTAuMjY4LTEuNzE4IDYuOTIgMS41ODQgMTcuMzg3IDEyLjQ1IDIwLjQ3NiAxMC44NjYgMy4wOSAxOS4zMzEtNC4zMSAxOS4zMzEtNC4zMSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEuMjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPjwvZz48L3N2Zz4=');
	opacity: 0.1;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 100%;
	position: absolute;
	z-index: -1;
}

.chat-input {
	width: 350px;
}

#chat-input {
	box-sizing: border-box;
	width: 299px;
	position: relative;
	height: 46px;
	padding-top: 10px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 15px;
	border: none;
	resize: none;
	outline: none;
	color: #888;
	overflow: hidden;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	background: #f4f7f9;
}

#chat-input.echo {
	color: deeppink;
	width: 299px;
}

.echo-receiver {
	display: inline-block;
	width: 0;
	font-size: 12px;
	color: deeppink;
	line-height: 46px;
	cursor: pointer;
}

.chat-input>form {
	box-sizing: border-box;
	margin-bottom: 0;
	border: 1px solid #ccc;
	border-top: none;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	background: #f4f7f9;
}

#chat-input::-webkit-input-placeholder{
	/* Chrome/Opera/Safari */
	color : #ccc;
}
#chat-input::-moz-placeholder{
	/* Firefox 19+ */
	color : #ccc;
}
#chat-input:-ms-input-placeholder{
	/* IE 10+ */
	color : #ccc;
}
#chat-input:-moz-placeholder{
	/* Firefox 18- */
	color : #ccc;
}
.chat-submit{
	position : absolute;
	bottom : 6px;
	right : 10px;
	background : transparent;
	box-shadow : none;
	border : none;
	border-radius : 50%;
	color : #43a047;
	width : 35px;
	height : 35px;
	cursor : pointer;
}
.chat-submit:hover {
	color : white;
	background : #43a047;
}
.chat-logs {
	padding : 15px;
	height : 370px;
	overflow-y : scroll;
}
.chat-logs::-webkit-scrollbar-track {
	-webkit-box-shadow : inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color : #F5F5F5;
}
.chat-logs::-webkit-scrollbar {
	width : 5px;
	background-color : #F5F5F5;
}
.chat-logs::-webkit-scrollbar-thumb {
	background-color : #43a047;
}
@media only screen and (max-width: 500px) {
	.chat-logs {
		height: 40vh;
	}
}

#chat-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: #ccc;
}

#chat-input::-moz-placeholder { /* Firefox 19+ */
	color: #ccc;
}

#chat-input:-ms-input-placeholder { /* IE 10+ */
	color: #ccc;
}

#chat-input:-moz-placeholder { /* Firefox 18- */
	color: #ccc;
}

.chat-submit {
	position: absolute;
	bottom: 6px;
	right: 10px;
	background: transparent;
	box-shadow: none;
	border: none;
	border-radius: 50%;
	color: #43a047;
	width: 35px;
	height: 35px;
	cursor: pointer;
}

.chat-submit:hover {
	color: white;
	background: #43a047;
}

.chat-logs {
	padding: 15px;
	height: 370px;
	overflow-y: scroll;
}

.chat-logs::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar {
	width: 5px;
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar-thumb {
	background-color: #43a047;
}
.chat-logs .inout-Msg{
	font-size:10px;
	padding:2px 5px;
	border-radius: 200px;
	background-color:rgba(0,0,0,0.05);
	text-align:center;
	clear:both;
	margin-bottom:10px;
}

@media only screen and (max-width:500px){
	.chat-logs {
		height : 40vh;
	}
}
.receiver {
	float: right;
	font-size: 10px;
	margin-top: 20px;
}

.receiver.echo {
	color: deeppink;
}
.user .receiver, .echo:not(.self) .receiver{
	float:left;
	margin-left:10px;
}

.chat-msg.user>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: left;
	width: 15%;
}

.chat-msg.echo>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: left;
	width: 15%;
}

.chat-msg.self>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: right;
	/* width:15%; */
}

.cm-msg-text {
	background: white;
	padding: 10px 15px 10px 15px;
	color: #666;
	max-width: 55%;
	float: left;
	margin-left: 10px;
	position: relative;
	margin-bottom: 20px;
	border-radius: 30px;
    word-break: break-all;
    white-space:pre;
    display: inline-block;
}

.chat-msg {
	clear: both;
}

.chat-msg.echo>.cm-msg-text {
	background: hotpink;
	color: white;
}

.chat-msg.self>.cm-msg-text {
	float: right;
	margin-right: 10px;
	background: #43a047;
	color: white;
}
.chat-msg.self.echo>.cm-msg-text{
	color:white;
	background: hotpink;
}

.cm-msg-button>ul>li {
	list-style: none;
	float: left;
	width: 50%;
}

.cm-msg-button {
	clear: both;
	margin-bottom: 70px;
}
</style>
</head>
<body>
	<c:if test="${empty loginUser }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/");
		</script>
	</c:if>
	<c:if test="${cookie.w.value != null and cookie.w.value == 'f'}">
		<script>alert("게시글 작성 실패!");</script>	
	</c:if>
	<div id="wrap">
		<!-- 로그아웃 버튼 배치할 테이블 -->
		<table class="header_area">
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<span>${loginUser}님 환영합니다.</span>
						<a href="${cp}/userlogout.us">로그아웃</a>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 타이틀 띄워주는 테이블 -->
		<table class="title">
			<tbody>
				<tr align="center" valign="middle">
					<td>
						<h3>
							<img src="${cp}/images/타이틀.png" class="tit_img">
						</h3>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 게시글 리스트 띄워주는 테이블 -->
		<table class="list">
			<thead>
				<tr align="right" valign="middle">
					<td colspan="6">글 개수 : ${totalCnt}</td>
				</tr>
				<tr align="center" valign="middle">
					<th>번호</th>
					<th colspan="2">제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list != null and list.size() > 0}">
						<c:forEach var="i" begin="0" end="${list.size() - 1}">
							<c:set var="board" value="${list[i]}"/>
							<tr>
								<td>${board.boardnum}</td>
								<td><sup class="hot">Hot</sup></td>
								<td><a href="${cp}/boardview.bo?boardnum=${board.boardnum}&page=${page}&keyword=${keyword}">${board.boardtitle}
								<span id="reply_cnt">[${reply_cnt_list[i]}]</span></a></td>
								<td>${board.userid }</td>
								<td>${board.regdate }</td>
								<td>${board.readcount }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!-- 페이징 처리하는 테이블 -->
		<table class="pagination">
			<tbody>
				<tr align="center" valign="middle">
					<td>
						<c:if test="${startPage != 1}">
							<a href="${cp}/boardlist.bo?page=${startPage-1}&keyword=${keyword}">&lt;</a>
						</c:if>
						<c:forEach begin="${startPage}" end="${endPage}" var="i">
							<c:choose>
								<c:when test="${page == i}">
									<span class="nowPage">${i}</span>
								</c:when>
								<c:otherwise>
									<a href="${cp}/boardlist.bo?page=${i}&keyword=${keyword}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${endPage != totalPage}">
							<a href="${cp}/boardlist.bo?page=${endPage+1}&keyword=${keyword}">&gt;</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table>
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<a class="write" href="${cp}/boardwrite.bo?page=${page}&keyword=${keyword}">글쓰기</a>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 검색 -->
		<div class="search_area">
			<input type="search" id="keyword" name="keyword" value="${keyword}">
			<input type="button" value="검색" onclick="search();">
		</div>
	</div>
	<div id="chat-circle" class="btn btn-raised">
		<div id="chat-overlay"></div>
		<span class="material-symbols-outlined">speaker_phone</span>
	</div>
	<div class="chat-box">
		<div class="chat-box-header">
			사용자 채팅 <span class="chat-box-toggle"><span
				class="material-symbols-outlined">close</span></span>
		</div>
		<div class="chat-box-body">
			<div class="chat-box-overlay"></div>
			<div class="chat-logs"></div>
			<!--chat-log -->
		</div>
		<div class="chat-input">
			<form>
				<input type="hidden" id="userid" name="userid" value="${loginUser}">
				<span class="echo-receiver"></span> <input type="text"
					id="chat-input" placeholder="Send a message..."
					onkeyup="sendEcho();" />
				<button type="submit" class="chat-submit" id="chat-submit">
					<span class="material-symbols-outlined">send</span>
				</button>
			</form>
		</div>
	</div>
</body>
<script>
	function search(){
		const keyword = document.getElementById("keyword");
		//유효성 검사
		location.replace("${cp}/boardlist.bo?keyword="+keyword.value);
	}
	
	const regdate = document.querySelectorAll(".list tbody tr td:nth-child(5)");
	console.log(regdate)
	const now = new Date();
	for(let td of regdate){
		const time = new Date(td.innerText);
		
		if((now.getTime() - time.getTime()) <= 5*60*60*1000){
			td.previousElementSibling.previousElementSibling.previousElementSibling.innerHTML += '<sup class="new">New</sup>'
		}
	}
</script>
</html>







