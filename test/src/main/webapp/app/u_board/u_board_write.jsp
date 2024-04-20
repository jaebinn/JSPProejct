<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="${cp}/css/main.css" />
        <link rel="stylesheet" href="${cp}/css/u_boardwrite.css">
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
									<li><a href="${cp}/expertsort.ep?psort=1">전문가매칭</a></li>
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
									            <li><a href="${cp}/app/expertChat/expertChatList.jsp"><input type="button" value="전문가채팅" id="expert_chat"></a></li>	
									             <!-- <span class="note-num"></span>	 -->				            
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
                        <form id="boardForm" method="post" name="boardForm" action="${cp}/u_boardwrite.ub" enctype="multipart/form-data">
                            <table border="1">
                                <tr>
                                    <th style="text-align: center;">제목</th>
                                    <td colspan="2">
                                        <input type="text" name="title" maxlength="50" placeholder="제목을 입력하세요">
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:center;">작성자</th>
                                    <td colspan="2">
                                        <input type="text" name="user_id" maxlength="50" value="${loginUser}">
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align:center;">내용</th>
                                    <td colspan="2">
                                        <textarea name="contents" rows="20" style="resize:none;"></textarea>
                                    </td>
                                </tr>
                                <tr class="r0">
                                   <th style="text-align: center; vertical-align: middle;">파일 첨부1</th>
                                    <td class="file0_cont">
                                        <div style="float:left; padding-left: 10px;">
                                            <input type="file" name="file0" id="file0" style="display:none">
                                            <span id="file0name">선택된 파일 없음</span>
                                        </div>
                                        <div class="file-area">
                                            <a href="javascript:upload(0)" style="margin-right:20px;">
												<input type="button" value="파일 선택">
											</a>
                                            <a href="javascript:cancelFile(0)">
                                            	<input type="button" value="첨부 삭제">
                                            </a>
                                        </div>                                   
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <table class="btn-area">
                            <tbody>
                                <tr>
                                    <td>
                                        <a href="javascript:sendit();">
											<input type="button" value="등록">
										</a>
                                    </td>
                                    <td>
                                        <a href="${cp}/u_boardlist.ub?page=${param.page}">
											<input type="button" value="목록">
										</a>                                    
                                    </td>
                                </tr>
                            </tbody>
                        </table>
					</section>

				
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h3>Nullam sed gravida</h3>
								<p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus sed magna gravida non.</p>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
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
								<p>Sed vulputate sem tristique cursus sed magna gravida non lorem ipsum dolor sit amet.<p>
								<p><a href="#" class="major">(000) 000-0000</a></p>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; Untitled. All rights reserved.</p>
						</div>
					</footer>

			</div>
	</body>

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
					img.setAttribute("width", "200");
					img.setAttribute("height", "100");
					img.style.marginLeft = "50px"
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
				cloneElement.find("th").css({"text-align": "center", "vertical-align": "middle"});
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