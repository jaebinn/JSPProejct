<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cp}/css/css.css"/>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">

						<!-- Logo -->
							<div class="logo">
								<a href="index.html"><strong>Hypothesis</strong> <span class="extra">by Pixelarity</span></a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="current"><a href="index.html">Home</a></li>
									<li>
										<a href="#" class="icon solid fa-angle-down">Dropdown</a>
										<ul>
											<li><a href="#">Option One</a></li>
											<li><a href="#">Option Two</a></li>
											<li><a href="#">Option Three</a></li>
											<li>
												<a href="#">Submenu</a>
												<ul>
													<li><a href="#">Option One</a></li>
													<li><a href="#">Option Two</a></li>
													<li><a href="#">Option Three</a></li>
													<li><a href="#">Option Four</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="generic.html">Generic</a></li>
									<li><a href="elements.html">Elements</a></li>
								</ul>
							</nav>

					</header>
					<!-- inner alt -->
					<!-- Banner -->
					<section id="banner">
						<div class="content primary">
							<form action="${cp}/expertok.ep" method="post" name="expertAddForm">
								<div class="box2">
									<h2>전문가 등록</h2>
									<h4>당신의 도움이 필요합니다.</h4>
									<table id="info_box">
										<tr>
											<td id="e_id">아이디</td>
											<td colspan="3">
												<input type="text" id="e_id_value" name="e_id_value" value="">
											</td>
										</tr>
										<tr>
											<td id="is_drivable">운전가능여부</td>
											<td colspan="3">
												<input type="button" id="is_driveable_yes" name="is_driveable_yes" value="가능" onclick="is_drivable('is_drivable_yes')">
												<input type="button" id="is_driveable_no" name="is_driveable_no" value="불가능" onclick="is_drivable('is_drivable_no')">
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
											<td id="keyword">키워드</td>
											<td colspan="3">
												<input type="text" id="keyword_value" name="keyword_value" placeholder="Ex : 자격증명 or 맡을업무">
											</td>
										</tr>
										<tr>
											<td id="cost">시간당 급여</td>
											<td colspan="3">
												<input type="text" id="cost_value" name="cost_value" placeholder="Ex : 20000">
											</td>
										</tr>
										<tr>
											<td id="account">계좌정보</td>
											<td colspan="3">
												<input type="text" id="account_value" name="account_value" placeholder="Ex : 우리은행 xxxxxxxxx('-'빼고입력) 예금주명">
											</td>
										</tr>
										<tr>
											<td id="resume">자기소개</td>
											<td colspan="3">
												<textarea id="resume_value" name="resume_value" cols="30" rows="10"></textarea>
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

		<!-- Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.dropotron.min.js"></script>
			<script src="js/jquery.selectorr.min.js"></script>
			<script src="js/jquery.scrollex.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/browser.min.js"></script>
			<script src="js/breakpoints.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>

	</body>
</html>
<script>
	let i = 0; // 경력 추가버튼
	let j = 0; // 자격증 추가버튼

	// 운전여부 클릭시 이벤트
	function is_drivable(elementId) {
		var button = document.getElementById(elementId);
		var otherButtonId = (elementId === "is_drivaable_yes") ? "is_drivable_no" : "is_drivable_yes";
		var otherButton = document.getElementById(otherButtonId);

      if (button.style.backgroundColor !== "slateblue") {
        // 현재 클릭된 버튼을 초록색으로 변경하고
        button.style.backgroundColor = "slateblue";
        // 다른 버튼이 초록색이면 초기화
        if (otherButton.style.backgroundColor === "slateblue") {
          otherButton.style.backgroundColor = "";
        }
      } else {
        // 클릭된 버튼이 이미 초록색이면 초기화
        button.style.backgroundColor = "";
      }
      console.log(otherButtonId);
      
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
	
	function sendit() {
		
//		var cookieId = cookie.joinid.value;
		const expertAddForm = document.expertAddForm;
		var viewId = expertAddForm.e_id_value.value;
		var driveableYes = document.getElementById("is_driveable_yes");
		var driveableNo = document.getElementById("is_driveable_no");
		var location = document.getElementById("location_value")
		var Pettern1 = /^[가-힣a-zA-Z\d\s]*$/; // 한글과 숫자,영어
		var available_time = document.getElementById("available_time_value");
		var keyword = document.getElementById("keyword_value");
		var cost = document.getElementById("cost_value");
		var account = document.getElementById("account_value");
		var resume = document.getElementById("resume_value");
		var carrer = document.getElementById("career_name");
		var start = document.getElementById("start_time");
		var end = document.getElementById("end_time");
		var license = document.getElementById("license_name");
		var acquire = document.getElementById("acquire_date");
		var Pettern2 = /^[0-9]+$/; // 숫자
		var isDriveableYes = document.getElementById("is_driveable_yes").style.backgroundColor === "slateblue";
		var isDriveableNo = document.getElementById("is_driveable_no").style.backgroundColor === "slateblue";
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
		if(!isDriveableYes && !isDriveableNo) {
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
		if(account_value.value === "" || account_value.value === null) {
			alert("계좌정보를 입력해주세요! (Ex : 우리은행 123456789('-'제외)예금주명)");
			account_value.focus();
			return;
		}
		
		// 계좌정보 한글과 숫자만 입력제한
		if(!Pettern3.test(account_value.value)) {
			alert("계좌정보에는 한글과 숫자만 입력이 가능 합니다");
			account_value.focus();
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
		
		alert("등록이 완료되었습니다!");
		expertAddForm.submit();
	}
</script>

