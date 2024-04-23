<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>everycare</title>
    <script src="http://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${cp}/css/main.css">
    <link rel="stylesheet" href="${cp}/css/fontawesome-all.min.css">
    <style>
        html {
            font-size: 16px;
        }

        .inner-content-div {
            margin: 0 0 4rem 0;
            text-align: center;
        }

        #wrapper>.main>.inner.alt {
            padding-top: 0!important;
        }

        /* .content 위쪽 영역 넘기기 */
            .inner-content-div-headbtn {
                margin-top: -3rem;
                margin-bottom: 2rem;
                text-align: center;
            }
        /* fit버튼 (폭)크기조절 */
            .inner-content-div-fitbtn-limiter-m2r {
                margin: 0 2rem;
            }
            .inner-content-div-fitbtn-limiter-m4r {
                margin: 0 4rem;
            }
            .inner-content-div-fitbtn-limiter-m6r {
                margin: 0 6rem;
            }
            .inner-content-div-fitbtn-limiter-m8r {
                margin: 0 8rem;
            }
        
        /* 대충 fit버튼등 커스텀 div쪽 요소 부모요소와 밑단 띄우기 */
        /*
            부모div>자식div(여기에 할당)>fit버튼
            혹은
            부모div>대충 띄울 요소(여기에)
        */
            .bottom-margin-inserter {
                margin-bottom: 2rem;
            }

        /* 개인정보 나열 테이블 좌우 띄우기 */
            table.info-table {
                margin-left: 5%;
                margin-right: 5%;
                width: 90%;
            }
            table.info-table tr>td:first-child {
                width: 33%;
            }

        /* 각 개인정보 블록만 흰색으로 만들기 */
            /* 1 .content 배경색 날리기 */
            .content {
                background-color: #f7f7f7!important;
            }
            /* 
                2 .inner-content-div 흰색으로 만들기
                + 테두리 넣기
                + pt 넣어서 내부요소 위쪽으로부터 적당히 띄우기
            */
            .inner-content-div {
                padding-top: 2rem;
                border: 1px solid #cdcdcd;
                background-color: #fff;
            }
        
        /* 요소 숨기는 클래스 */
            .this-is-hidden {
                display: none!important;
            }
        
        /* ul.actions.fit.small(fit+small 버튼용 ul)의 li에 강제로 마진 부여 */
        /*
            템플릿 수정하는거니 주의
             + 오로지 ul.actions.fit.small 에 
               버튼(+li) 두 개가 들어가는 경우만을
               위한거니 주의할것
        */
            ul.actions.fit.small>li:first-child {
                margin-left: 2rem;
            }
            ul.actions.fit.small>li:last-child {
                margin-right: 2rem;
            }
        
        /* 우편번호 찾기 버튼 패딩 강제수정 */
        /* 
            위치가 대략
            #addr-block>form>table td#zip-inputbox>div.row.gtr-uniform>div:last-child>a.button.btn-for-findzipcode
            걍 주소블럭서 우편번호 찾기 버튼임

            템플릿 기본 css로는 버튼이 table 범위를 벗어나서 강제로 줄임
        */
            .btn-for-findzipcode {
                padding: 0 1.1rem;
            }

        /* 비밀번호 폼 inner wrapper */
        /* 폼 inner wrapper 영역 조절 */
            .pw-form-inner-wrapper {
                margin-left: 5%;
                margin-right: 5%;
                width: 90%;
            }
        /* p태그 초기화하기 */
            .pw-form-inner-wrapper>p {
                margin-top: 0.5rem;
                margin-bottom: 0.2rem;
                text-align: left;
                font-size: 0.8rem;
            }
        /* input border 조금만 더 진하게 */
            .pw-form-inner-wrapper>input[type=password] {
                border-color: #dfdfdf;
            }

        /* 개인정보 페이지 <-> 이용 내역 페이지 inner-nav 네비바 */
            div.inner-nav {
                width: 100%;
                height: 3rem;
                text-align: center;
                background-color: #fff;
            }
            div.inner-nav>ul {
                list-style: none;
                padding: 0; margin: 0;
            }
            div.inner-nav>ul>li {
                position: relative;
                display: inline-block;
                margin: 0 1.5rem;
                padding: 0;
                height: 3rem;
                line-height: 3.25rem;
            }
            div.inner-nav>ul>li>a {
                overflow: hidden;
                display: block;
                height: inherit;
                line-height: inherit;
                border-bottom: 0;
                color: #3b3b3b;
            }
            /* 네비바 요소 사이 간격 띄우기 */
            div.inner-nav>ul>li:first-child {
                margin-right: 3rem;
            }
            div.inner-nav>ul>li:last-child {
                margin-left: 3rem;
            }
        
        /* 사용자 특이사항 블럭(keyword-block) 관련 */
            /* td 폭 조절 */
                #keyword-block thead>tr>th:first-child,
                #keyword-block tbody>tr>td:first-child,
                #keyword-block tfoot>tr>td:first-child {
                    width: 77%;
                }
                #keyword-block thead>tr>th:last-child,
                #keyword-block tbody>tr>td:last-child,
                #keyword-block tfoot>tr>td:last-child {
                    width: 23%;
                }
            /* 삭제/적용 버튼 크기 조정 */
                #keyword-block a.button.modified-btn {
                    width: 5rem;
                    height: 2rem;
                    line-height: 2rem;
                    padding: 0 0.5rem;
                }
            /* 적용 버튼 위치 조정(밑으로 내리기) */
                #keyword-block thead a.button.modified-btn {
                    margin-bottom: -0.5rem;
                }
       	/*헤더 관련*/
       	header.accent1 {
       		margin-top: 1.5rem;
       		padding: 3rem 0 0.5rem 0!important;
       	}
    </style>
