<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="${cp}/css/main.css"/>
		<%-- <link rel="stylesheet" href="${cp}/css/register.css"/> --%>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">

						<!-- Logo -->
							<div class="logo">
								<a href="${cp}/index.jsp"><strong>everycare</strong> </a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="current"><a href="${cp}/index.jsp">Home</a></li>
									<li><a href="${cp}/expertlist.ep">전문가매칭</a></li>
									<li>									
										<a href="${cp}/u_boardlist.ub" class="icon solid fa-angle-down" style="pointer-events: none;">게시판</a>
										<ul>
											<li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
											<li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
											<li><a href="${cp}">리뷰게시판</a></li>
										</ul>
									</li>
									<li>
										<a href="${cp}/" class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
										<ul>
											<li><a href="${cp}/">유저 정보</a></li>
											<li><a href="${cp}/">전문가 정보</a></li>
										</ul>
									</li>									
									<c:if test="${empty sessionScope.loginUser}">
									    <!-- 세션이 없을 때 (로그인되지 않은 상태) -->
									    <li><a href="${cp}/app/user/user-login.jsp"><input type="button" value="로그인" id="login_btn"></a></li>
									</c:if>
									<c:if test="${not empty sessionScope.loginUser}">
									    <!-- 세션이 있을 때 (로그인된 상태) -->
									    <li><a href="${cp}/expertok.ep"><input type="button" value="전문가등록" id="expert_btn"></a></li>
									    <li><a href="${cp}/app/user/user-logout.jsp"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									</c:if>
								</ul>
							</nav>
					</header>
					<!-- inner alt -->
					<!-- Banner  -->
					<section id="banner">
						<div class="content primary">
							<form action="${cp}/expertok.ep" method="post" name="expertAddForm" enctype="multipart/form-data">
								<div class="box2">
									<h2>전문가 등록</h2>
									<h4>당신의 도움이 필요합니다.</h4>
									<table id="info_box">
										<tr>
											<div id="imgArea" name="imgArea" onclick="uploadFile()">
												프로필사진
											</div>
											<input type="file" id="fileArea" name="fileArea" onchange="previewFile()">
											<input type="hidden" id="orgFileName" name="orgFileName" value="">
										</tr>
										<tr>
											<td id="e_id">아이디</td>
											<td colspan="3">
												<input type="text" id="e_id_value" name="e_id_value" value="${loginUser}" readonly>
											</td>
										</tr>
										<tr>
											<td id="is_drivable">운전가능여부</td>
											<td colspan="3">
												<input type="button" id="is_drivable_yes" name="is_drivable_yes" value="가능" onclick="is_drivable('is_drivable_yes')">
												<input type="button" id="is_drivable_no" name="is_drivable_no" value="불가능" onclick="is_drivable('is_drivable_no')">
											</td>
										</tr>
										<tr>
											<td id="location">근무가능지역</td>
											<td colspan="3">
												<input type="text" id="location_value" name="location_value" placeholder="Ex : 경기도 안양시, ...">
											</td>
										</tr>
										<tr>
											<td id="available_time">근무가능시간</td>
											<td colspan="3">
												<input type="text" id="available_time_value" name="available_time_value" placeholder="Ex : 오전(6시~12시), 오후(12시~), ...">
											</td>
										</tr>
										<tr>
											<td id="cost">시간당 급여</td>
											<td colspan="3">
												<input type="text" id="cost_value" name="cost_value" placeholder="Ex : 20000">
											</td>
										</tr>
										<tr>
											<td>계좌정보</td>
											<td colspan="3">
												<input type="text" id="account" name="account" placeholder="Ex : 우리은행 xxxxxxxxx('-'빼고입력) 예금주명">
											</td>
										</tr>
										<tr>
											<td id="resume">자기소개</td>
											<td colspan="3">
												<textarea id="resume_value" name="resume_value" cols="30" rows="10"></textarea>
											</td>
										</tr>
										<tr>
											<td id="keyword">키워드</td>
											<td colspan="3">
												<div>
													<div class="keyword_input">
														<input type="text" id="keyword_value" name="keyword_value" placeholder="Ex : 자신을 나타내는 키워드" onkeyup="keywordKeyup();">																								
														<input type="button" value="추가" id="addbutton" onclick="addKeyword();">
													</div>
													<div class="keyword_list" id="keyword_list"></div>
													<input type="hidden" value="" name="keywordH" class="keywordH">
												</div>
											</td>
										</tr>
										<tr class="careerRow">
											<td>
												경력사항1
											</td>
											<td id="line1" colspan="3">
												<input type="text" id="career_name" name="career_name" placeholder="Ex : 전 근무지명">
											</td>
										</tr>
										<tr class="careerRow">
											<td>입사일자</td>
											<td>
												<input type="text" id="start_time" name="start_time" placeholder="Ex : 20240401">
											</td>
											<td>퇴사일자</td>
											<td>
												<input type="text" id="end_time" name="end_time" placeholder="Ex : 20240402">
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<input type="button" value="추가 하기" id="careerAdd" onclick="addRow()">
												<input type="button" value="삭제 하기" id="careerDelete" onclick="deleteRow()">
											</td>
										</tr>
										<tr class="licenseRow">
											<td id="license1">자격증명1</td>
											<td>
												<input type="text" id="license_name" name="license_name" placeholder="Ex : 사회복지사">
											</td>
											<td id="license_get1">취득일자</td>
											<td>
												<input type="text" id="acquire_date" name="acquire_date" placeholder="Ex : 20210221">
											</td>
										<tr>
											<td colspan="4">
												<input type="button" value="추가 하기" id="licenseAdd" name="licenseAdd" onclick="licenseRowAdd()">
												<input type="button" value="삭제 하기" id="licenseDelete" name="licenseDelete" onclick="licencRowDelete()">
											</td>
										</tr>
										</tr>
									</table>
									<div class="btn_area">
										<input type="button" value="등록 완료" onclick="sendit()">
									</div>
							</form>
						</div>
						<video src="images/banner.mp4" muted autoplay loop playsinline></video>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h3>EveryCare</h3>
								<p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해 사용자들이 안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
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
								<p>EveryCare 고객센터는 여러분의 궁금증이나 문의사항에 친절하고 신속하게 대응해 드립니다. 저희 팀은 24시간 365일 연중무휴로 운영되며, 다음과 같은 서비스를 제공합니다.<p>
								<p><a href="#" class="major">(000) 000-0000</a></p>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; EveryCare. All rights reserved.</p>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script> const cp = '${cp}';</script>
			<script src="${cp}/js/jquery.min.js"></script>
			<script src="${cp}/js/jquery.dropotron.min.js"></script>
			<script src="${cp}/js/jquery.selectorr.min.js"></script>
			<script src="${cp}/js/jquery.scrollex.min.js"></script>
			<script src="${cp}/js/jquery.scrolly.min.js"></script>
			<script src="${cp}/js/browser.min.js"></script>
			<script src="${cp}/js/breakpoints.min.js"></script>
			<script src="${cp}/js/util.js"></script>
			<script src="${cp}/js/main.js"></script>

	</body>
