<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Hypothesis by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>

<head>
<title>EveryCare-Join</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cp}/css/newstyle.css" />
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">

			<!-- Logo -->
			<div class="logo">
				<a href="${cp}/index.jsp"><strong>everycare</strong></a>
			</div>



		</header>

		<!-- Section -->
		<section id="one" class="main alt">
			<header class="accent1">
				<div id="wrap" class="join">
					<form action="${cp}/userjoinok.us" method="post" name="joinForm">
						<table>
							<tbody>
								<tr>
									<td colspan="2" id="result"></td>
								</tr>
								<tr>
								<!-- 기존 로직을 그대로 사용함 -->
									<th><label for="user_id">아이디</label></th>
									<td><input type="text" name="user_id" id="user_id">
										<input type="button" value="중복검사" onclick="checkId()"
										id="check-btn"></td>
								</tr>
								<tr>
									<th><label for="pw">비밀번호</label></th>
									<td><input type="password" name="pw" id="pw"
										onkeyup="pwcheck()"></td>
									
								</tr>
								<tr>
									<th><label for="userpw_re">비밀번호 확인</label></th>
									<td><input type="password" name="userpw_re" id="userpw_re"
										onkeyup="pwcheck()"></td>
								</tr>
								<tr>
									<th colspan="2">
										<div class="pw_check">
                    			<span>영어 대/소 문자,숫자,특수문자(~,?,!,@,-)를 모두 하나 이상 포함해야 합니다. </span><br>
                    			<span>최소 8자 이상의 비밀번호를 입력해주세요. </span><br>
                    			<span>같은 문자를 연속해서 사용할 수 없습니다. </span><br>
                    			<span>특수문자를 반드시 포함해야 합니다. </span><br>
                    			 <span>비밀번호를 확인해주세요. </span> 
                    		</div> 
									</th>
								</tr>
								<tr>
									<th><label for="name">이름</label></th>
									<td><input type="text" name="name" id="name"></td>
								</tr>
								<tr>
									<th><label for="tel_mobile">전화번호</label></th>
									<td><input type="tel" name="tel_mobile" id="tel_mobile"></td>
								</tr>
								<tr>
									<th><label for="tel_sub">보호자 전화번호</label></th>
									<td><input type="tel" name="tel_sub" id="tel_sub"></td>
								</tr>
								<tr>
									<th><label for="email">이메일</label></th>
									<td><input type="email" name="email" id="email"></td>
								</tr>
								<tr class="gender_area">
									<th>성별</th>
									<td>
										<div>
											<ul>
												<li class="radio_item"><input type="radio"
													id="gender1" name="gender" value="M"><label
													for="gender1">남자</label></li>
												<li class="radio_item"><input type="radio"
													id="gender2" name="gender" value="W"><label
													for="gender2">여자</label></li>
											</ul>
											<ul>
                            		<li class="radio_item">
                            			<input type="radio" id="foreigner1" name="foreigner" value="K"><label for="foreigner1">내국인</label>
                            		</li>
                            		<li class="radio_item">
                            			<input type="radio" id="foreigner2" name="foreigner" value="F"><label for="foreigner2">외국인</label>
                           			</li>
                            	</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th><label for="age">나이</label></th>
									<td><input type="text" name="age" id="age"></td>
								</tr>
								<tr class="zipcode_area">
									<th>우편번호</th>
									<td><input type="text" name="zipcode" placeholder="우편번호"
										id="zipcode" readonly onclick="findAddr()"> <input
										type="button" value="우편번호 찾기" onclick="findAddr()"
										id="check-btn"></td>
								</tr>
								<tr class="addr_area">
									<th>주소</th>
									<td><input type="text" name="addr" id="addr"
										placeholder="주소" readonly></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input type="text" name="addr_detail" id="addrdetail"
										placeholder="상세주소"></td>
								</tr>
								<tr>
									<th>참고항목</th>
									<td><input type="text" name="addr_etc" id="addretc"
										placeholder="참고항목" readonly></td>
								</tr>
								<tr class="special_area">
									<th>특이사항</th>
									<td>
										<div>
											<div class="special_input">
												<input type="text" name="special" onkeyup="specialKeyup()"><input
													type="button" value="추가" onclick="addSpecial();"
													id="check-btn">
											</div>
											<div class="special_list"></div>
											<input type="hidden" value="" name="user_etc">
										</div>
									</td>
								</tr>
								<tr>
									<th colspan="2">
									
									<input type="button" value="가입 완료"
										onclick="sendit()" id="check-btn"></th>
									
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</header>
		</section>
	</div>



	<!-- Scripts -->
	<!-- 템플릿 스크립트인데 무슨용도인지는 모르겠습니다. -->
	<script src="${cp}/js/jquery.min.js"></script>
	<script src="${cp}/js/jquery.dropotron.min.js"></script>
	<script src="${cp}/js/jquery.selectorr.min.js"></script>
	<script src="${cp}/js/jquery.scrollex.min.js"></script>
	<script src="${cp}/js/jquery.scrolly.min.js"></script>
	<script src="${cp}/js/browser.min.js"></script>
	<script src="${cp}/js/breakpoints.min.js"></script>
	<script src="${cp}/js/util.js"></script>
	<script src="${cp}/js/main.js"></script>
	<!-- 주소찾기는 카카오맵 API를 썼습니다. -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${cp}/js/user.js"></script>
	<script> const cp = '${cp}';</script>
	<script src="${cp}/js/user.js"></script>

</body>

</html>