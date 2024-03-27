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
		border-top:1px solid grey;
		padding-top:30px;
	}
	.update_box textarea{
		width:500px; height:80px;
	}
	.update_box td:last-child{
		vertical-align: top;
	}
	.update_box .btns a{
		display: inline-block;
		width:70px; height:30px; line-height: 30px;
		text-align: center; vertical-align: middle;
		margin-top:20px;
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
			<tr class="no-file">
				<td colspan="2">첨부 파일이 없습니다.</td>
			</tr>
			<tr>
				<th>첨부파일1</th>
				<td>
					<a href="#">파일명</a>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<img style="" src="">
				</td>
			</tr>
		</table>
		<table class="btn_area">
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<c:if test="${board.userid == loginUser}">
							<a href="#">수정</a>
							<a href="${cp}/boarddelete.bo?boardnum=${board.boardnum}&page=${param.page}&keyword=${param.keyword}">삭제</a>
						</c:if>
						<a href="${cp}/boardlist.bo?page=${param.page}&keyword=${param.keyword}">목록</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="reply_line">
			<form name="replyForm" method="post" action="#">
				<table class="write_box">
					<tbody>
						<tr>
							<td>댓글</td>
							<td>
								<textarea name="replycontents"></textarea>
								<a href="#">등록</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<table class="update_box">
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>