</html>
<script>
	let i = 0; // 경력 추가버튼
	let j = 0; // 자격증 추가버튼
	const arKeyword = [];
	// 운전여부 클릭시 이벤트
	function is_drivable(elementId) {
		var button = document.getElementById(elementId);
		var otherButtonId = (elementId === "is_drivable_yes") ? "is_drivable_yes" : "is_drivable_no";
		var otherButton = document.getElementById(otherButtonId);

      if (!button.classList.contains("selected")) {
        // 현재 클릭된 버튼에 selected 클래스추가
        button.classList.add("selected");
        // 다른 버튼에 selected 클래스가 부여되어 있다면 제거
        if (otherButton.classList.contains("selected")) {
          otherButton.classList.remove("selected");
        }
      } else {
        // 클릭된 버튼이 selected 클래스를 가지고 있다면 제거
    	button.classList.remove("selected");
      }
      console.log(otherButton);  
    }
		
	// 경력입력란 추가
	function addRow() {
		i++
		var careerRow = document.getElementsByClassName("careerRow");
		
		if(careerRow.length >= 5) {
			alert("최대 2개까지만 추가 가능합니다.")
			return;
		}
		var careerTr = document.createElement('tr'); // 경력사항 tr 생성
		var newtd1 = document.createElement('td'); // 경력사항 td1
		var newtd2 = document.createElement('td'); // 경력사항 td2
		var input = document.createElement("input"); // input태그 생성하는 변수 생성
		newtd1.innerHTML="경력사항"+(i+1); //  td1에 HTML문 기입 1
		input.setAttribute("type","text"); // input type속성 지정
		input.setAttribute("id","career_name"); // input id속성 지정 1
		input.setAttribute("name","career_name"); // input name속성 지정 1
		input.setAttribute("placeholder","Ex : 전 근무지명"); // placeholder속성 지정
		newtd2.id = "line1";
		newtd2.colSpan = 3;
		newtd2.appendChild(input); // td2의 자식개체로 삽입
		careerTr.appendChild(newtd1); // td1을 tr의 자식개체로 삽입
		careerTr.appendChild(newtd2); // td2를 tr의 자식개체로 삽입
		careerTr.classList.add("careerRow"); //careerTr에 클래스속성 지정
		// 새로생긴 tr에 careerRow을 지정해줘야 한번더 눌렀을때 이 tr 아래로 생성됨
		
		var careerTr2 = document.createElement('tr');
		var newtd3 = document.createElement('td');
		var newtd4 = document.createElement('td');
		var newtd5 = document.createElement('td');
		var newtd6 = document.createElement('td');
		var input2 = document.createElement("input");
		var input3 = document.createElement("input");
		
		newtd3.innerHTML="입사일자";
		input2.setAttribute("type","text");
		input2.setAttribute("id","start_time"); // 1
		input2.setAttribute("name","start_time"); // 1
		input2.setAttribute("placeholder","2024.04.01");
		newtd4.appendChild(input2);
		
		newtd5.innerHTML="퇴사일자";
		input3.setAttribute("type","text");
		input3.setAttribute("id","end_time"); // 1
		input3.setAttribute("name","end_time"); // 1
		input3.setAttribute("placeholder","2024.04.02");
		newtd6.appendChild(input3);
		
		careerTr2.classList.add("careerRow");
		careerTr2.appendChild(newtd3);
		careerTr2.appendChild(newtd4);
		careerTr2.appendChild(newtd5);
		careerTr2.appendChild(newtd6);
		
		careerRow[careerRow.length-1].after(careerTr);
		careerRow[careerRow.length-1].after(careerTr2);

		// careerRow마지막 배열의 그 다음에 carrerTr 삽입
	}

	// 경력입력란 삭제
	function deleteRow() {
		var careerRow = document.getElementsByClassName("careerRow");
		if(careerRow.length > 2) {
			// HTMLCollection을 배열로 변환
			var careerArray = Array.from(careerRow);
			// 배열의 마지막 요소와 그 이전 요소 지우기
			careerArray[careerArray.length - 1].remove();
			careerArray[careerArray.length - 2].remove();
			i--;
		} else {
			alert("첫번째 입력란입니다!");
		}
	}

	// 자격증 입력란 추가
	function licenseRowAdd() {
		j++;
		var licenseRow = document.getElementsByClassName("licenseRow");
		
		if(licenseRow.length >= 3) {
			alert("최대 2개까지만 추가 가능합니다.")
			return;
		}
		var licenseTr = document.createElement('tr');
		var licensetd1 = document.createElement('td');
		var licensetd2 = document.createElement('td');
		var licensetd3 = document.createElement('td');
		var licensetd4 = document.createElement('td');
		var li_input1 = document.createElement("input");
		li_input1.setAttribute("type","text");
		li_input1.setAttribute("id","license_name"); // 1
		li_input1.setAttribute("name","license_name"); // 1
		li_input1.setAttribute("placeholder","Ex : 사회복지사");
		var li_input2 = document.createElement("input");
		li_input2.setAttribute("type","text");
		li_input2.setAttribute("id","acquire_date"); // 1
		li_input2.setAttribute("name","acquire_date"); // 1
		li_input2.setAttribute("placeholder","Ex : 2021.02.21");

		licensetd1.innerHTML="자격증명"+(j+1);
		licensetd2.appendChild(li_input1);
		licensetd3.innerHTML="취득일자";
		licensetd4.appendChild(li_input2);

		licenseTr.classList.add("licenseRow");
		licenseTr.appendChild(licensetd1);
		licenseTr.appendChild(licensetd2);
		licenseTr.appendChild(licensetd3);
		licenseTr.appendChild(licensetd4);

		licenseRow[licenseRow.length-1].after(licenseTr);
	}
	// 자격증 입력란 삭제
	function licencRowDelete() {
		var licenseRow = document.getElementsByClassName("licenseRow");

		if(licenseRow.length > 1) {
			var licenseArray = Array.from(licenseRow);

			licenseArray[licenseArray.length - 1].remove();
			j--;
		} else {
			alert("첫번째 입력란입니다!");
		}
	}
	
	// 키워드
	
	function addKeyword() {
		
		const expertAddForm = document.expertAddForm;
		const keyword_list = document.getElementsByClassName("keyword_list")[0];
		const keyword_value = expertAddForm.keyword_value;
		
		if(keyword_value.value == "") {
			alert("자신을 나타내는(능력,자격증 등)키워드를 입력해주세요!");
			keyword_value.focus();
			return;
		}
		
		if(arKeyword.indexOf(keyword_value.value) != -1) {
			alert("중복된 키워드입니다!");
			keyword_value.focus();
			keyword_value.value = "";
			return;
		}
		
		if(arKeyword.length == 5) {
			alert("키워드는 5개 이하로 입력해주세요!")
			return;
		}
		
		const inputKw = document.createElement("span");
		inputKw.classList = "keywordH";
		inputKw.name = "keywordH";
		inputKw.innerHTML = keyword_value.value;
		arKeyword.push(keyword_value.value);
		
		const xBox = document.createElement("a");
		xBox.classList = "xBox";
		inputKw.appendChild(xBox);
		inputKw.addEventListener('click',deletekeyword_value);
		keyword_list.appendChild(inputKw);
		
		keyword_value.value = "";
		keyword_value.focus();	
	}
	
	// 키워드(엔터눌렀을때 추가(addKeyword))
	function keywordKeyup() {
		if(window.event.keyCode == 13) {
			addKeyword();
		}
	}
	
	// 키워드 삭제 이벤트
	function deletekeyword_value(e) {
		let deleteNode = null;
		if(e.target.classList == "xBox") {
			deleteNode = e.target.parentNode;
		} else {
			deleteNode = e.target;
		}
		
		let txt = deleteNode.innerText;
		console.log(txt);
		for(let i in arKeyword) {
			if(arKeyword[i] == txt) {
				arKeyword.splice(i,1);
				break;
			}
		}
		deleteNode.remove();
	}
	
	// 파일 업로드
	
	// #fileArea 디스플레이를 none으로 해놓고 div박스클릭시 클릭되게 구현
    function uploadFile() {
        document.getElementById("fileArea").click();
    }

    // 미리보기
    function previewFile() {
        var fileArea = document.getElementById("fileArea");
        var file = document.querySelector("input[type=file]").files[0];   
        var imgArea =  document.getElementById("imgArea");
        var orgFileName = document.getElementById("orgFileName");
        var reader = new FileReader();
        var imageUrl = "url('/images/기본프사.png')";

        if(file == undefined) {
            imgArea.style.backgroundImage = imageUrl;
            imgArea.textContent = "프로필 사진";
            orgFileName.value = "";
        } else {
        	// 업로드된 파일이 있다면
        	// 파일을 읽고 이를 Base64 형식의 데이터 URL로 변환
            reader.readAsDataURL(file);
        	// 읽은 파일의 name을 orgFileName.value에 할당
            orgFileName.value = file.name;
        	// 강아지1.img 라고 가정할때 "."을 기준으로 문자열 2개로 나눠서 마지막 문자열을 가져옴
        	let ext = file.name.split(".").pop();
        	
        	// 만약 업로드 파일형식이 사진 등이라면
        	if(ext == "png" || ext == "jpg" || ext == "webp" || ext == "gif") {
        		// 프로필창에 미리보기  사진 삽입
		        reader.onloadend = function () {
		            imgArea.style.backgroundImage = "url(" + reader.result + ")";
		            imgArea.innerHTML = "";
		        }	
        	} else {
        		alert("유효하지 않은 파일형식 입니다!");
                imgArea.style.backgroundImage = "none";
                orgFileName.value = "";
        	}
        }
    };
    
    // 이미지 파일 클릭 시 파일 삭제
    document.getElementById("imgArea").addEventListener("click", function() {
        // 파일 영역을 초기화하고, 이미지 영역도 초기화
        imgArea.style.backgroundImage = imageUrl;
        imgArea.textContent = "프로필 사진";
        fileArea.value = null;
    });
    
	// 제출
	
	function sendit() {
		
//		var cookieId = cookie.joinid.value;
		const expertAddForm = document.expertAddForm;
		var viewId = expertAddForm.e_id_value.value;
		var drivebleYes = document.getElementById("is_drivable_yes");
		var drivebleNo = document.getElementById("is_drivable_no");
		var location = document.getElementById("location_value")
		var Pettern1 = /^[가-힣a-zA-Z\d\s]*$/; // 한글과 숫자,영어
		var available_time = document.getElementById("available_time_value");
		var keyword = document.getElementById("keyword_value");
		var cost = document.getElementById("cost_value");
		var account = document.getElementById("account");
		var resume = document.getElementById("resume_value");
		var carrer = document.getElementById("career_name");
		var start = document.getElementById("start_time");
		var end = document.getElementById("end_time");
		var license = document.getElementById("license_name");
		var acquire = document.getElementById("acquire_date");
		var Pettern2 = /^[0-9]+$/; // 숫자
		var isDrivableYes = document.getElementById("is_drivable_yes").style.backgroundColor === "slateblue";
		var isDrivableNo = document.getElementById("is_drivable_no").style.backgroundColor === "slateblue";
		var Pettern3 = /^[가-힣0-9\s]+$/; // 한글, 숫자
		var Pettern4 = /^[가-힣\s]{1,300}$/; // 한글 300자
		var pettern5 = /^[1-9]\d{7}$/; // 8자리수의 숫자를 입력받되 첫글자가 0이면 안됨
		
		// 아이디
		if(viewId == null || viewId == "") {
			alert("로그인 후 등록이 가능합니다!");
			return;
		}
		
		// 쿠키로 가져와 저절로 들어가는 아이디부분을 바꿨을 경우 (readonly걸어놓을거임)
//		if(viewId != cookiId) {
//			alert("로그인 정보와 아이디가 일치하지 않습니다!");
//			return;
//		}
		
		// 운전가능여부
		if(!isDrivableYes && !isDrivableNo) {
			alert("운전가능여부를 선택하지 않으셨습니다. 가능과 불가능 중 하나를 꼭 선택해주세요!");
			return;
		}
		
		// 근무가능지역
		if(location.value.trim() === "" || location.value.trim() === null) {
			alert("근무가능한 지역을 입력해주세요!");
			location.focus();
			return;
		}
		
		// 근무가능지역 한글과 숫자,영어만 입력제한
		if(!Pettern1.test(location.value.trim())) {
			alert("근무가능지역에는 한글과 숫자, 영어만 입력이 가능합니다");
			location.focus();
			return;
		}
		
		// 근무가능시간
		if(available_time.value.trim() === "" || available_time.value.trim() === null) {
			alert("근무가능한 시간을 입력해주세요! Ex : 오전, 오후, 오전or오후 HH:MM");
			available_time.focus();
			return;
		}
		
		// 시간당 급여
		if(cost.value === "" || cost.value === null) {
			alert("시간당 희망급여를 입력해주세요!");
			cost.focus();
			return;
		}
		
		// 시간당 급여 숫자 입력제한
		if(!Pettern2.test(cost.value)) {
			alert("시간당 급여에는 ','를 포함하면 안되며 숫자 정수만 입력이 가능합니다!");
			cost.focus();
			return;
		}
		
		// 계좌정보
		if(account.value === "" || account.value === null) {
			alert("계좌정보를 입력해주세요! (Ex : 우리은행 123456789('-'제외)예금주명)");
			account.focus();
			return;
		}
		
		// 계좌정보 한글과 숫자만 입력제한
		if(!Pettern3.test(account.value)) {
			alert("계좌정보에는 한글과 숫자만 입력이 가능 합니다");
			account.focus();
			return;
		}
		
		// 자기소개
		if(resume_value.value == "" || resume_value.value == null) {
			alert("자기소개를 입력해주세요!")
			resume_value.focus();
			return;
		}
		
		// 자기소개 한글입력제한과 글자 수 제한
		if(!Pettern4.test(resume_value.value)) {
			alert("자기소개에는 한글만 입력 가능하며 300자를 초과할 수 없습니다!")
			resume_value.focus();
			return;
		}
		
		if(arKeyword.length == 0) {
			alert("키워드는 적어도 1개 이상 입력해 주세요!");
			documentgetElementById("keyword_value").focus();
			return;
		}
		
		const keywordTag = expertAddForm.keywordH;
		keywordTag.value = arKeyword.join(",");
		
		alert("등록이 완료되었습니다!");
		expertAddForm.submit();
	}  
</script>

