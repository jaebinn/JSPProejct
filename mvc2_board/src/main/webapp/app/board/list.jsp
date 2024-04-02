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
<link href="${cp}/css/style.css" rel="stylesheet">
</head>
<body class="list">
	
	<c:if test="${empty loginUser }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/");
		</script>
	</c:if>
	<c:if test="${cookie.w.value != null and cookie.w.value == 'f'}">
		<script>alert("게시글 작성 실패!");</script>	
	</c:if>
	<div id="wrap" class="list">
		<div></div>
		<!-- 로그아웃 버튼 배치할 테이블 -->
		<table class="header_area">
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<span>${loginUser}님 환영합니다.</span>
						<a class="btn" href="${cp}/userlogout.us">로그아웃</a>
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
								<td><c:if test="${hot_board[i] == 'O'}"><sup class="hot">Hot</sup></c:if></td>
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
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table>
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<a class="write btn" href="${cp}/boardwrite.bo?page=${page}&keyword=${keyword}">글쓰기</a>
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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	window.setTimeout(function(){
		document.querySelector("#wrap.list>div:nth-child(1)").style.display="none";
	},1200)
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
	
	//채팅 구현
	let socket = null;
	let INDEX = 0;
	//채팅 버튼 클릭시 전체 채팅에 접속, 채팅창 열어주기
	$("#chat-circle").click(function(){
		$("#chat-circle").toggle('scale');
		$(".chat-box").toggle('scale');
		socket = new WebSocket('ws://localhost:9090/chat/'+$('#userid').val());
		
		//소켓 연결에 오류가 발생했을 때 수행할 이벤트
		socket.onerror = function(e){}
		//소켓 연결이 열렸을 때 수행할 이벤트
		socket.onopen = function(e){
			socket.send('in : '+$('#userid').val())
		}
		//소켓 연결을 통해 메세지가 전달되었을 때 수행할 이벤트
		socket.onmessage = function(e){
			onMessage(e);
		}
		//소켓 연결을 종료할 때 수행할 이벤트
		socket.onclose = function(e){
			$(".chat-logs").html("");
		}
	})
	//닫기 버튼을 클릭했을 때 호출될 이벤트, 창 닫기, 소켓 접속 종료
	$(".chat-box-toggle").click(function(){
		socket.send('out : '+$("#userid").val());
		$("#chat-circle").toggle('scale');
		$(".chat-box").toggle('scale');
		socket.close();
		socket = null;
	})
	$("#chat-submit").click(function(e){
		e.preventDefault();
		let msg = $("#chat-input").val();
		msg = msg.trim();
		if(msg == ""){
			return false;
		}
		//DOM 구현되어 있는 채팅 로그 생성 함수 호출
		generate_message(msg,'self');
		//appleKHGB안녕
		socket.send($("#userid").val()+"KHGB"+msg);
	})
	
	
	//클라이언트 측에서 메세지를 받았을 때 호출될 이벤트 함수
	function onMessage(e){
		//in : banana
		const message = e.data;
		//in : ---> 누군가가 접속해서 메세지가 날라온 경우
		if(message.substring(0,4) == "in :"){
			//5번 인덱스부터 잘라내면 접속한 사람의 아이디
			let inId = message.substring(5);
			str = '<div class="inout-Msg">'+inId+'님이 들어오셨습니다.</div>';
			$(".chat-logs").append(str);
		}
		//out : ---> 누군가가 종료하면서 메세지가 날라온 경우
		else if(message.substring(0,5) == "out :"){
			let outId = message.substring(6);
			str = '<div class="inout-Msg">'+outId+"님이 나가셨습니다.</div>";
			$(".chat-logs").append(str);
		}
		else{
			let idx = message.indexOf("KHGB");
			let sender = message.substring(0,idx);
			let content = message.substring(idx+4);
			generate_message(content,"user",sender);
		}
	}
	function generate_message(msg, type, sender){
		INDEX++;
		var str = "";
		let receiver = "";
		let content = "";
		content = msg;

		str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
		str += "<span class=\"msg-avatar\">";
		str += "<img src=\"${cp}/app/board/chat_bg2.jpeg\">";
		str += "<\/span>";
		str += "<div class=\"cm-msg-text\">";
		str += content;
		str += "<\/div>";
		if(sender){
			str += "<div class='receiver'>["+sender+"]</div>";
		}
		else{
			str += "<div class='receiver'>모두에게</div>"
		}
		str += "<\/div>";
		$(".chat-logs").append(str);
		$("#cm-msg-" + INDEX).hide().fadeIn(300);
		if (type == 'self') {
			$("#chat-input").val('');
		}
		$(".chat-logs").stop().animate({
			scrollTop : $(".chat-logs")[0].scrollHeight
		}, 1000);
		
		
		const arMsg = document.getElementsByClassName("cm-msg-text");
	
		for (let i = 0; i < arMsg.length; i++) {
			let maxLineWidth = arMsg[i].offsetWidth;
	
			let textContent = arMsg[i].textContent;
	
			let textWords = textContent.split("");
	
			let newContent = "";
	
			let tempContent2 = "";
			
			let first = true;
			for (let j = 0; j < textWords.length; j++) {
				let word = textWords[j];
				const tempContent = newContent + word;
				const tempElement = document.createElement('div');
				tempElement.classList = 'tempEl';
				tempElement.textContent = tempContent2;
	
				tempElement.style.display = 'inline-block';
	
				arMsg[i].appendChild(tempElement);
				
				if(tempElement.offsetWidth >= 160 && first){
					newContent += word;
					tempContent2 += word;
					first = false;
				} else if (tempElement.offsetWidth > 159.8) {
					newContent += '<br>' + word;
					tempContent2 = "";
				} else {
					newContent += word;
					tempContent2 += word;
				}
			}
			arMsg[i].innerHTML = newContent.trim();
		}
	}
	
	
</script>
</html>