</head>
<body>
    <div id="wrapper">  
        <!-- 헤더 위치 -->
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
											<li class="mypage"><a href="${cp}/userinfo.us">유저 정보</a></li>
											<c:if test="${not empty expertSession}">
												<li class="expertpage"><a href="${cp}/expertinfo.ep">전문가 정보</a></li>
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

        <section class="main alt">
            <header class="accent1">
                <h1>개인정보 관리</h1>
                <p id="header-text">
                    환영합니다 ${userdto.name}님
                </p>
            </header>
            <!-- 내부 네비바 -->
            <div class="inner-nav">
                <ul>
                    <li style="white-space: nowrap;">
                        <a href="${cp}/userinfo.us">개인정보 관리</a>
                    </li>
                    <li style="white-space: nowrap;">
                        <a href="${cp}/getpaymentlist.pm">이용 내역 확인</a>
                    </li>
                    <li style="white-space: nowrap;">
                        <a href="${cp}/app/user/user-delete.jsp">회원 탈퇴하기</a>
                    </li>
                </ul>
            </div>
            <!-- 내부 네비바 끝 -->
            <div class="inner alt">
                <div class="content">
                    <!-- 개인정보 나열 공간 -->
                    <!-- content 좌우로 2등분 -->
                    <div class="row gtr-200">
                        <!-- content 좌측 -->
                        <div class="col-6 col-12-medium">
                            <!-- 기본 정보 -->
                            <div id="default-block" class="inner-content-div">
                                <h3>기본 정보</h3>
                                <form id="update-default-info" name="update_default_info" method="post">
                                    <table class="info-table">
                                        <tbody>
                                            <tr>
                                                <td>ID</td>
                                                <!-- USER ID는 수정할 수 없음 -->
                                                <td id="id-display">${userdto.user_id}</td>
                                            </tr>
                                            <tr>
                                                <td>이름</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="name-display" class="default-display">${userdto.name}</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="name-inputbox" class="default-info-input this-is-hidden">
                                                    <input type="text" name="username" id="name-input">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>국적</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="national-display" class="default-display">
                                                    <c:choose>
                                                		<c:when test="${userdto.gender eq 'M-K' || userdto.gender eq 'W-K'}">내국인</c:when>
                                                		<c:when test="${userdto.gender eq 'M-F' || userdto.gender eq 'W-F'}">외국인</c:when>
                                                		<c:otherwise>??</c:otherwise>
                                                	</c:choose>
                                                </td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="national-inputbox" class="default-info-input this-is-hidden">
                                                    <div class="row gtr-uniform">
                                                        <div class="col-6 col-12-xsmall">
                                                            <input type="radio" name="usernational" id="national-k" value="K">
                                                            <label for="national-k">내국인</label>
                                                        </div>
                                                        <div class="col-6 col-12-xsmall">
                                                            <input type="radio" name="usernational" id="national-f" value="F">
                                                            <label for="national-f">외국인</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>성별</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="sex-display" class="default-display">
                                                	<c:choose>
                                                		<c:when test="${userdto.gender eq 'M-K' || userdto.gender eq 'M-F'}">남성</c:when>
                                                		<c:when test="${userdto.gender eq 'W-K' || userdto.gender eq 'W-F'}">여성</c:when>
                                                		<c:otherwise>??</c:otherwise>
                                                	</c:choose>
                                                </td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="sex-inputbox" class="default-info-input this-is-hidden">
                                                    <div class="row gtr-uniform">
                                                        <div class="col-6 col-12-xsmall">
                                                            <input type="radio" name="usersex" id="sex-male" value="male">
                                                            <label for="sex-male">남성</label>
                                                        </div>
                                                        <div class="col-6 col-12-xsmall">
                                                            <input type="radio" name="usersex" id="sex-female" value="female">
                                                            <label for="sex-female">여성</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>나이</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="birth-display" class="default-display">${userdto.age}</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="birth-inputbox" class="default-info-input this-is-hidden">
                                                    <input type="text" name="userbirth" id="birth-input">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <!-- 폼 open 시 hidden -->
                                <div id="default-btn-div" class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formopener-btn-default" class="button primary fit small" style="cursor: pointer;">기본 정보 수정하기</a>
                                </div>
                                <!-- 폼 close 시 hidden -->
                                <ul id="default-btn-ul" class="actions fit small this-is-hidden">
                                    <li>
                                        <a id="formsubmit-btn-default" class="button primary fit small" style="cursor: pointer;">수정 적용하기</a>
                                    </li>
                                    <li>
                                        <a id="formcancel-btn-default" class="button primary fit small" style="cursor: pointer;">수정 취소하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- 기본 정보 끝 -->
                            <!-- 사용자 특이사항 -->
                            <div id="keyword-block" class="inner-content-div">
                                <h3>사용자 특이사항</h3>
                                <table class="info-table" style="text-align: left;">
                                    <thead>
                                        <tr>
                                            <th>나를 설명할 수 있는 키워드를 입력해주세요</th>
                                            <th><a id="keyword-submit-btn" class="button modified-btn" style="cursor: pointer;">적용하기</a></th>
                                        </tr>
                                    </thead>
                                    <!-- 동적생성 구역 -->
                                    <tbody id="dynamic-area">
	                                    <c:if test="${!keywordsList.isEmpty()}">
	                                    	<c:forEach var="keyword" items="${keywordsList}">
	                                    		<tr>
	                                   				<td>${keyword}</td>
	                                          		<td><a class="button modified-btn keyword-delete-btn" style="cursor: pointer;">삭제</a></td>
	                                    		</tr>
	                                    	</c:forEach>
	                                    </c:if>
                                    </tbody>
                                    <!-- 동적생성 구역 끝 -->
                                    <tfoot>
                                        <tr>
                                            <td><input type="text" id="keyword-input" placeholder="키워드 입력"></td>
                                            <td><a id="keyword-add-btn" class="button primary" style="cursor: pointer;">추가</a></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- 사용자 특이사항 끝 -->
                            <!-- 전문가 가입 홍보 -->
                            <!-- 사용자가 이미 전문가인 경우 마이페이지 링크를 건다 -->
                            <c:choose>
                            	<c:when test="${not empty expertSession}">
                            		<div class="inner-content-div">
                            			<h3>전문가 마이페이지를 찾으시나요?</h3>
		                                <div class="inner-content-div-fitbtn-limiter-m2r bottom-margin-inserter">
		                                    <a href="${cp}/expertinfo.ep" class="button fit" style="cursor: pointer;">전문가 정보 수정하기</a>
		                                </div>
                            		</div>
                            	</c:when>
                            	<c:otherwise>
		                            <div class="inner-content-div">
		                                <h3>오늘 에브리케어 전문가가 되세요</h3>
		                                <p>
		                                    대충 홍보글 Lorem ipsum dolor sit amet, consectetr
		                                    <br>
		                                    adipisicing elit. Dolorem sint rerum expedita,
		                                    <br>
		                                    ex perspiciatis odio velit impedit molestiae sed
		                                    <br>
		                                    ipsum provident soluta distinctio tempore non cupiditate
		                                    <br>
		                                    tempora vero possimus deserunt?
		                                </p>
		                                <div class="inner-content-div-fitbtn-limiter-m2r bottom-margin-inserter">
		                                    <a href="${cp}/app/expert/expertRegister.jsp" class="button primary fit" style="cursor: pointer;">에브리케어 전문가 가입하기</a>
		                                </div>
		                            </div>
	                            </c:otherwise>
                            </c:choose>
                            <!-- 전문가 가입 끝 -->
                        </div>
                        <!-- content 좌측 끝 -->

                        <!-- content 우측 -->
                        <div class="col-6 col-12-medium">
                            <!-- 비밀번호 -->
                            <div id="password-block" class="inner-content-div">
                                <h3>비밀번호 변경하기</h3>
                                <form id="update-password-info" name="update_password_info" method="post">
                                    <div class="pw-form-inner-wrapper">
                                        <p>기존 비밀번호</p>
                                        <input type="password" name="existing_userpw" id="existing-pw-input" placeholder="기존 비밀번호를 입력해주세요">
                                        <p>신규 비밀번호</p>
                                        <input type="password" name="modified_userpw" id="modified-pw-input" placeholder="8-64문자, 숫자/특수문자가 있어야 합니다">
                                        <p>신규 비밀번호 확인</p>
                                        <input type="password" name="modified_userpw_check" id="modified-pw-check-input" placeholder="비밀번호 확인은 신규 비밀번호와 동일해야 합니다">
                                    </div>
                                </form>
                                <div class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formsubmit-btn-password" class="button primary fit small" style="cursor: pointer;">비밀번호 변경하기</a>
                                </div>
                            </div>
                            <!-- 비밀번호 끝 -->
                            <!-- 연락처 -->
                            <div id="contacts-block" class="inner-content-div">
                                <h3>연락처</h3>
                                <form id="update-contacts-info" name="update_contacts_info" method="post">
                                    <table class="info-table">
                                        <tbody>
                                            <tr>
                                                <td>휴대폰 번호</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="tel-display" class="contacts-display">${userdto.tel_mobile }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="tel-inputbox" class="contacts-info-input this-is-hidden">
                                                    <input type="text" name="tel_mobile" id="tel-input">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>전화번호(예비)</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="telsub-display" class="contacts-display">${userdto.tel_sub }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="telsub-inputbox" class="contacts-info-input this-is-hidden">
                                                    <input type="text" name="tel_sub" id="telsub-input">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>이메일</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="email-display" class="contacts-display">${userdto.email }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="email-inputbox" class="contacts-info-input this-is-hidden">
                                                    <input type="email" name="email" id="email-input">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <!-- 폼 open 시 hidden -->
                                <div id="contacts-btn-div" class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formopener-btn-contacts" class="button primary fit small" style="cursor: pointer;">연락처 수정하기</a>
                                </div>
                                <!-- 폼 close 시 hidden -->
                                <ul id="contacts-btn-ul" class="actions fit small this-is-hidden">
                                    <li>
                                        <a id="formsubmit-btn-contacts" class="button primary fit small" style="cursor: pointer;">수정 적용하기</a>
                                    </li>
                                    <li>
                                        <a id="formcancel-btn-contacts" class="button primary fit small" style="cursor: pointer;">수정 취소하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- 연락처 끝 -->
                            <!-- 유저 주소 -->
                            <div id="addr-block" class="inner-content-div">
                                <h3>주소</h3>
                                <form id="update-addr-info" name="update_contacts_info" method="post">
                                    <table class="info-table">
                                        <tbody>
                                            <tr>
                                                <td>우편번호</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="zip-display" class="addr-display">${userdto.zipcode }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="zip-inputbox" class="addr-info-input this-is-hidden">
                                                    <!-- td 좌우 2등분을 위한 div -->
                                                    <div class="row gtr-uniform">
                                                        <!-- 우편번호 input -->
                                                        <div class="col-6 col-12-xsmall">
                                                            <input type="text" name="zip" id="zip-input">
                                                        </div>
                                                        <!-- 우편번호 찾기 버튼 -->
                                                        <div class="col-6 col-12-xsmall">
                                                            <a id="kakao-postbtn" class="button btn-for-findzipcode" style="cursor: pointer;">우편번호 찾기</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>주소</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="addr-display" class="addr-display">${userdto.addr }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="addr-inputbox" class="addr-info-input this-is-hidden">
                                                    <input type="text" name="addr" id="addr-input">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>상세주소</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="addrdetail-display" class="addr-display">${userdto.addr_detail }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="addrdetail-inputbox" class="addr-info-input this-is-hidden">
                                                    <input type="text" name="addrdetail" id="addrdetail-input">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>추가정보</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="addretc-display" class="addr-display">${userdto.addr_etc }</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="addretc-inputbox" class="addr-info-input this-is-hidden">
                                                    <input type="text" name="addretc" id="addretc-input">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <!-- 폼 open 시 hidden -->
                                <div id="addr-btn-div" class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formopener-btn-addr" class="button primary fit small" style="cursor: pointer;">주소 수정하기</a>
                                </div>
                                <ul id="addr-btn-ul" class="actions fit small this-is-hidden">
                                    <li>
                                        <a id="formsubmit-btn-addr" class="button primary fit small" style="cursor: pointer;">수정 적용하기</a>
                                    </li>
                                    <li>
                                        <a id="formcancel-btn-addr" class="button primary fit small" style="cursor: pointer;">수정 취소하기</a>
                                    </li>
                                </ul>
                                <!-- 폼 close 시 hidden -->
                            </div>
                            <!-- 유저 주소 끝 -->
                        </div>
                        <!-- content 우측 끝 -->
                    </div>
                    <!-- content 좌우로 2등분 끝 -->
                    <!-- 개인정보 나열 공간 끝 -->
                </div>
                <!-- content 끝 -->
            </div>
            <!-- inner alt 끝 -->
        </section>
        <!-- 푸터 위치 -->
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
			<script src="${cp}/js/chat.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
