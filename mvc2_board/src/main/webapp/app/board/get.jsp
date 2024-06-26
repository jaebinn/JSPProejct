<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get</title>
<style>
	body{ background: #fff; }
	table{
		border:none;
		width:900px;
		border-collapse: collapse;
	}
	#wrap{
		width:1000px;
		margin:0 auto;
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
	
	a {
		display: inline-block;
		border-radius: 3px;
		background-color: rgb(0, 200, 80);
		color: #fff;
		font-weight: bold;
		text-decoration: none;
	}
	.header_area a {
		width: 100px;
		padding: 10px;
		text-align: center;
	}
	.header_area span {
		font-weight: bold;
	}
	
	.board_area{ border-collapse: collapse; }
	.board_area tr{
		height:30px;
	}
	.board_area tr:nth-child(3) td{
		padding-left: 5px;
	}
	.board_area tr:nth-child(4){
		height:300px;
	}
	.board_area th{
		text-align: center; vertical-align: middle;
		width:150px;
	}
	.board_area tr:nth-child(n+4){
		height:50px;
	}
	.board_area tr.no-file td{
		text-align: center;
	}
	.board_area a{
		background-color: transparent;
		margin-left: 20px;
		color:rgb(0,200,80);
	}
	.board_area a:hover{
		transform:scale(1.1);
		transition:all ease 0.2s;
	}
	input[type="text"],textarea{
		border:none;
		padding:5px;
		outline:none;
	}
	input[type="text"]{ width:500px; }
	textarea{
		resize:none;
		width:700px; height:290px;
	}
	.btn_area a{
		text-align: center;
		padding:10px;
		width:100px;
		margin-top:20px;
	}
	.reply_line{
		width:900px;
		margin-top:20px;
		border-top:1px solid grey;
		padding-top:30px;
	}
	.reply_line table tbody tr td:first-child{
		width:150px; text-align: center;
	}
	.reply_line form:nth-child(2){
		border-top:1px solid grey;
		margin-top:20px;
	}
	.write_box{ padding-bottom: 40px;}
	.write_box > tbody > tr > td+td{
		position: relative;
	}
	.write_box textarea, .update_box textarea{
		padding:5px 10px;
		width:600px; height:70px;
		resize:none; outline:none;
		border:1px solid rgba(0,200,80,0.5); border-radius: 5px;
	}
	.write_box a{
		display: inline-block;
		text-align: center;
		padding:10px;
		width:90px;
		position: absolute;
		top:22px; right:0;
	}
	.update_box{
		margin-top:20px;
	}
	.update_box tbody{
		margin-top : 20px;
	}
	.update_box tr{
		height:120px;
	}
	.update_box textarea{
		width:500px; height:80px;
	}
	.update_box td:last-child{
		text-align:center;
		vertical-align: middle;
	}
	.update_box .btns a{
		display: inline-block;
		width:70px; height:30px; line-height: 30px;
		text-align: center; vertical-align: middle;
		margin-top:15px;
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
		<table border="1" class="board_area">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="boardtitle" value="${board.boardtitle}" readonly>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="userid" value="${board.userid}" readonly>
				</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${board.readcount}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="boardcontents" readonly>${board.boardcontents}</textarea>
				</td>
			</tr>
			<c:choose>
				<c:when test="${files != null and files.size()>0 }">
					<c:forEach var="i" begin="0" end="${files.size()-1}">
						<c:set var="file" value="${files[i]}"/>
						<tr>
							<th>첨부파일${i+1}</th>
							<td>
								<a href="${cp}/filedownload.bo?systemname=${file.systemname}&orgname=${file.orgname}">${file.orgname}</a>
							</td>
						</tr>
						<%-- items에 있는 문자열을 delims 기준으로 분할하고, 분할된 갯수만큼 반복 --%>
						<%-- 분할된 애들을 매 반복마다 token이라는 변수로 가져오면서 반복 --%>
						<%-- varStatus에 적힌 변수에 "token" 변수의 상태들이 저장됨(몇 번째인지, 첫번째 반복인지, ...) --%>
						<%-- ex) apple.png ---> token : 첫 반복 때 apple, 마지막 반복 때 png --%>
						<%-- ex) png.txt ---> token : 첫 반복 때 png, 마지막 반복 때 txt --%>
						<c:forTokens items="${file.orgname }" delims="." var="token" varStatus="tokenStat">
							<%-- c:forTokens 반복의 가장 마지막 반복일 때 --%>
							<c:if test="${tokenStat.last}">
								<%-- 그 때 가져오는 token은 확장자 일것이고, 그림 파일인지 확인 --%>
								<c:if test="${token eq 'jpeg' or token eq 'jpg' or token eq 'png' or token eq 'gif' or token eq 'webp' }">
									<!-- 썸네일 제작 -->
									<tr>
										<th></th>
										<td>
											<img style="width:200px;" src="${cp}/file/${file.systemname}">
										</td>
									</tr>
								</c:if>
							</c:if>
						</c:forTokens>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr class="no-file">
						<td colspan="2">첨부 파일이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			
		</table>
		<table class="btn_area">
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<c:if test="${board.userid == loginUser}">
							<a href="${cp}/boardupdate.bo?boardnum=${board.boardnum}&page=${param.page}&keyword=${param.keyword}">수정</a>
							<a href="${cp}/boarddelete.bo?boardnum=${board.boardnum}&page=${param.page}&keyword=${param.keyword}">삭제</a>
						</c:if>
						<a href="${cp}/boardlist.bo?page=${param.page}&keyword=${param.keyword}">목록</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="reply_line">
			<form name="replyForm" method="post" action="${cp}/replywrite.rp">
				<input type="hidden" name="boardnum" value="${board.boardnum}">
				<input type="hidden" name="page" value="${param.page}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<table class="write_box">
					<tbody>
						<tr>
							<td>댓글</td>
							<td>
								<textarea name="replycontents"></textarea>
								<a href="javascript:document.replyForm.submit();">등록</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<form name="updateForm" method="post">
				<input type="hidden" name="boardnum" value="${board.boardnum}">
				<input type="hidden" name="page" value="${param.page}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<input type="hidden" name="replynum" value="">
				<input type="hidden" name="i" value="">
				<table class="update_box">
					<tbody>
						<c:if test="${replies.size()>0}">
							<c:forEach var="i" begin="0" end="${replies.size()-1}">
								<c:set var="reply" value="${replies[i]}"/>
								<tr>
									<td>${reply.userid}</td>
									<td>
										<textarea readonly name="reply${i}" id="reply${i}" class="replycontents">${reply.replycontents}</textarea>
									</td>
									<td>
										${reply.regdate}<c:if test="${reply.updatechk == 'o'}">(수정됨)</c:if>
										<c:if test="${reply.userid == loginUser}">
											<div class="btns">
												<a href="javascript:updateReply(${i})" id="start${i}">수정</a>
												<a href="javascript:updateReplyOk(${i},${reply.replynum})" style="display:none;" id="end${i}">수정완료</a>
												<a href="javascript:deleteReply(${reply.replynum})">삭제</a>
											</div>
										</c:if>
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
	</div>
</body>
<script>
	const updateForm = document.updateForm;
	let flag = false;
	function deleteReply(replynum){
		updateForm.setAttribute("action","${cp}/replydelete.rp");
		updateForm.replynum.value = replynum;
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
			flag = true;
		}
		else{
			alert("수정중인 댓글이 있습니다!");
		}
	}
	function updateReplyOk(i,replynum){
		updateForm.setAttribute("action","${cp}/replyupdate.rp");
		updateForm.replynum.value = replynum;
		updateForm.i.value = i;
		updateForm.submit();
	}
</script>
</html>









