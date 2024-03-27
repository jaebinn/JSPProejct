<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
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
	
	#boardForm tr{
		height:30px;
	}
	#boardForm tr:nth-child(3){
		height:300px;
	}
	#boardForm th{
		text-align: center; vertical-align: middle;
		width:150px;
	}
	#boardForm tr:nth-child(n+4){
		height:50px;
	}
	#boardForm a{
		padding:5px 10px;
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
</style>
</head>
<body>
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
		<form id="boardForm" method="post" name="boardForm" action="${cp}/boardwriteok.bo">
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="boardtitle" maxlength="50" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="userid" maxlength="50" value="${loginUser}" readonly>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="boardcontents"></textarea>
					</td>
				</tr>
				<tr class="r0">
					<th>파일 첨부1</th>
					<td class="file0_cont">
						<div style="float:left;">
							<input type="file" name="file0" id="file0" style="display:none">
							<span id="file0name">선택된 파일 없음</span>
						</div>
						<div style="float:right; margin-right:100px;">
							<a href="#">파일 선택</a>
							<a href="#">첨부 삭제</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<table class="btn_area">
			<tbody>
				<tr align="right" valign="middle">
					<td>
						<a href="javascript:sendit();">등록</a>
						<a href="${cp}/boardlist.bo?page=${param.page}&keyword=${param.keyword}">목록</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script>
	function sendit(){
		const boardForm = document.boardForm;
		//유효성 검사
		boardForm.submit();
	}
</script>
</html>