<!-- 카카오 주소찾기 API -->
<!-- 
    관련 코드는 이벤트 등록, script 맨 밑쪽에 있음
 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    const DEFAULT_BLOCK = {
        display: {
            user_id: document.getElementById("id-display"),
            name: document.getElementById("name-display"),
            national: document.getElementById("national-display"),
            sex: document.getElementById("sex-display"),
            birth: document.getElementById("birth-display")
        },
        inputbox: {
            name: document.getElementById("name-inputbox"),
            national: document.getElementById("national-inputbox"),
            sex: document.getElementById("sex-inputbox"),
            birth: document.getElementById("birth-inputbox")
        },
        input: {
            name: document.getElementById("name-input"),
            national_k: document.getElementById("national-k"),
            national_f: document.getElementById("national-f"),
            sex_male: document.getElementById("sex-male"),
            sex_female: document.getElementById("sex-female"),
            birth: document.getElementById("birth-input")
        },
        openBtn: document.getElementById("formopener-btn-default"),
        submitBtn: document.getElementById("formsubmit-btn-default"),
        cancelBtn: document.getElementById("formcancel-btn-default")
    };

    //===============================================================================================================
    //메모
    /*
        240404 1718
        defaultFormCancel_EventReceiver() 꼭 함 볼것
        이거서 따와서 - 아마 배열이나 적절한 class 부여를 활용하면
        열고 닫는 부분은 공통 처리가 가능할까 싶음
        이제 막 값을 옮긴다던가(특히 radio류) 그런거만
        각 폼 별로 분리된 함수에서 처리하게 하는거지
            대충 formopener버튼명 배열로 열린 폼 확인
            > 해당 인덱스로 공통요소(*-display, *-info-input 등등) 배열에서 값을 가져와
            > getElementsByClassName() 등에 인수로 넣기
            > 배열로 받아서 일괄 hidden/visiable 처리

         + 추가
        이거 HTML 보면 지금은 Table에 불러온 값과 input이 좆되게 섞여있음
        이걸 걍... Table을 두개 만들어두는건 어떨까 싶음
    */

    //===============================================================================================================
    //참조
    /*
        240412 1123
        password-block(비밀번호 변경 블럭)의 경우 폼 open/cancel이 없음
        긍게 뭐 밑에 uniFormOpenCancel... 같은 함수는 안 쓸거임

        240417 1045
        파일 병합쪽으로 문제가 생겨서 java.sql.Date 형식의 birth 값을 다시 int 의 age로 바꾸기로 함
        근데 페이지 뒤집어가면서 모든 birth-*를 age-*로 바꾸기는 좀... 힘드니
        일단은 실제 값(JSON쪽 등)과 유효성 쪽만 수정할것임
    */

    //===============================================================================================================
    //전역변수

    // 현재 화면에 열린 폼이 있는지 체크하는 전역변수
    /*
        true : 열려있는 폼이 존재함
        false : 모든 폼이 닫혀있음
    */
    let IS_FORM_ALREADY_OPENED = false;

    // 폼 id 배열 전역변수
    const FORM_ID = ["update-default-info", "update-contacts-info", "update-addr-info"];

    // 클릭된 버튼을 판별하기 위한 배열 변수
    /*
        아래의 이름들은 각각 폼 오프너 버튼의 id값과 같음
        default : 기본 정보
        contacts : 연락처
        addr : 주소
    */
    const FORM_OPENED_BTN_ID = ["formopener-btn-default", "formopener-btn-contacts", "formopener-btn-addr"];
    const FORM_CANCEL_BTN_ID = ["formcancel-btn-default", "formcancel-btn-contacts", "formcancel-btn-addr"];
    const FORM_SUBMIT_BTN_ID = ["formsubmit-btn-default", "formsubmit-btn-contacts", "formsubmit-btn-addr"];

    // *-display, *-info-input 요소 class값 배열
    /*
        각각 기본값 td 요소, input을 담은 td 요소임
    */
    const ELE_CLASS_DISPLAY = ["default-display", "contacts-display", "addr-display"];
    const ELE_CLASS_INFO_INPUT = ["default-info-input", "contacts-info-input", "addr-info-input"];

    // 폼 오프너/submit 함수 객체 배열 객체
    /*
        대충 uniForm*_btnClickEvent() 에서 처리하기 힘든
        폼별로 다른 동작을 정의하는 함수 객체들의 배열임

        임마 인덱스는 FORMOPENED_BTN_NAME 등의 버튼id배열객체들과 동일한 인덱스(길이, 순서 전부)여야 함
        이거 길이건 순서건 꼬이는 순간 uniFormOpenerBtnClickEvent() 부터 해서 다 꼬임
    */
    const FORM_OPENER_FUNC = [defaultFormValueTransporter, contactsFormValueTransporter, addrFormValueTransporter];

    // 취소시 기존 값 표시를 위한 배열 변수들
    // 은 생각해보니까 필요없음 - td쪽에 값이 남아있으니... ㅇㅇ
    // const DEFAULT_BLOCK_VALUES_KEEP = [null, null, null, null];

    //===============================================================================================================
    //이벤트 등록

    // open/cancel/submit 버튼
    for(let i = 0; i < 3; i++) {
        document.getElementById(FORM_OPENED_BTN_ID[i]).addEventListener("click", uniFormOpenCancel_btnClickEvent);
        document.getElementById(FORM_CANCEL_BTN_ID[i]).addEventListener("click", uniFormOpenCancel_btnClickEvent);
        document.getElementById(FORM_SUBMIT_BTN_ID[i]).addEventListener("click", uniFormSubmit_btnClickEvent);
    }

    // 비밀번호 폼 submit 버튼
    document.getElementById("formsubmit-btn-password").addEventListener("click", pwFormSubmit_btnClickEvent);

    // 카카오 주소찾기 API 버튼
    document.getElementById("kakao-postbtn").addEventListener("click", kakaoPostcode);

    //===============================================================================================================
    // 사용자 특이사항 처리용 함수들
    // 변수 선언 등도 일단 여기다 전부 모아둠
    /*
        일단 각 키워드는 18글자까지 입력 가능, 한글만 가능, 초성 불가능 정도로만 받을거임
    */

    // 동적생성 구역 - tbody
    const grandParentOfKeywords = document.getElementById("dynamic-area");
    // 동적생성 구역 tr 요소 리스트
    //deprecated - 쓰지 말것
    // const keywordElementList = document.getElementById("dynamic-area").children;
    // submit 버튼
    const keywordSubmitBtn = document.getElementById("keyword-submit-btn");
    // add 버튼
    const keywordAddBtn = document.getElementById("keyword-add-btn");
    // 키워드 input
    const keywordInput = document.getElementById("keyword-input");

    // 우선 삭제버튼에 이벤트를 할당
    setDeleteEventToList(grandParentOfKeywords.children);

    //삭제버튼 이벤트 할당 함수
    function setDeleteEventToList(children) {
        for(let ele of children) {
            ele.getElementsByClassName("keyword-delete-btn")[0].addEventListener("click", (event) => {
                event.target.parentElement.parentElement.remove();
            });
        }
    }
    function setDeleteEvent(element) {
        element.addEventListener("click", (event) => {
            event.target.parentElement.parentElement.remove();
        });

        //연속적인 처리를 위해 반환값 선언
        return element;
    }

    //추가버튼 이벤트 할당
    keywordAddBtn.addEventListener("click", addKeyword);
    // 엔터키로도 입력할 수 있게 해둠
    keywordInput.addEventListener("keydown", (event) => {
        if(event.key === "Enter") {
            addKeyword();
        }
    });
    
    //추가버튼 이벤트 함수
    function addKeyword() {
        const inpVal = keywordInput.value;
        if(/^(?=.*[가-힣a-zA-Z])[가-힣a-zA-Z0-9!@#$%^&*\-=_+ ]{1,18}$/g.test(inpVal)) {
            duplicateFlag = true;
            for(let existTr of grandParentOfKeywords.children) {
                if(inpVal == existTr.children[0].innerHTML) {
                    duplicateFlag = false;
                    break;
                }
            }
            if(duplicateFlag) {
                createKeyword(inpVal);
                //input을 비워준다
                keywordInput.value = "";
            } else {
                printAlert("중복된 키워드가 존재합니다");
            }
        } else {
            printAlert("키워드는 최대 18글자까지, 한글/영어/특수문자(!@#$%^&*-=_+) 만 입력 가능하며 특수문자만 입력할 수는 없습니다");
        }
    }

    //실제로 tr요소 추가하는 함수
    function createKeyword(inpVal) {
        const newTr = document.createElement("tr");
        const valTd = newTr.appendChild(document.createElement("td"));
        valTd.innerHTML = inpVal;
        const btnTd = newTr.appendChild(document.createElement("td"));
        const btnAnchor = btnTd.appendChild(document.createElement("a"));
        btnAnchor.classList.add("button", "modified-btn", "keyword-delete-btn");
        btnAnchor.style.cursor = "pointer";
        btnAnchor.innerHTML = "삭제";
        setDeleteEvent(btnAnchor);
        grandParentOfKeywords.appendChild(newTr);
    }

    //submit 하기
    // 폼 문제때문에 Ajax로 보내기는 할 건데 최대한 단순하게 보낼거임
    // JSON 안 쓴다

    //submit버튼 이벤트 할당
    keywordSubmitBtn.addEventListener("click", sendKeywordByAjax);

    //submit 이벤트 함수 - Ajax 처리
    function sendKeywordByAjax() {
        //일단 문자열을 꾸린다
        let reqVal = "isEmpty:";
        if(grandParentOfKeywords.children.length < 1) {
            //키워드가 없는 경우
            reqVal += "true";
        } else {
            //키워드가 있는 경우
            reqVal += "false";

            for(let ele of grandParentOfKeywords.children) {
                reqVal += "," + ele.children[0].innerHTML;
            }

        }

        //Ajax 로직
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            switch(xhr.readyState) {
                case XMLHttpRequest.OPENED:
                    break;
                case XMLHttpRequest.DONE:
                    if(xhr.status === 200) {
                        if(xhr.responseText != null) {
                            //송수신 성공
                            console.log("receive good");
                            //값 받고 배열로 쪼개기
                            const respVal = xhr.responseText.split(",");
                            console.log(respVal);
                            //백단서 실패?
                            if(respVal.shift().split(":")[1] === "false") {
                                //실패한 경우
                                switch(respVal[1].split(":")[1]) {
                                    case "empty":
                                        console.log("empty");
                                        break;
                                    case "emptyorblank":
                                        console.log("empty or blank only");
                                        break;
                                    case "valifail":
                                        console.log("validation fail");
                                        break;
                                    case "dbfail":
                                        console.log("db fail");
                                        break;
                                }
                            } else {
                                //성공한 경우
                                console.log("backend good");
                                console.log(xhr.responseText);
                                console.log(respVal);
                                //값 존재여부 확인
                                if(respVal.shift().split(":")[1] === "true") {
                                    // 값이 없으면(모든 키워드 삭제시) tbody 자손요소 삭제까지만 함
                                    refreshKeywords(respVal, false);
                                } else {
                                    // 값이 있을때
                                    refreshKeywords(respVal, true);
                                }
                                printAlert("키워드가 수정되었습니다");
                            }
                        } else {
                            //수신값이 null

                        }
                    } else {
                        //송수신 실패 - 404 등
                        console.log("404 or...");
                    }
                    break;
            }
        };

        xhr.open("POST", "update/etc.us", true);
        xhr.setRequestHeader("Context-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send(reqVal);
    }

    //업데이트 성공시 클라 업데이트하는 함수
    function refreshKeywords(respVal, doesAddTr) {
        console.log(grandParentOfKeywords.children);
        //우선 기존 tbody 안 tr들을 싹 다 지운다
        // - 수정 적용시 기존 tr요소들이 제대로 안 지워지던 문제
        //      찾아보니까 children은 HTMLCollection 객체인데
        //      임마는 Live 한 친구라서 수정사항이 바로 적용되기에
        //      반복문에 넣기가 거시기하다고함 - 특히 순회하면서 삭제할때ㅇㅇ
        // 참조
        // https://velog.io/@husbumps/for...of-%EB%A1%9C-HTMLCollection%EC%9D%84-%EC%88%9C%ED%9A%8C%ED%95%98%EB%A9%B4%EC%84%9C-DOM%EC%A1%B0%EC%9E%91-%EC%8B%9C-%EC%A3%BC%EC%9D%98%ED%95%A0-%EC%A0%90
        // 근데 이거 아마 웬만해서는 클라에 남아있던 값(tr)이랑 실제 DB 기입된 값이 다른 경우가 거의 없을거임
        // 걍 안전빵으로 지우게 해둥ㅁ

        for(let trEle of Array.from(grandParentOfKeywords.children)) {
            trEle.remove();
        }

        if(doesAddTr) {
            //그 다음 받아온 값으로 새로 만들어 채운다
            for(let val of respVal) {
                createKeyword(val);
            }
        }
    }

    //===============================================================================================================
    // uniForm*_btnClickEvent() - 공통 함수들

    //폼 opener/canceler
    /*
        대충 임마가 하는거
            폼 여닫기

        로직
            open인지 cancel인지 확인
            지금 open/cancel할 수 있는지 확인
            현재 폼 open/cancel 상태값 업데이트 - IS_FORM_ALREADY_OPENED
            어떤 폼이 open/cancel하는지 확인
            open/cancel에 맞춰서 해당하는 폼 display속성 수정하기
            open시 값 옮기기를 위해 함수 호출하기
    */
    function uniFormOpenCancel_btnClickEvent(event) {
        // open인지 cancel인지 확인
        const wayType = FORM_OPENED_BTN_ID.includes(event.target.id) ? "open"
            : FORM_CANCEL_BTN_ID.includes(event.target.id) ? "cancel"
            : null;
        // open도 cancel도 아니면 함수 종료
        if(wayType == null)
            return;

        // 이미 열려있는 폼이 존재하는데 open을 시도하는지 확인
        if(IS_FORM_ALREADY_OPENED && wayType === "open") {
            printAlert("폼은 한번에 하나만 열 수 있습니다");
            return;
        }
        // 열려있는 폼이 없는데 cancel을 하는지 확인
        if(!IS_FORM_ALREADY_OPENED && wayType === "cancel") {
            printAlert("열려있는 폼이 없습니다");
            return;
        }

        // 폼 open/cancel에 맞춰 IS_FORM_ALREADY_OPENED 전역변수 업데이트
        if(wayType === "open")
            IS_FORM_ALREADY_OPENED = true;
        else
            IS_FORM_ALREADY_OPENED = false;

        // open/cancel하는 폼을 특정
        const wayNum = wayType === "open" ? FORM_OPENED_BTN_ID.indexOf(event.target.id)
            : FORM_CANCEL_BTN_ID.indexOf(event.target.id);

        // *-display(td) open/cancel 하기
        for(let dp of document.getElementsByClassName(ELE_CLASS_DISPLAY[wayNum])) {
            if(wayType === "open")
                dp.classList.add("this-is-hidden");
            else
                dp.classList.remove("this-is-hidden");
        }
        // *-info-input(td) open/cancel 하기
        for(let inp of document.getElementsByClassName(ELE_CLASS_INFO_INPUT[wayNum])) {
            if(wayType === "open")
                inp.classList.remove("this-is-hidden");
            else
                inp.classList.add("this-is-hidden");
        }
        // 버튼들 open/cancel 하기
        if(wayType === "open") {
            document.getElementById(FORM_OPENED_BTN_ID[wayNum]).parentElement.classList.add("this-is-hidden");
            document.getElementById(FORM_SUBMIT_BTN_ID[wayNum]).parentElement.parentElement.classList.remove("this-is-hidden");
        } else {
            document.getElementById(FORM_OPENED_BTN_ID[wayNum]).parentElement.classList.remove("this-is-hidden");
            document.getElementById(FORM_SUBMIT_BTN_ID[wayNum]).parentElement.parentElement.classList.add("this-is-hidden");
        }

        // 폼 open 시 값 옮기기 함수 호출
        if(wayType === "open")
            FORM_OPENER_FUNC[wayNum]();
    }

    //===============================================================================================================
    //폼 오픈 함수들
    /*
        uniFormOpener_btnClickEvent()에서는
        값을 td 서 input 으로 옮기는 각 폼별로 각기 다른
        과정을 수행할 수 없음 - 없지는 않겠지만 힘들거임
        따라서 이 아래의 함수들로 분리시켜놓음

        중요 - 240415
        default서 ID는 이제 수정 불가능함
    */
    // 기본정보 - default 폼 오프너 함수
    
    /*
                    dp      inp
        ID          0       -
        name        1       0
        national    2       1
        gender      3       2
        age         4       3
    */
    function defaultFormValueTransporter() {
        // 기존 값 불러오기(td)
        const valTdArr = document.getElementById("default-block").getElementsByClassName("default-display");

        // input<td 가져오기 - input을 가져오는게 아님!
        const inputTdArr = document.getElementById("default-block").getElementsByClassName("default-info-input");

        //값 옮기기
        // 이름
        inputTdArr[0].children[0].value = valTdArr[0].innerHTML;
        // 국적
        if(valTdArr[1].innerHTML.trim() === "내국인") {
            document.update_default_info.usernational[0].checked = true;
        } else if(valTdArr[1].innerHTML.trim() === "외국인") {
            document.update_default_info.usernational[1].checked = true;
        } else {
            document.update_default_info.usernational[0].checked = false;
            document.update_default_info.usernational[1].checked = false;
        }
        // 성별
        if(valTdArr[2].innerHTML.trim() == "남성") {
            document.update_default_info.usersex[0].checked = true;
        } else if(valTdArr[2].innerHTML.trim() == "여성") {
            document.update_default_info.usersex[1].checked = true;
        } else {
            document.update_default_info.usersex[0].checked = false;
            document.update_default_info.usersex[1].checked = false;
        }
        // 나이
        inputTdArr[3].children[0].value = valTdArr[3].innerHTML;
    }

    // 연락처 - contacts 폼 오프너 함수
    function contactsFormValueTransporter() {
        //기존 값 불러오기 - *-display
        const valTd = document.getElementsByClassName("contacts-display");
        //td>input 가져오기
        const inputTd = document.getElementsByClassName("contacts-info-input");

        //값 옮기기
        // 전화번호의 경우 "-"(대시) 는 지워서 옮길거임
        for(let i = 0; i < valTd.length; i++) {
            //전화번호는 -를 없애지 않는다
            if(i < 2) {
                // const tel = valTd[i].innerHTML.split("-");
                // inputTd[i].children[0].value = "";
                // for(let telEle of tel) {
                //     inputTd[i].children[0].value += telEle;
                // }
                const tel = valTd[i].innerHTML;
                inputTd[i].children[0].value = tel;
            }
            // 이메일은 그냥 옮긴다
            else {
                inputTd[i].children[0].value = valTd[i].innerHTML;
            }
        }
    }

    // 주소 - addr 폼 오프너 함수
    function addrFormValueTransporter() {
        //기존 값 불러오기
        const valTd = document.getElementsByClassName("addr-display");
        //td>input인 td 가져오기
        const inputTd = document.getElementsByClassName("addr-info-input");

        //값 옮기기
        for(let i = 0; i < valTd.length; i++) {
            //우편번호는 좀 깁숙히 들어가야 함
            // 걍 id로 가져온다
            if(i == 0) {
                document.getElementById("zip-input").value = valTd[i].innerHTML;
            } 
            //나머지는 그냥 옮기면 됨
            else {
                inputTd[i].children[0].value = valTd[i].innerHTML;
            }
        }
    }

    //===============================================================================================================
    //유효성 체크(정규식)

    //공통 유효성 체크 함수
    // 테스트 통과 성공시 isSuccess=true 필드를 담은 객체를,
    // 실패시 isSuccess=false와 failedReasonArray=[ new ValidationFailedReason(elementName, failedReason), ... ] 필드의 객체를 반환함
    function uniValidationChecker(formElement) {
        const inpArr = formElement.getElementsByTagName("input");
        const validationResult = {
            isSuccess: true,
            failedReasonArray: []
        };

        // 비밀번호 외의 폼
        if(formElement.id != "update-password-info") {
            for(let i = 0; i < inpArr.length; i++) {
                if(inpArr[i].type == "text" || inpArr[i].type == "email") {
                    switch(inpArr[i].name) {
                    // case "userid":
                    //     if(!/^(?!^[!@#$%^&*\-=_+])[a-zA-Z0-9!@#$%^&*=\-_+]{4,32}$/g.test(inpArr[i].value)) {
                    //         validationResult.isSuccess = false;
                    //         validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "regexfail"));
                    //     }
                    //     break;
                    // 유저ID는 삭제함
                    case "username":
                        if(!/^[가-힣]{1,}$/g.test(inpArr[i].value)) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "이름은 한글로만 이루어져야 합니다"));
                        }
                        break;
                    // case "userbirth":
                    //     //우선 java.sql.Date와 호환 가능한 문자열인지 확인
                    //     /*
                    //     일단 임의로 성인만 가입 가능하게 설정함
                    //     성인의 기준은 올해 기준 만 19세 이상부터로 함
                    //     - 의견 : 만 14세?
                    //         만 14세로 가기로 함
                    //             대충 올해기준으로 만 14세가 될 수 있으면 오케이
                    //     */
                        
                    //     // 윤년, 달 각각의 최대 일수는 정규식으로 체크하지 않음
                    //     // 유효한 값 범위 : 1900-01-01 ~ 2099-12-31
                    //     if(/^(19\d{2}|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/g.test(inpArr[i].value)) {
                    //         //Date 객체를 통해 입력값이 유효한지 다시 확인
                    //         // 일단 입력값을 3등분한다
                    //         const splitArr = inpArr[i].value.split("-");

                    //         //현재 년도 기준 만 14세 미만으로 입력이 들어오면 내친다
                    //         // 24년 기준 11년생부터 x
                    //         if(Number(splitArr[0]) <= (new Date().getFullYear() - 14)) {
                    //             //윤년, 월에 따른 최대 월수를 넘기지 않았는지 확인
                    //             if(Number(splitArr[2]) <= new Date(splitArr[0], splitArr[1], 0).getDate()) {
                    //                 //좋은 입력
                    //                 // 바로 switch문 탈출
                    //                 break;
                    //             } else {
                    //                 //윤달 없는 년도에 윤일 입력, 윤년 아닌 2월에 29일이라던가
                    //                 validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "잘못된 월일 입력입니다"));
                    //             }
                    //         } else {
                    //             //만 14세 미만
                    //             validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "만 14세 미만은 가입할 수 없습니다"));
                    //         }
                    //     } else {
                    //         //정규식 실패 - 19, 20xx-MM-dd 형태를 벗어난 경우
                    //         /*
                    //             정확히는 아래와 같음
                    //                 년도 - 1900 ~ 2099 외의 값
                    //                 월 - 01 ~ 12 외의 값(0 생략 x)
                    //                 일 - 01 ~ 31 외의 값(0 생략 x, 윤달 체크 x)
                    //         */
                    //         validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "생년월일 입력 양식을 지켜주세요 (ex) 2000-01-01"));
                    //     }
                    //     validationResult.isSuccess = false;
                    //     break;
                    case "userbirth":
                        //이제는 age(INT)로 함
                        //숫자 형식에 부합하는지 확인
                        if(/^\d+$/g.test(inpArr[i].value)) {
                            //만 14세 이상인지 확인
                            if(Number(inpArr[i].value) >= 14) {
                                //통과
                                break;
                            } else {
                                validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "만 14세 이상이여야 합니다"));
                            }
                        } else {
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "숫자만 입력해주세요"));
                        }
                        validationResult.isSuccess = false;
                        break;
                    case "tel_mobile":
                        // 010-ddd-dddd 혹은 010-dddd-dddd
                        if(!/^010-(\d{3,4})-(\d{4})$/g.test(inpArr[i].value)) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "휴대폰 전화번호 양식을 지켜주세요 (ex) 010-1234-1234, 010-123-1234"));
                        }
                        break;
                    case "tel_sub":
                        // 집전화 + 휴대전화 양식
                        // 참조
                        // https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%EC%9D%98_%EC%A0%84%ED%99%94%EB%B2%88%ED%98%B8_%EC%B2%B4%EA%B3%84#%EC%A7%80%EC%97%AD_%EB%B2%88%ED%98%B8_(02,_0NZ)
                        if(!/^0((10-(\d{4})-(\d{4}))|(2|3[1-3]|4[1-4]|5[1-5]|6[1-4])-(\d{3,4})-(\d{4}))$/g.test(inpArr[i].value)) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "전화번호 양식을 지켜주세요 (ex) 02-123-1234"));
                        }
                        break;
                    case "email":
                        if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/g.test(inpArr[i].value)) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "이메일 양식을 지켜주세요 (ex) aaa@email.com"));
                        }
                        break;
                    case "zip":
                        //숫자만, 5자리 - 01000 ~ 63999까지
                        if(!/^(0[1-9]|[1-5][0-9]|6[0-3])(\d{3})$/g.test(inpArr[i].value)) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "우편번호 양식을 지켜주세요 (ex) 01001"));
                        }
                        break;
                    case "addr":
                    case "addrdetail":
                    case "addretc":
                        //임마는 어케해야될지 좀 찾아봐야겠음
                        break;
                    }
                } else if(inpArr[i].type == "radio") {
                    //radio버튼은 정규식 대신 체크된 input이 존재하는지만 체크함
                    switch(inpArr[i].name) {
                    case "usersex":
                        if(!inpArr[i].checked && !inpArr[i + 1].checked) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "성별 항목을 체크해주세요"));
                        }
                        i++;
                        break;
                    case "usernational":
                        if(!inpArr[i].checked && !inpArr[i + 1].checked) {
                            validationResult.isSuccess = false;
                            validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "국적 항목을 체크해주세요"));
                        }
                        i++;
                        break;
                    }
                }
            }
        } 
        // 비밀번호 폼
        else {
            //password의 경우 existing_userpw는 여기서 체크하지는 않음
            // inpArr[n].name >> n == 0 : existing_userpw, 1 : modified_userpw, 2: modified_userpw_check
            /*
                ^(?=.*[!@#$%^&*\-=_+])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*\-=_+]{8,64}$
                8-64문자, 공백 없이, 영/숫/특, 숫/특 각각 최소 1개
            */

            //정규식 체크
            for(let i = 0; i < 3; i++) {
                if(!/^(?=.*[!@#$%^&*\-=_+])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*\-=_+]{8,64}$/g.test(inpArr[i].value)) {
                    validationResult.isSuccess = false;
                    validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[i].name, "비밀번호는 8-64자리여야 하며 숫자와 특수문자(!@#$%^&*-=_+)를 포함해야 합니다"));
                    break;
                }
            }

            //새 비밀번호와 비밀번호 확인이 동일한지 체크
            if(inpArr[1].value != inpArr[2].value) {
                validationResult.isSuccess = false;
                validationResult.failedReasonArray.push(new ValidationFailedReason(inpArr[2].name, "비밀번호 확인은 새 비밀번호와 동일해야 합니다"));
            }
        }

        return validationResult;
    }

    //유효성 검사 실패원인 정리용 객체 생성자
    /**
     * 유효성 검사의 실패원인을 저장하는 객체의 생성자
     * @constructor
     * @param {string} elementName - 유효성 검사를 통과하지 못한 input 요소의 name 속성값
     * @param {string} failedReason - 유효성 검사를 통과하지 못한 이유
    */
    function ValidationFailedReason(elementName, failedReason) {
        this.elementName = elementName;
        this.failedReason = failedReason;
    }

    //===============================================================================================================
    //폼 submit 함수
    /*
        Ajax
    */

    //이벤트리스너 - 어느 폼이 submit을 했는지 확인해야 함
    /*
        오류
        대충 뭐
        클릭된 submit 버튼을 sumbit 버튼 id 배열과 비교해
        동일한 경우 해당 i 값으로 form배열(getElementsByTagName()으로 끌고온)
        에서 해당하는 form을 가져오는데
        전번에 password-block을 추가하면서 이게 꼬임
        전 : default > contacts > addr
        지금 : default > password > contacts > addr

        일단 제일 간단한 해결책은 submit id 배열에 순서에 맞게 (빈)요소값을 넣어주는거임
        근데 그러면 FORM_*_BTN_ID류랑 ELE_CLASS_* 류 배열 전부 빈 요소를 넣어 순서를 맞춰줘야 함
            uniOpenCancel.. 쪽 함수에서 다 얽혀있어서 하나만 추가해두면 꼬임
        그냥 uniFormSubmit 쪽에 하드코딩해둠 240415
    */
    function uniFormSubmit_btnClickEvent(event) {
        for(let i = 0; i < 3; i++) {
            if(event.target.id === FORM_SUBMIT_BTN_ID[i]) {
                const formEle = i == 0 ? document.getElementById("update-default-info") :
                    i == 1 ? document.getElementById("update-contacts-info") :
                    document.getElementById("update-addr-info");
                const valiResult = uniValidationChecker(formEle);
                if(valiResult.isSuccess) {
                    sendJsonByAjax(jsonPacker(formEle));
                } else {
                    console.log(valiResult);
                    //임시 실패원인 출력
                    let reasonStr = "";
                    for(let reason of valiResult.failedReasonArray) {
                        reasonStr += reason.failedReason + "\n";
                    }
                    printAlert(reasonStr);
                }
                break;
            }
        }
    }

    //비밀번호 입력용 이벤트리스너
    function pwFormSubmit_btnClickEvent(event) {
        const valiResult = uniValidationChecker(document.getElementById("update-password-info"));
        if(valiResult.isSuccess) {
            sendJsonByAjax(jsonPacker(document.getElementById("update-password-info")));
        } else {
            console.log(valiResult);
            //임시 실패원인 출력
            let reasonStr = "";
            for(let reason of valiResult.failedReasonArray) {
                reasonStr += reason.failedReason + "\n";
            }
            printAlert(reasonStr);
        }

        //일단 임시로 여기에서 input:password value 값들을 지운다
        const inpArr = document.getElementById("update-password-info").getElementsByTagName("input");

        for(let inp of inpArr) {
            inp.value = "";
        }
    }

    //json 만드는 친구
    // 문자열 형태의 json 값을 반환함
    function jsonPacker(formElement) {
        //객체 초기화
        const obj = {
            formID: formElement.id,
            inputs: []
        };

        //폼 input들 받아오기
        const inpArr = formElement.getElementsByTagName("input");

        //객체에 input 값 넣기
        for(let i = 0; i < inpArr.length; i++) {
            //라디오버튼 처리
            if(inpArr[i].type === "radio") {
                //default폼 - 성별-국적 처리
                //대충 이정도로 구성
                // 순서상 usernational input 두개 > usersex input 두개이니
                // 첫 usernational을 잡고 i, i + 1/2/3으로 나머지에도 접근해서 처리
                // 다 하고나서 i += 3 을 넣어준다
                if(inpArr[i].name === "usernational") {
                    let val = "";
                    // 국적 체크
                    if(inpArr[i].checked)
                        val += "-K";
                    else if(inpArr[i+1].checked)
                        val += "-F";
                    // 성별 체크
                    if(inpArr[i+2].checked)
                        val = "M" + val;
                    else if(inpArr[i+3].checked)
                        val = "W" + val;
                    // 삽입
                    obj.inputs.push(new innerJsonPackerForRadio("radio", "usersex", val));
                    // 순회 넘기기
                    i += 3;
                }
            } 
            //그외 input의 경우
            else {
                obj.inputs.push(new innerJsonPacker(inpArr[i]));
            }
        }

        //객체 json화 후 반환
        return JSON.stringify(obj);
    }

    //json 내부 배열 안에 들어갈 객체를 만드는 생성자
    // 각 input들과 대응됨
    function innerJsonPacker(inputElement) {
        this.inputType = inputElement.type;
        this.name = inputElement.name;
        this.value = inputElement.value;
    }
    function innerJsonPackerForRadio(inputType, name, value) {
        this.inputType = inputType;
        this.name = name;
        this.value = value;
    }

    //보내고 받기 - ㅇㅇ
    function sendJsonByAjax(json) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            switch(xhr.readyState) {
                case XMLHttpRequest.OPENED:
                    break;
                case XMLHttpRequest.DONE:
                    if(xhr.status === 200) {
                        if(xhr.responseText != null) {
                            const resultObj = JSON.parse(xhr.responseText);
                            if(resultObj.isSuccess) {
                                //수정 성공 - 수정값 받기 성공
                                console.log("receiving success");
                                console.log("result JSON : \n" + xhr.responseText);
                                console.log(JSON.parse(xhr.responseText));
                                if(JSON.parse(xhr.responseText).formID != "update-password-info")
                                    updateScreenByJson(JSON.parse(xhr.responseText));
                                printAlert("개인정보가 수정되었습니다");
                            } else if(resultObj.failReason == "Server") {
                                //서버 쪽 문제로 수정 실패
                                console.log("receiving failed");
                                console.log("result JSON : \n" + xhr.responseText);
                                printAlert("서버 문제로 수정을 실패했습니다");
                            } else if(resultObj.failReason == "Validation") {
                                //유효성 검사 실패
                                console.log("validation check failed");
                                console.log("result JSON : \n" + xhr.responseText);
                                printAlert("입력값이 잘못되어 수정을 실패했습니다");
                            } else if(resultObj.failReason == "PasswordWrong") {
                                //비밀번호 수정 시도 - 기존 비밀번호와 입력값이 틀림
                                console.log("password wrong failed");
                                console.log("result JSON : \n" + xhr.responseText);
                                printAlert("비밀번호가 잘못되었습니다");
                            } else {
                                //기타? - failedReason이 없거나 뭐..
                                console.log("unknown fail");
                                console.log("result JSON : \n" + xhr.responseText);
                                printAlert("원인 불명의 오류로 수정을 실패했습니다");
                            }
                        } else {
                            //JSON 파일이 null인 경우
                            console.log("receiving failed : JSON respond is null");
                            printAlert("서버 문제로 수정을 실패했습니다");
                        }
                    } else {
                        //xhr.status === 404 서버에 문서가 없는 경우, 혹은 서버가 꺼져있는 경우
                        console.log("receiving failed : there no such file or..");
                        printAlert("서버 문제로 수정을 실패했습니다");
                    }
                    break;
            }
        }

        // 성공/실패 여부 판별및 처리 이전까지는 추가적인 submit 입력을 막아야 함!
        xhr.open("POST", "/update.us", true);
       	// xhr.open("POST", "/teamproject/test/ajax", true);
        xhr.setRequestHeader("Context-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send(json);
    }

    //성공시 화면을 갱신하는 함수
    function updateScreenByJson(resJson) {
        const formID = resJson.formID;
        const resArr = resJson.result;

        for(let obj of resArr) {
            if(obj.inputType == "radio" && obj.name == "usersex") {
                switch(obj.value.trim()) {
                    case "M-K":
                        document.getElementById("national-display").innerHTML = "내국인";
                        document.getElementById("sex-display").innerHTML = "남성";
                        break;
                    case "W-K":
                        document.getElementById("national-display").innerHTML = "내국인";
                        document.getElementById("sex-display").innerHTML = "여성";
                        break;
                    case "M-F":
                        document.getElementById("national-display").innerHTML = "외국인";
                        document.getElementById("sex-display").innerHTML = "남성";
                        break;
                    case "W-F":
                        document.getElementById("national-display").innerHTML = "외국인";
                        document.getElementById("sex-display").innerHTML = "남성";
                        break;
                    default:
                        document.getElementById("national-display").innerHTML = "??";
                        document.getElementById("sex-display").innerHTML = "??";
                        break;
                }
            } else {
                switch(obj.name) {
                    // case "userid":
                    //     document.getElementById("id-display").innerHTML = obj.value;
                    //     break;
                    case "username":
                        document.getElementById("name-display").innerHTML = obj.value;
                        document.getElementById("header-text").innerHTML = "환영합니다 " + obj.value + "님";
                        break;
                    case "userbirth":
                        document.getElementById("birth-display").innerHTML = obj.value;
                        break;
                    case "tel_mobile":
                        document.getElementById("tel-display").innerHTML = obj.value;
                        break;
                    case "tel_sub":
                        document.getElementById("telsub-display").innerHTML = obj.value;
                        break;
                    case "email":
                        document.getElementById("email-display").innerHTML = obj.value;
                        break;
                    case "zip":
                        document.getElementById("zip-display").innerHTML = obj.value;
                        break;
                    case "addr":
                        document.getElementById("addr-display").innerHTML = obj.value;
                        break;
                    case "addrdetail":
                        document.getElementById("addrdetail-display").innerHTML = obj.value;
                        break;
                    case "addretc":
                        document.getElementById("addretc-display").innerHTML = obj.value;
                        break;
                }
            }
        }

        // 열려있던 input 창을 닫는다
        // 일단은 여기다 둠 - 다른데에 두기에는 좀... 애매함
        for(let i = 0; i < 3; i++) {
            if(formID === FORM_ID[i]) {
                document.getElementById(FORM_CANCEL_BTN_ID[i]).click();
            }
        }
    }

    //===============================================================================================================
    //메시지류 뽑는 함수
    /*
        그뭐냐 window.alert()같은거ㅇㅇ
    */
    function printAlert(message) {
        window.alert(message);
    }

    //===============================================================================================================
    //카카오 주소찾기 API
    function kakaoPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                let roadAddr = data.roadAddress; //도로명주소
                let extraRoadAddr = ""; //참고항목

                // 법정동명이 있으면 추가
                if(data.bname !== "" && /[동/로/가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }

                // 건물명이 있으며 공동주택인 경우 추가
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip-input').value = data.zonecode;
                document.getElementById("addr-input").value = roadAddr;
                
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("addrdetail-input").value = extraRoadAddr;
                } else {
                    document.getElementById("addrdetail-input").value = '';
                }
            }
        }).open();
    }
</script>
</html>