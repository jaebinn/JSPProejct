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
	img.thumbnail{
		display: block;
		width:200px;
		clear:both;
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
		</table>																			<!-- 파일 데이터를 전송하기 위한 형식 -->
		<form id="boardForm" method="post" name="boardForm" action="${cp}/boardwriteok.bo" enctype="multipart/form-data">
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
						<div style="float:left; padding-left: 10px;">
							<input type="file" name="file0" id="file0" style="display:none">
							<span id="file0name">선택된 파일 없음</span>
						</div>
						<div style="float:right; margin-right:100px;">
							<a href="javascript:upload(0)">파일 선택</a>
							<a href="javascript:cancelFile(0)">첨부 삭제</a>
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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	//현재 업로드된 파일의 개수(가장 마지막 행 번호)
	let i = 0;
	function sendit(){
		const boardForm = document.boardForm;
		//유효성 검사
		boardForm.submit();
	}
	function upload(num){
		$("#file"+num).click();
	}
	//$(선택자).change(함수) : 해당 선택자의 요소에 변화가 일어난다면 넘겨주는 함수 호출
	$("[type=file]").change(function(e){
		//e : 파일이 업로드된 상황 자체를 담고있는 이벤트 객체
		//e.target : 파일이 업로드가 된 input[type=file] 객체(태그객체)
		const fileTag = e.target;
		console.log(fileTag);
		//e.target.files : 파일태그에 업로드가 된 파일들의 배열
		const file = fileTag.files[0];
		console.log(file);
		
		if(file == undefined){
			//업로드 창을 띄웠다가 취소한 경우(파일이 업로드 되었다가 없어진 경우)
			cancelFile(fileTag.id.split("e").pop());
		}
		else{
			//파일을 업로드를 한 경우(없었다가 업로드, 있었는데 다른 파일로 업로드)
			//#file0name 찾아서 내부 텍스트 변경(파일의 이름으로)
			$("#"+fileTag.id+"name").text(file.name);
			//업로드 된 파일의 확장자명			
			let ext = file.name.split(".").pop();
			if(ext == "jpeg" || ext == "png" || ext == "jpg" || ext == "webp" || ext == "gif"){
				//".  file0       _cont"
				$("."+fileTag.id+"_cont .thumbnail").remove();
				const reader = new FileReader();
				reader.onload = function(ie){
					const img = document.createElement("img");
					img.setAttribute("src",ie.target.result);
					img.setAttribute("class","thumbnail");
					document.querySelector("."+fileTag.id+"_cont").appendChild(img);
				}
				reader.readAsDataURL(file);
			}
			else{
				$("."+fileTag.id+"_cont .thumbnail").remove();
			}
			
			//가장 마지막 [파일 선택] 버튼을 눌렀을 때
			if(fileTag.id == "file"+i){
				const cloneElement = $(".r"+i).clone(true);
				i++;
				cloneElement.attr("class","r"+i);
				cloneElement.children("th").text("파일 첨부"+(i+1));
				cloneElement.children("td").attr("class","file"+i+"_cont");
				
				cloneElement.find("input[type='file']").attr("name","file"+i);
				cloneElement.find("input[type='file']").attr("id","file"+i);
				cloneElement.find("input[type='file']").val("");
				
				cloneElement.find("span").attr("id","file"+i+"name");
				cloneElement.find("span").text("선택된 파일 없음");
				
				//								  javascript:upload(  1  )
				cloneElement.find("a")[0].href = "javascript:upload("+i+")";
				//								  javascript:cancelFile(  1  )
				cloneElement.find("a")[1].href = "javascript:cancelFile("+i+")";
				
				//jQuery객체.appendTo("부모선택자") : 해당 선택자의 자식으로 jQuery 객체 추가
				cloneElement.appendTo("#boardForm tbody")
				
			}
		}
	})
	function cancelFile(num){
		//파일 업로드 했다가 취소로 파일을 삭제하는 경우에는 문자열로 넘어온다.
		num = Number(num);
		//가장 마지막 [첨부 삭제] 버튼을 누른 경우
		if(num == i){ return; }
		//tr 지우기
		$(".r"+num).remove();
		//지워진 다음 행 부터 숫자 바꿔주기
		for(let j=num+1;j<=i;j++){
			console.log(j);
			const el = $("#boardForm tbody .r"+j);
			el.attr("class","r"+(j-1));
			
			el.find("th").text("파일 첨부"+j);
			el.find("td").attr("class","file"+(j-1)+"_cont");
			
			el.find("input[type=file]").attr("name","file"+(j-1));
			el.find("input[type=file]").attr("id","file"+(j-1));
			
			el.find("span").attr("id","file"+(j-1)+"name");
			
			el.find("a")[0].href = "javascript:upload("+(j-1)+")";
			el.find("a")[1].href = "javascript:cancelFile("+(j-1)+")";
		}
		i--;
	}
</script>
</html>




