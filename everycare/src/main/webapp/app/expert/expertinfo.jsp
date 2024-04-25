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
	
	    /* 각 섹션 사이(위아래) 간격 띄우기 */
	    .content {
	        padding-top: 1.5rem;
	        margin-bottom: 3rem;
	    }
	    /* 너무 큰 input 줄이기 */
	    /* 추가로 좌우 패딩도 1rem > 0.5rem으로 줄임 */
	    /* 또한 상하 폭을 p.value-printer와 비슷하게 맞춤 */
	    input[type=text], input[type=email] {
	        height: 2rem;
	        margin-bottom: 0.6rem;
	        padding: 0 0.5rem;
	    }
	    input[type=password] {
	        height: 2rem;
	        margin-bottom: 0.6rem;
	        padding: 0 0.5rem;
	        font-size: 0.7rem;
	    }
	    /* input border 조금만 더 진하게 + radio버튼 label ::before 요소(체크박스) 도 진하게 */
	    input, textarea {
	        border-color: #e6e6e6!important;
	    }
	    input[type=radio] + label::before {
	        border-color: #e6e6e6;
	    }
	
	    /*inner-content-div 안의 p의 미친 마진바텀 줄이기*/
	    /* 추가로 p 폰트사이즈도 줄이기 */
	    /* 이 클래스없는 생짜 p는 출력요소의 이름을 표시하는데 씀 */
	    /* 따라서 입력폼 화면에서도 동일하게 보여지게 해둠 */
	    .inner-content-div>div.default-screen>p, .inner-content-div>div.input-screen>form>p {
	        margin-bottom: 0;
	        font-size: 0.7rem;
	    }
	    /* 정보 표시용 p 사이즈 수정 */
	    .inner-content-div>div.default-screen>p.value-printer {
	        margin-bottom: 0.8rem;
	        font-size: 1rem;
	    }
	    /* 장문 표시용 p 사이즈 수정 */
	    .inner-content-div>div.default-screen>p.text-printer {
	        margin-bottom: 0.8rem;
	        font-size: 0.8rem;
	    }
	    /* 전문가 키워드, 전문가 파일 등록 등 부분 p 수정 */
	
	    /* 숨기기 */
	    .hidden {
	        display: none!important;
	    }
	
	    /* 수정하기 버튼 크기 줄이고 h4랑 나란히 두기 */
	    /* 그리고 h4 마진을 없애고 ul 마진을 줄여서 상하간격 적절히 맞추기 */
	    /* 추가로 수정하기 버튼쪽 li에만 text-align: right 넣고 버튼 크기 고정시키기 */
	    ul.actions.fit.info-header {
	        margin-bottom: 0.65rem;
	    }
	    ul.actions.fit.info-header>li:has(a.button.small.smaller) {
	        text-align: right;
	    }
	    ul.actions.fit.info-header>li>h4 {
	        margin: 0;
	    }
	    a.button.small.smaller {
	        /* width: 70%; */
	        width: 4rem;
	        height: 1.5rem;
	        line-height: 1.5rem;
	        padding: 0 0.5rem;
	    }
	    a.button.small.smaller.long {
	        width: 8rem;
	    }
	
	    /* 카카오 주소찾기 버튼만을 위한 */
	    a#kakao-post-btn.button.small {
	        padding: 0 0.8rem;
	    }
	
	    /* 입력폼 radio label 글씨 크기 줄이기 */
	    div.row.gtr-uniform>div.col-6.col-12-xsmall>label {
	        font-size: 0.8rem;
	    }
	    /* 바로 위의 label 글씨 크기 줄이기를 하니 radio 영역이 너무 줄어서 하부 영역이 침입해옴 */
	    /* 부모 요소에게 바텀마진을 준다 */
	    div.row.gtr-uniform>div.col-6.col-12-xsmall {
	        margin-bottom: 0.8rem;
	    }
	
	    /* textarea 박스 크기 수정 막기, 글자 크기 줄이기, 바텀마진 부여 */
	    textarea {
	        resize: none;
	        margin-bottom: 0.8rem;
	        font-size: 0.8rem;
	    }
	
	    /* 입력폼 cancel/submit 버튼 얇게 만들기 */
	    /* primary 클래스는 일부러 빼둠 - 나중에 색만 다르게 이 속성 쓸 수도 있으니까 */
	    /* 또한 최대 크기를 지정해 모바일 화면에서 버튼이 너무 길어지지 않게 해둠 */
	    a.button.fit.small.thin {
	        max-width: 20rem;
	        height: 1.5rem;
	        line-height: 1.5rem;
	    }
	    /* 위의 버튼이 max-width 속성탓에 모바일 화면에서 중앙 정렬이 안되서 추가함 */
	    ul.actions.fit.small>li:has(a.button.fit.small.thin) {
	        text-align: center;
	    }
	
	    /* 경력/자격증 테이블 관련 */
	    /* th, td height, pb 줄이기 */
	    table tr>th {
	        font-size: 0.7rem;
	        padding-bottom: 0.5rem;
	    }
	    table tr>td {
	        font-size: 0.9rem;
	        padding-top: 0.5rem;
	        padding-bottom: 0.5rem;
	    }
	    
	    /* 왠지는 몰라도 p랑 h1234들이 중앙정렬됨 */
	    div.inner.alt {
	    	text-align: left!important;
	    }
	
	    /* 경력/자격증 */
	        /* 경력/자격증 섹션 수정/삭제 버튼용 */
	        a.button.small.smaller.smallest {
	            width: 2.5rem;
	            height: 1.5rem;
	            line-height: 1.5rem;
	            padding: 0 0.5rem;
	        }
	        /* 경력 섹션 td/th 폭/패딩 강제지정 */
	        div.career-value-table thead>tr>th:nth-child(1),
	        div.career-value-table tbody>tr>td:nth-child(1),
	        div.career-value-table tbody>tr>td:nth-child(6) {
	            width: 40%;
	        }
	        div.career-value-table thead>tr>th:nth-child(4),
	        div.career-value-table thead>tr>th:nth-child(5),
	        div.career-value-table tbody>tr>td:nth-child(4),
	        div.career-value-table tbody>tr>td:nth-child(5),
	        div.career-value-table tbody>tr>td:nth-child(9),
	        div.career-value-table tbody>tr>td:nth-child(10) {
	            width: 5%;
	        }
	        /* 경력/자격증 tfoot submit 버튼 우정렬 */
	        div.career-value-table tfoot>tr>td,
	        div.license-value-table tfoot>tr>td {
	            text-align: right;
	        }
	        /* 자격증 섹션 td/th 폭 강제지정 */
	        div.license-value-table thead>tr>th:nth-child(1),
	        div.license-value-table tbody>tr>td:nth-child(1)
	        div.license-value-table tbody>tr>td:nth-child(5) {
	            width: 55%;
	        }
	        div.license-value-table thead>tr>th:nth-child(2),
	        div.license-value-table tbody>tr>td:nth-child(2),
	        div.license-value-table tbody>tr>td:nth-child(6) {
	            width: 25%;
	            padding-left: 0.3rem;
	            padding-right: 0.3rem;
	        }
	        div.license-value-table thead>tr>th:nth-child(3),
	        div.license-value-table thead>tr>th:nth-child(4),
	        div.license-value-table tbody>tr>td:nth-child(3),
	        div.license-value-table tbody>tr>td:nth-child(4),
	        div.license-value-table tbody>tr>td:nth-child(7),
	        div.license-value-table tbody>tr>td:nth-child(8) {
	            width: 10%;
	            padding-left: 0.3rem;
	            padding-right: 0.3rem;
	        }
	        /* 수정 input들 바텀마진 죽이기 */
	        /* 추가로 좀 높이랑 폰트사이즈 줄이기 */
	        /* 추가로 input들 좀 왼쪽으로 보내기 */
	        div.inner-content-div:has(div.table-wrapper.career-value-table) tbody#career-dynamic input, 
	        div.inner-content-div:has(div.table-wrapper.license-value-table) tbody#license-dynamic input {
	            margin-bottom: 0; padding-left: 0.2rem;
	            height: 1.8rem;
	            font-size: 0.8rem;
	            line-height: 0.8rem;
	        }
	        /* input td들 좌우마진 좀 줄이기 */
	        tbody>td.inprow {
	            padding-left: 0.5rem; padding-right: 0.5rem;
	        }
	        /* 경력/자격증 추가쪽 input 밑으로 밀기 */
	        div.inner-content-div:has(div.table-wrapper.career-value-table), 
	        div.inner-content-div:has(div.table-wrapper.license-value-table) {
	            position: relative;
	            height: 100%;
	            padding-bottom: 3.5rem;
	        }
	        div.career-input-table, div.license-input-table {
	            position: absolute;
	            bottom: -1rem;
	        }
	        div#image-placeholder {
	            width: 10rem;
	            height: 10rem;
	            background-repeat: no-repeat;
	            background-size: contain;
	        }
	        /* 키워드 버튼 조정 */
	        form#keywordform>ul>li>a {
	            height: 2rem;
	            line-height: 2rem;
	            padding: 0 1rem;
	            font-size: 0.7rem;
	        }
	       	/*헤더 관련*/
	       	header.accent1 {
	       		margin-top: 1.5rem;
	       		padding: 3rem 0 0.5rem 0!important;
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
	</style>
</head>
<body>
    <div id="wrapper">
        <!-- 공용 헤더 -->
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
									<c:if test="${not empty loginUser}">
									<li class="mypage">
										<a href="${cp}/" class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
										<ul class="drop_menu">
											<li class="mypage"><a href="${cp}/userinfo.us">유저 정보</a></li>
											<c:if test="${not empty expertSession}">
												<li class="expertpage"><a href="${cp}/expertinfo.ep">전문가 정보</a></li>
											</c:if>
										</ul>
										</li>	
									</c:if>							
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
            <!-- 페이지 헤더 -->
            <header class="accent1">
                <h1>전문가 마이페이지</h1>
                <p>
                    환영합니다 ${userdto.name}님
                </p>
            </header>
            <!-- 내부 네비바 -->
            <div class="inner-nav">
                <ul>
                    <li style="white-space: nowrap;">
                        <a href="${cp}/expertinfo.ep">전문가정보 관리</a>
                    </li>
                    <li style="white-space: nowrap;">
                        <a href="${cp}/getexpertPaymentlist.pm">이용 내역 확인</a>
                    </li>
                </ul>
            </div>
            <!-- 내부 네비바 끝 -->
            <!-- 본문 -->
            <div class="inner alt">
                <!-- user/expert 정보 섹션 -->
                <div class="content">
                    <div class="row-wrapper">
                        <h2>사용자 정보</h2>
                        <div class="row gtr-200">
                            <!-- user/expert 정보 섹션 좌측 -->
                            <!-- main block -->
                            <div class="col-3 col-12-medium">
                                <div class="inner-content-div">
                                    <ul class="actions fit info-header">
                                        <li>
                                            <h4>기본 정보</h4>
                                        </li>
                                        <li>
                                            <a id="main-edit-btn" class="button primary small smaller" style="cursor: pointer;">수정하기</a>
                                        </li>
                                    </ul>
                                    <div id="main-default-screen" class="default-screen">
                                        <p>ID</p>
                                        <p class="value-printer">${expertonlydto.user_id}</p>
                                        <p>이름</p>
                                        <p class="value-printer">${userdto.name}</p>
                                        <p>국적</p>
                                        <p class="value-printer">
                                            <c:choose>
                                                <c:when test="${userdto.gender eq 'M-K' || userdto.gender eq 'W-K'}">내국인</c:when>
                                                <c:when test="${userdto.gender eq 'M-F' || userdto.gender eq 'W-F'}">외국인</c:when>
                                                <c:otherwise>??</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p>성별</p>
                                        <p class="value-printer">
                                            <c:choose>
                                                <c:when test="${userdto.gender eq 'M-K' || userdto.gender eq 'M-F'}">남성</c:when>
                                                <c:when test="${userdto.gender eq 'W-K' || userdto.gender eq 'W-F'}">여성</c:when>
                                                <c:otherwise>??</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p>나이</p>
                                        <p class="value-printer">${userdto.age}</p>
                                        <p>운전 가능 여부</p>
                                        <p class="value-printer">
                                            <c:choose>
                                                <c:when test="${expertonlydto.is_drivable}">가능</c:when>
                                                <c:otherwise>불가능</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p>계좌정보</p>
                                        <p class="value-printer">${expertonlydto.account}</p>
                                        <p>요금(시급)</p>
                                        <p class="value-printer">${expertonlydto.cost}</p>
                                    </div>
                                    <div id="main-input-screen" class="input-screen hidden">
                                        <form id="main-form" action="${pageContext.request.contextPath}/expertinfo/update/fm.ep" method="post">
                                            <input type="hidden" name="formname" value="main">
                                            <p>기존 비밀번호</p>
                                            <input type="password" name="user-existing-pw" id="main-user-existing-pw" placeholder="비밀번호 수정시에만 입력해주세요">
                                            <p>새 비밀번호</p>
                                            <input type="password" name="user-modified-pw" id="main-user-modified-pw" placeholder="8-64글자, 숫자/특수문자를 포함해야 함">
                                            <p>새 비밀번호 확인</p>
                                            <input type="password" name="user-pw-check" id="main-user-pw-check" placeholder="새 비밀번호와 같아야 합니다">
                                            <p>이름</p>
                                            <input type="text" name="user-name" id="main-user-name">
                                            <p>국적</p>
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="radio" name="user-national" id="national-korean" value="K">
                                                    <label for="national-korean">내국인</label>
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="radio" name="user-national" id="national-foreign" value="F">
                                                    <label for="national-foreign">외국인</label>
                                                </div>
                                            </div>
                                            <p>성별</p>
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="radio" name="user-sex" id="sex-male" value="M">
                                                    <label for="sex-male">남성</label>
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="radio" name="user-sex" id="sex-female" value="W">
                                                    <label for="sex-female">여성</label>
                                                </div>
                                            </div>
                                            <input type="hidden" name="real-user-sex" id="main-real-user-sex" value="">
                                            <p>나이</p>
                                            <input type="text" name="user-age" id="main-user-age">
                                            <p>운전 가능 여부</p>
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="radio" name="expert-drivable" id="isdrive-yes" value="Y">
                                                    <label for="isdrive-yes">가능</label>
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="radio" name="expert-drivable" id="isdrive-no" value="N">
                                                    <label for="isdrive-no">불가능</label>
                                                </div>
                                            </div>
                                            <p>계좌정보</p>
                                            <input type="text" name="expert-account" id="main-expert-account">
                                            <p>요금(시급)</p>
                                            <input type="text" name="expert-cost" id="main-expert-cost">
                                            <ul class="actions fit small">
                                                <li>
                                                    <a id="main-cancel-btn" class="button primary fit small thin" style="cursor: pointer">취소하기</a>
                                                </li>
                                                <li>
                                                    <a id="main-submit-btn" class="button primary fit small thin" style="cursor: pointer">등록하기</a>
                                                </li>
                                            </ul>
                                        </form>
                                    </div>
                                    <!-- input-screen 끝 -->
                                </div>
                            </div>
                            <!-- user/expert 정보 섹션 우측 -->
                            <!-- contacts block -->
                            <div class="col-3 col-12-medium">
                                <div class="inner-content-div">
                                    <ul class="actions fit info-header">
                                        <li>
                                            <h4>연락처</h4>
                                        </li>
                                        <li>
                                            <a id="contacts-edit-btn" class="button primary small smaller" style="cursor: pointer;">수정하기</a>
                                        </li>
                                    </ul>
                                    <div id="contacts-default-screen" class="default-screen">
                                        <p>휴대폰 번호</p>
                                        <p class="value-printer">${userdto.tel_mobile}</p>
                                        <p>전화번호(예비)</p>
                                        <p class="value-printer">${userdto.tel_sub}</p>
                                        <p>이메일</p>
                                        <p class="value-printer">${userdto.email}</p>
                                        <p>우편번호</p>
                                        <p class="value-printer">${userdto.zipcode}</p>
                                        <p>주소</p>
                                        <p class="value-printer">${userdto.addr}</p>
                                        <p>상세주소</p>
                                        <p class="value-printer">${userdto.addr_detail}</p>
                                        <p>추가정보</p>
                                        <p class="value-printer">${userdto.addr_etc}</p>
                                    </div>
                                    <div id="contacts-input-screen" class="input-screen hidden">
                                        <form id="contacts-form" action="${pageContext.request.contextPath}/expertinfo/update/fm.ep" method="post">
                                            <input type="hidden" name="formname" value="contacts">
                                            <p>휴대폰 번호</p>
                                            <input type="text" name="user-tel-mobile" id="contacts-user-tel-mobile">
                                            <p>전화번호(예비)</p>
                                            <input type="text" name="user-tel-sub" id="contacts-user-tel-sub">
                                            <p>이메일</p>
                                            <input type="email" name="user-email" id="contacts-user-email">
                                            <p>우편번호</p>
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="user-zipcode" id="contacts-user-zipcode">
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <a id="kakao-post-btn" class="button primary fit small" style="cursor: pointer;">우편번호 찾기</a>
                                                </div>
                                            </div>
                                            <p>주소</p>
                                            <input type="text" name="user-addr" id="contacts-user-addr">
                                            <p>상세주소</p>
                                            <input type="text" name="user-addr-detail" id="contacts-user-addr-detail">
                                            <p>추가정보</p>
                                            <input type="text" name="user-addr-etc" id="contacts-user-addr-etc">
                                            <ul class="actions fit small">
                                                <li>
                                                    <a id="contacts-cancel-btn" class="button primary fit small thin" style="cursor: pointer">취소하기</a>
                                                </li>
                                                <li>
                                                    <a id="contacts-submit-btn" class="button primary fit small thin" style="cursor: pointer">등록하기</a>
                                                </li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-12-medium">
                                <div class="inner-content-div">
                                    <ul class="actions fit info-header">
                                        <li>
                                            <h4>전문가 키워드</h4>
                                        </li>
                                        <li>
                                            <a id="keywordsubmit" class="button primary small smaller long" style="cursor: pointer;">등록하기</a>
                                        </li>
                                    </ul>
                                    <p style="font-size: 0.7rem; margin-bottom: 1rem;">가능한 업무의 키워드를 선택해주세요(최소 1개 이상)</p>
                                    <form action="${pageContext.request.contextPath}/expertinfo/update/fm.ep" method="post" id="keywordform">
                                        <input type="hidden" name="formname" value="keywords">
                                        <input type="hidden" name="keywordlist" value="" id="keywordsinput">
                                        <ul class="actions">
                                            <li>
                                            	<c:if test='${expertkeywords.contains("베이비시터")}'>
                                                	<a id="k1" class="button primary" style="cursor: pointer;">베이비시터</a>
                                                </c:if>
                                                <c:if test='${!expertkeywords.contains("베이비시터")}'>
                                                	<a id="k1" class="button" style="cursor: pointer;">베이비시터</a>
                                                </c:if>
                                            </li>
                                            <li>
                                            	<c:if test='${expertkeywords.contains("학습시터")}'>
                                                	<a id="k2" class="button primary" style="cursor: pointer;">학습시터</a>
                                                </c:if>
                                                <c:if test='${!expertkeywords.contains("학습시터")}'>
                                                	<a id="k2" class="button" style="cursor: pointer;">학습시터</a>
                                                </c:if>
                                            </li>
                                            <li>
                                            	<c:if test='${expertkeywords.contains("등하원도우미")}'>
                                                	<a id="k3" class="button primary" style="cursor: pointer;">등하원도우미</a>
                                                </c:if>
                                                <c:if test='${!expertkeywords.contains("등하원도우미")}'>
                                                	<a id="k3" class="button" style="cursor: pointer;">등하원도우미</a>
                                                </c:if>
                                            </li>
                                            <li>
                                            	<c:if test='${expertkeywords.contains("병원동행")}'>
                                                	<a id="k4" class="button primary" style="cursor: pointer;">병원동행</a>
                                                </c:if>
                                                <c:if test='${!expertkeywords.contains("병원동행")}'>
                                                	<a id="k4" class="button" style="cursor: pointer;">병원동행</a>
                                                </c:if>
                                            </li>
                                            <li>
                                            	<c:if test='${expertkeywords.contains("가사도우미")}'>
                                                	<a id="k5" class="button primary" style="cursor: pointer;">가사도우미</a>
                                                </c:if>
                                                <c:if test='${!expertkeywords.contains("가사도우미")}'>
                                                	<a id="k5" class="button" style="cursor: pointer;">가사도우미</a>
                                                </c:if>
                                            </li>
                                        </ul>
                                    </form>

                                    <ul class="actions fit info-header">
                                        <li>
                                            <h4>전문가 파일 등록</h4>
                                        </li>
                                        <li>
                                            <a id="filesubmit" class="button primary small smaller long" style="cursor: pointer;">등록하기</a>
                                        </li>
                                    </ul>
                                    <!--
                                        증명사진 하나씩만 올리기로 했으니
                                        추가로 넣는건 필요x
                                        그리고 증명사진이면 이미지 파일이니
                                        이미지 확장자만 받게 하고
                                        저장된 이미지가 있으면 미리보기로 출력시켜주자
                                    -->
                                    <!-- 이미지가 있을 때만 출력하게 함 -->
                                    <c:choose>
                                    	<c:when test="${not empty expertprofile}">
		                                    <div id="image-placeholder" style="background-image: url('${cp}/file/${expertprofile}');"></div>    	
                                    	</c:when>
                                    	<c:when test="${empty expertprofile}">
		                                    <div id="image-placeholder" class="hidden"></div>                                    	
                                    	</c:when>
                                    </c:choose>
                                    <form action="${pageContext.request.contextPath}/expertinfo/update/fl.ep" method="post" name="fileform" enctype="multipart/form-data">
                                        <input type="hidden" name="formname" value="file">
                                        <input type="file" name="fileName">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- expert 정보 섹션 -->
                <div class="content">
                    <div class="row-wrapper">
                        <h2>전문가 정보</h2>
                        <div class="row gtr-200">
                            <div class="col-7 col-12-medium">
                                <div class="inner-content-div">
                                    <ul class="actions fit info-header">
                                        <li>
                                            <h4>전문가 소개</h4>
                                        </li>
                                        <li>
                                            <a id="resume-edit-btn" class="button primary small smaller" style="cursor: pointer">수정하기</a>
                                        </li>
                                    </ul>
                                    <div id="resume-default-screen" class="default-screen">
                                        <p class="text-printer">${expertonlydto.resume}</p>
                                    </div>
                                    <div id="resume-input-screen" class="input-screen hidden">
                                        <form id="resume-form" action="${pageContext.request.contextPath}/expertinfo/update/fm.ep" method="post">
                                            <input type="hidden" name="formname" value="resume">
                                            <textarea name="expert-resume" id="resume-expert-resume" rows="10"></textarea>
                                            <div class="row gtr-200">
                                                <div class="col-6 col-12-medium"></div>
                                                <div class="col-6 col-12-medium">
                                                    <ul class="actions fit small textarea-btn">
                                                        <li>
                                                            <a id="resume-cancel-btn" class="button primary fit small thin" style="cursor: pointer">취소하기</a>
                                                        </li>
                                                        <li>
                                                            <a id="resume-submit-btn" class="button primary fit small thin" style="cursor: pointer">등록하기</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-5 col-12-medium">
                                <div class="inner-content-div">
                                    <ul class="actions fit info-header">
                                        <li>
                                            <h4>전문가 정보</h4>
                                        </li>
                                        <li>
                                            <a id="etcinfo-edit-btn" class="button primary small smaller" style="cursor: pointer">수정하기</a>
                                        </li>
                                    </ul>
                                    <div id="etcinfo-default-screen" class="default-screen">
                                        <p>근무 가능 지역</p>
                                        <p class="text-printer">${expertonlydto.location}</p>
                                        <p>근무 가능 시간</p>
                                        <p class="text-printer">${expertonlydto.available_time}</p>
                                    </div>
                                    <div id="etcinfo-input-screen" class="input-screen hidden">
                                        <form id="etcinfo-form" action="${pageContext.request.contextPath}/expertinfo/update/fm.ep" method="post">
                                            <input type="hidden" name="formname" value="etcinfo">
                                            <p>근무 가능 지역</p>
                                            <textarea name="expert-location" id="etcinfo-expert-location" rows="3"></textarea>
                                            <p>근무 가능 시간</p>
                                            <textarea name="expert-available-time" id="etcinfo-expert-available-time" rows="3"></textarea>
                                            <div class="row gtr-200">
                                                <div class="col-6 col-12-medium"></div>
                                                <div class="col-6 col-12-medium">
                                                    <ul class="actions fit small textarea-btn">
                                                        <li>
                                                            <a id="etcinfo-cancel-btn" class="button primary fit small thin" style="cursor: pointer">취소하기</a>
                                                        </li>
                                                        <li>
                                                            <a id="etcinfo-submit-btn" class="button primary fit small thin" style="cursor: pointer">등록하기</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- expert 경력/자격증 섹션 -->
                <div class="content">
                    <div class="row-wrapper">
                        <h2>경력/자격증 정보</h2>
                        <!-- expert 경력/자격증 리스트 -->
                        <div class="row gtr-200">
                            <!-- expert 경력 (좌측) -->
                            <div class="col-7 col-12-medium">
                                <div class="inner-content-div">
                                    <h4>경력 관리</h4>
                                    <div class="table-wrapper career-value-table">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>경력명</th>
                                                    <th>시작한 일시</th>
                                                    <th>그만둔 일시</th>
                                                    <th><!-- 수정 버튼 위치 잡기용 --></th>
                                                    <th><!-- 삭제 버튼 위치 잡기용 --></th>
                                                </tr>
                                            </thead>
                                            <!-- 동적생성 구역 -->
                                            <tbody id="career-dynamic">
                                            	<c:if test="${!expertcl.isEmpty()}">
                                            		<c:forEach var="career" items="${expertcl }">
                                            			<tr>
                                            				<td class="valrow">${career.career_name }</td>
                                            				<td class="valrow">${career.start_time }</td>
                                            				<td class="valrow">${career.end_time }</td>
		                                                    <td class="valrow">
		                                                        <a class="button small smaller smallest" onclick="javascript:careerAdjustmentBtn(event)">수정</a>
		                                                    </td>
		                                                    <td class="valrow">
		                                                        <a class="button small smaller smallest" onclick="javascript:careerRemoveBtn(event)">삭제</a>
		                                                    </td>
                                                            <td class="inprow hidden"><input type="text"></td>
                                            				<td class="inprow hidden"><input type="text"></td>
                                            				<td class="inprow hidden"><input type="text"></td>
		                                                    <td class="inprow hidden">
		                                                        <a class="button small smaller smallest" onclick="javascript:careerCancelBtn(event)">취소</a>
		                                                    </td>
		                                                    <td class="inprow hidden">
		                                                        <a class="button small smaller smallest" onclick="javascript:careerApplyBtn(event)">적용</a>
		                                                    </td>
                                                        </tr>
                                            		</c:forEach>
                                            	</c:if>
                                            </tbody>
                                            <!-- 동적생성 구역 끝 -->
                                            <tfoot>
                                                <tr>
                                                    <td colspan="5">
                                                        <a class="button primary small smaller" onclick="javascript:careerSubmitBtn(event)">적용하기</a>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <!-- expert 경력 입력(좌측) -->
                                    <div class="table-wrapper career-input-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td><input type="text" placeholder="경력명"></td>
                                                    <td><input type="text" placeholder="시작한 일시"></td>
                                                    <td><input type="text" placeholder="그만둔 일시"></td>
                                                    <td>
                                                        <a class="button primary fit small" onclick="javascript:careerCreateBtn(event)">추가</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- expert 자격증 (우측) -->
                            <div class="col-5 col-12-medium">
                                <div class="inner-content-div">
                                    <h4>자격증 관리</h4>
                                    <div class="table-wrapper license-value-table">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>자격증</th>
                                                    <th>취득일자</th>
                                                    <th><!-- 수정 버튼 위치 잡기용 --></th>
                                                    <th><!-- 삭제 버튼 위치 잡기용 --></th>
                                                </tr>
                                            </thead>
                                            <!-- 동적생성 구역 -->
                                            <tbody id="license-dynamic">
                                            	<c:if test="${!expertll.isEmpty()}">
                                            		<c:forEach var="license" items="${expertll }">
		                                                <tr>
		                                                    <td class="valrow">${license.license_name }</td>
		                                                    <td class="valrow">${license.acquire_date }</td>
		                                                    <td class="valrow">
		                                                        <a class="button small smaller smallest" onclick="javascript:licenseAdjustmentBtn(event)">수정</a>
		                                                    </td>
		                                                    <td class="valrow">
		                                                        <a class="button small smaller smallest" onclick="javascript:licenseRemoveBtn(event)">삭제</a>
		                                                    </td>
                                                            <td class="inprow hidden"><input type="text"></td>
                                                            <td class="inprow hidden"><input type="text"></td>
                                                            <td class="inprow hidden">
                                                                <a class="button small smaller smallest" onclick="javascript:licenseCancelBtn(event)">취소</a>
                                                            </td>
                                                            <td class="inprow hidden">
                                                                <a class="button small smaller smallest" onclick="javascript:licenseApplyBtn(event)">적용</a>
                                                            </td>
		                                                </tr>
                                            		</c:forEach>
                                            	</c:if>
                                            </tbody>
                                            <!-- 동적생성 구역 끝 -->
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">
                                                        <a class="button primary small smaller" onclick="javascript:licenseSubmitBtn(event)">적용하기</a>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <!-- expert 자격증 입력(우측) -->
                                    <div class="table-wrapper license-input-table">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td><input type="text" placeholder="자격증 이름"></td>
                                                    <td><input type="text" placeholder="취득일자"></td>
                                                    <td>
                                                        <a class="button primary fit small" onclick="javascript:licenseCreateBtn(event)">추가</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 공용 푸터 -->
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
<script>
    //================================================================================================
    //== HTMLElement 변수 ============================================================================
    
    //수정 버튼
    const mainBlockEditBtn = document.getElementById("main-edit-btn");
    const contactsBlockEditBtn = document.getElementById("contacts-edit-btn");
    const resumeBlockEditBtn = document.getElementById("resume-edit-btn");
    const etcinfoBlockEditBtn = document.getElementById("etcinfo-edit-btn");
    
    //default-screen들
    const mainBlockDefaultScreen = document.getElementById("main-default-screen");
    const contactsBlockDefaultScreen = document.getElementById("contacts-default-screen");
    const resumeBlockDefaultScreen = document.getElementById("resume-default-screen");
    const etcinfoBlockDefaultScreen = document.getElementById("etcinfo-default-screen");
    
    //input-screen들
    const mainBlockInputScreen = document.getElementById("main-input-screen");
    const contactsBlockInputScreen = document.getElementById("contacts-input-screen");
    const resumeBlockInputScreen = document.getElementById("resume-input-screen");
    const etcinfoBlockInputScreen = document.getElementById("etcinfo-input-screen");
    
    //input-screen -> 취소하기 버튼
    const mainBlockCancelBtn = document.getElementById("main-cancel-btn");
    const contactsBlockCancelBtn = document.getElementById("contacts-cancel-btn");
    const resumeBlockCancelBtn = document.getElementById("resume-cancel-btn");
    const etcinfoBlockCancelBtn = document.getElementById("etcinfo-cancel-btn");
    
    //input-screen -> 등록하기 버튼
    const mainBlockSubmitBtn = document.getElementById("main-submit-btn");
    const contactsBlockSubmitBtn = document.getElementById("contacts-submit-btn");
    const resumeBlockSubmitBtn = document.getElementById("resume-submit-btn");
    const etcinfoBlockSubmitBtn = document.getElementById("etcinfo-submit-btn");

    //기타 버튼들
    const kakaoPostBtn = document.getElementById("kakao-post-btn");
    
    //================================================================================================
    //== 이벤트 등록 ==================================================================================

    //일단 임시로 익명함수로 만듬
    // 편집하기 편하게 함수로 빼거나 하고
    // 그리고 *-edit-btn 클릭시 input으로 기존 값을 가져올 수 있게 해줘야 함
    // 아니면 처음부터 서버에서 꾸려줄 때 EL로 넣던가

    //main
    //editBtn
    mainBlockEditBtn.addEventListener("click", (event) => {
        mainBlockDefaultScreen.classList.add("hidden");
        mainBlockEditBtn.classList.add("hidden");
        mainBlockInputScreen.classList.remove("hidden");
        openMainBlockForm();
    });
    //cancelBtn
    mainBlockCancelBtn.addEventListener("click", (event) => {
        mainBlockDefaultScreen.classList.remove("hidden");
        mainBlockEditBtn.classList.remove("hidden");
        mainBlockInputScreen.classList.add("hidden");
    });
    //submitBtn
    mainBlockSubmitBtn.addEventListener("click", submitMainBlock);

    //contacts
    //editBtn
    contactsBlockEditBtn.addEventListener("click", (event) => {
        contactsBlockDefaultScreen.classList.add("hidden");
        contactsBlockEditBtn.classList.add("hidden");
        contactsBlockInputScreen.classList.remove("hidden");
        openContactsBlockForm();
    });
    //cancelBtn
    contactsBlockCancelBtn.addEventListener("click", (event) => {
        contactsBlockDefaultScreen.classList.remove("hidden");
        contactsBlockEditBtn.classList.remove("hidden");
        contactsBlockInputScreen.classList.add("hidden");
    });
    //submitBtn
    contactsBlockSubmitBtn.addEventListener("click", submitContactsBlock);

    //resume
    //editBtn
    resumeBlockEditBtn.addEventListener("click", (event) => {
        resumeBlockDefaultScreen.classList.add("hidden");
        resumeBlockEditBtn.classList.add("hidden");
        resumeBlockInputScreen.classList.remove("hidden");
        openResumeBlockForm();
    });
    //cancelBtn
    resumeBlockCancelBtn.addEventListener("click", (event) => {
        resumeBlockDefaultScreen.classList.remove("hidden");
        resumeBlockEditBtn.classList.remove("hidden");
        resumeBlockInputScreen.classList.add("hidden");
    });
    //submitBtn
    resumeBlockSubmitBtn.addEventListener("click", submitResumeBlock);

    //etcinfo
    //editBtn
    etcinfoBlockEditBtn.addEventListener("click", (event) => {
        etcinfoBlockDefaultScreen.classList.add("hidden");
        etcinfoBlockEditBtn.classList.add("hidden");
        etcinfoBlockInputScreen.classList.remove("hidden");
        openEtcinfoBlockForm();
    });
    //cancelBtn
    etcinfoBlockCancelBtn.addEventListener("click", (event) => {
        etcinfoBlockDefaultScreen.classList.remove("hidden");
        etcinfoBlockEditBtn.classList.remove("hidden");
        etcinfoBlockInputScreen.classList.add("hidden");
    });
    //submitBtn
    etcinfoBlockSubmitBtn.addEventListener("click", submitEtcinfoBlock);

    //================================================================================================
    //== 이벤트 치리 ==================================================================================

    // mainblock 폼 열기
    function openMainBlockForm() {
        const valuePrinters = Array.from(mainBlockDefaultScreen.getElementsByClassName("value-printer"));
        //이름
        document.getElementById("main-user-name").value = valuePrinters[1].innerHTML.trim();
        //국적
        if(valuePrinters[2].innerHTML.trim() === "내국인") {
            document.getElementById("national-korean").checked = true;
        } else if(valuePrinters[2].innerHTML.trim() === "외국인") {
            document.getElementById("national-foreign").checked = true;
        } else {
            document.getElementById("national-korean").checked = false;
            document.getElementById("national-foreign").checked = false;
        }
        //성별
        if(valuePrinters[3].innerHTML.trim() === "남성") {
            document.getElementById("sex-male").checked = true;
        } else if(valuePrinters[3].innerHTML.trim() === "여성") {
            document.getElementById("sex-female").checked = true;
        } else {
            document.getElementById("sex-male").checked = false;
            document.getElementById("sex-female").checked = false;
        }
        //나이
        document.getElementById("main-user-age").value = valuePrinters[4].innerHTML.trim();
        //운전가능여부
        if(valuePrinters[5].innerHTML.trim() === "가능") {
            document.getElementById("isdrive-yes").checked = true;
        } else if(valuePrinters[5].innerHTML.trim() === "불가능") {
            document.getElementById("isdrive-no").checked = true;
        } else {
            document.getElementById("isdrive-yes").checked = false;
            document.getElementById("isdrive-no").checked = false;
        }
        //계좌정보
        document.getElementById("main-expert-account").value = valuePrinters[6].innerHTML.trim();
        //요금(시급)
        document.getElementById("main-expert-cost").value = valuePrinters[7].innerHTML.trim();
    }

    // contacts 폼 열기
    function openContactsBlockForm() {
        const valuePrinters = Array.from(contactsBlockDefaultScreen.getElementsByClassName("value-printer"));
        //휴대폰 번호
        document.getElementById("contacts-user-tel-mobile").value = valuePrinters[0].innerHTML.trim();
        //전화번호(예비)
        document.getElementById("contacts-user-tel-sub").value = valuePrinters[1].innerHTML.trim();
        //이메일
        document.getElementById("contacts-user-email").value = valuePrinters[2].innerHTML.trim();
        //우편번호
        document.getElementById("contacts-user-zipcode").value = valuePrinters[3].innerHTML.trim();
        //주소
        document.getElementById("contacts-user-addr").value = valuePrinters[4].innerHTML.trim();
        //상세주소
        document.getElementById("contacts-user-addr-detail").value = valuePrinters[5].innerHTML.trim();
        //추가정보
        document.getElementById("contacts-user-addr-etc").value = valuePrinters[6].innerHTML.trim();
    }

    //resume 폼 열기
    function openResumeBlockForm() {
        document.getElementById("resume-expert-resume").innerHTML = resumeBlockDefaultScreen.children[0].innerHTML.trim();
    }

    //etcinfo 폼 열기
    function openEtcinfoBlockForm() {
        document.getElementById("etcinfo-expert-location").innerHTML = etcinfoBlockDefaultScreen.getElementsByClassName("text-printer")[0].innerHTML.trim();
        document.getElementById("etcinfo-expert-available-time").innerHTML = etcinfoBlockDefaultScreen.getElementsByClassName("text-printer")[1].innerHTML.trim();
    }

    //================================================================================================
    //== 폼 submit ===================================================================================

    // main
    function submitMainBlock() {
        //유효성 여기에
        if(document.getElementById("main-user-existing-pw").value.length > 0) {
            if(
                !valiPassword(document.getElementById("main-user-existing-pw").value) ||
                !valiPassword(document.getElementById("main-user-modified-pw").value) ||
                !valiPassword(document.getElementById("main-user-pw-check").value)
            ) {
                alert("비밀번호는 8-64문자, 숫자/특수문자를 포함해야 합니다");
                return;
            } else if(document.getElementById("main-user-modified-pw").value !== document.getElementById("main-user-pw-check").value) {
                alert("새 비밀번호와 새 비밀번호 확인은 동일해야 합니다");
                return;
            }
        }
        if(!valiName(document.getElementById("main-user-name").value)) {
            alert("이름은 한글로만 이루어져야 합니다");
            return;
        }
        if(!valiAge(document.getElementById("main-user-age").value)) {
            alert("나이는 숫자로만 이루어져야 하며 만 14세 미만은 기입할 수 없습니다");
            return;
        }
        if(!document.getElementById("isdrive-yes").checked && !document.getElementById("isdrive-no").checked) {
            alert("운전 가능 여부를 체크해주세요");
            return;
        }
        //계좌정보는 양심에 맞긴다
        if(!valiNumberic(document.getElementById("main-expert-cost").value)) {
            alert("요금(시급)란에는 숫자만 적어주세요");
            return;
        }

        //radio 꾸리기
        let radioRes = "";
        if(document.getElementById("sex-male").checked) {
            radioRes += "M";
        } else if(document.getElementById("sex-female").checked) {
            radioRes += "W";
        } else {
            alert("성별 항목을 체크해주세요");
            return;
        }
        if(document.getElementById('national-korean').checked) {
            radioRes += "-K";
        } else if(document.getElementById("national-foreign").checked) {
            radioRes += "-F";
        } else {
            alert("국적 항목을 체크해주세요");
            return;
        }
        document.getElementById("main-real-user-sex").value = radioRes;
        //전송
        document.getElementById("main-form").submit();
    }

    //contacts
    function submitContactsBlock() {
        //유효성
        if(!valiTel_Mobile(document.getElementById("contacts-user-tel-mobile").value)) {
            alert("휴대전화 번호 양식을 따라주세요 (010-xxxx-xxxx)");
            return;
        }
        if(!valiTel_Sub(document.getElementById("contacts-user-tel-sub").value)) {
            alert("휴대전화/유선전화 번호 양식을 따라주세요");
            return;
        }
        if(!valiEmail(document.getElementById("contacts-user-email").value)) {
            alert("이메일 입력 양식을 따라주세요");
            return;
        }
        if(!valiZipcode(document.getElementById("contacts-user-zipcode").value)) {
            alert("우편번호 양식을 따라주세요");
            return;
        }
        //주소류는 유효성 안한다

        //전송
        document.getElementById("contacts-form").submit();
    }

    //resume
    function submitResumeBlock() {
        //유효성
        //임마는 글쎄...
        //전송
        document.getElementById("resume-form").submit();
    }

    //etcinfo
    function submitEtcinfoBlock() {
        //유효성
        //안함

        //전송
        document.getElementById("etcinfo-form").submit();
    }

    //================================================================================================
    //== 유효성 ======================================================================================
    /*
        userinfo.jsp쪽에서 최대한 재활용할 수 ㅣㅇㅆ는건 다 가져올것임
    */
    
    function valiName(target) {
        if(/^[가-힣]+$/g.test(target)) {
            return true;
        }
        return false;
    }

    function valiAge(target) {
        if(/^\d+$/g.test(target)) {
            if(Number(target) >= 14) {
                return true;
            }
        }
        return false;
    }

    function valiNumberic(target) {
        if(/^\d+$/g.test(target)) {
            return true;
        }
        return false;
    }

    function valiTel_Mobile(target) {
        if(/^010-(\d{3,4})-(\d{4})$/g.test(target)) {
            return true;
        }
        return false;
    }

    // 집전화 + 휴대전화 양식
    function valiTel_Sub(target) {
        if(/^0((10-(\d{4})-(\d{4}))|(2|3[1-3]|4[1-4]|5[1-5]|6[1-4])-(\d{3,4})-(\d{4}))$/g.test(target)) {
            return true;
        }
        return false;
    }

    function valiEmail(target) {
        if(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/g.test(target)) {
            return true;
        }
        return false;
    }

    function valiZipcode(target) {
        if(/^(0[1-9]|[1-5][0-9]|6[0-3])(\d{3})$/g.test(target)) {
            return true;
        }
        return false;
    }

    function valiPassword(target) {
        if(/^(?=.*[!@#$%^&*\-=_+])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*\-=_+]{8,64}$/g.test(target)) {
            return true;
        }
        return false;
    }
    
    function valiDate(target) {
        if(/^(19\d{2}|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/g.test(target)) {
            const splitDate = target.split("-");
            if(Number(splitDate[2]) <= new Date(splitDate[0], splitDate[1], 0).getDate()) {
                return true;
            }
        }
        return false;
    }

    //================================================================================================
    //================================================================================================
    //== 키워드/파일 관련 =============================================================================
    //================================================================================================
    //================================================================================================

    //================================================================================================
    // 파일

    document.querySelector("input[type=file]").addEventListener("change", fileChanged);
    document.querySelector("a#filesubmit").addEventListener("click", fileSubmit);

    // 페이지에 파일 업로드
    function fileChanged(event) {
        const fileform = document.querySelector("form[name=fileform]");
        const fileinput = document.querySelector("input[type=file]");
        const file = document.querySelector("input[type=file]").files[0];
        const reader = new FileReader();
        const preview = document.querySelector("div#image-placeholder");

        console.log("fileChanged!");

        if(file == undefined) {
            //파일창 취소 등
            preview.classList.add("hidden");
        } else {
            //파일이 올라온 경우
            reader.onload = (e) => {
                preview.style.backgroundImage = "url(" + reader.result; + ")";
            };
            const ext = file.name.split(".").pop();
            
            //파일이 사진 형식인지 확인
            if(ext === "jpeg" || ext === "png" || ext === "jpg" || ext === "webp" || ext === "gif") {
                //미리보기 넣기
                reader.readAsDataURL(file);
                preview.classList.remove("hidden");
            } else {
                alert("유효하지 않은 파일 형식입니다\n이미지 파일만 올려 주세요");
                fileinput.value = "";
                preview.classList.add("hidden");
            }
        }
    }

    // 서버에 submit
    function fileSubmit(event) {
        const fileform = document.querySelector("form[name=fileform]");
        const fileinput = document.querySelector("input[type=file]");

        if(fileinput.files[0] == undefined) {
            alert("우선 업로드 할 파일을 선택해주세요");
        } else {
            const file = fileinput.files[0];
            const ext = file.name.split(".").pop();
            if(ext === "jpeg" || ext === "png" || ext === "jpg" || ext === "webp" || ext === "gif") {
                //업로드 가능
                fileform.submit();
            } else {
                alert("사진 형식의 파일만 올려주세요");
            }
        }
    }

    //================================================================================================
    // 키워드

    for(let btnParent of Array.from(document.querySelector("form#keywordform>ul").children)) {
        btnParent.firstElementChild.addEventListener("click", keywordClick);
    }

    //클릭 받기
    function keywordClick(event) {
        const input = document.querySelector("input#keywordsinput");
        const btnParents = Array.from(document.querySelector("form#keywordform>ul").children);

        let selectCount = 0;
        for(let btn of btnParents) {
            if(btn.firstElementChild.classList.contains("primary")) {
                selectCount++;
            }
        }

        if(event.target.classList.contains("primary")) {
            if(selectCount < 2) {
                alert("키워드는 최소 한 개가 선택되어야 합니다");
                return;
            }
            event.target.classList.remove("primary");
        } else {
            event.target.classList.add("primary");
        }

        let resVal = "";

        for(let i = 0; i < 5; i++) {
            if(btnParents[i].firstElementChild.classList.contains("primary")) {
                if(resVal.length > 0) {
                    resVal += ",";
                }
                resVal += btnParents[i].firstElementChild.innerHTML.trim();
            }
        }

        input.value = resVal;
    }

    //키워드 submit
    document.getElementById("keywordsubmit").addEventListener("click", (e) => {
        document.getElementById("keywordform").submit();
    });

    //================================================================================================
    //================================================================================================
    //== 경력/자격증 관련 =============================================================================
    //================================================================================================
    //================================================================================================
    /*
        대충 생각한 로직
        페이지 구성 (JSTL + EL)
            >미리 만들어둔 함수들을 각 tr>td들에게 적절히 부여
        페이지 로딩 완료 (JS)
            >수정사항 업데이트시 기존의 값 - 특히 *_name 친구들의 기존값을 알아야
             행을 찾아 crud를 할 수 있음
            >행이 수정/삭제/추가 될 때마다 기록
        
    */
    //================================================================================================
    //== 전역변수 && 생성자 ===========================================================================

    const careerChangesRecorder = {
        recordname: "career",
        isCreateEmpty: true,
        isUpdateEmpty: true,
        isDeleteEmpty: true,
        createRecord: [],
        updateRecord: [],
        deleteRecord: []
    };
    const licenseChangesRecorder = {
        recordname: "license",
        isCreateEmpty: true,
        isUpdateEmpty: true,
        isDeleteEmpty: true,
        createRecord: [],
        updateRecord: [],
        deleteRecord: []
    };

    function changeRecord(existName, modifiedName, startTime, endTime) {
        this.existName = existName;
        this.modifiedName = modifiedName;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    //================================================================================================
    //== 이벤트 함수 ==================================================================================

    //수정 버튼
    /*
        td.innerHTML을 td>input으로 옮겨 준다
        또한 수정 폼을 공개한다
    */
    // 경력
    function careerAdjustmentBtn(event) {
        const valRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("valrow"));
        const inpRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("inprow"));

        for(let i = 0; i < 5; i++) {
            if(i < 3) {
                inpRows[i].firstElementChild.value = valRows[i].innerHTML.trim();
            }
            valRows[i].classList.add("hidden");
            inpRows[i].classList.remove("hidden");
        }
    }
    // 자격증
    function licenseAdjustmentBtn(event) {
        const valRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("valrow"));
        const inpRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("inprow"));

        for(let i = 0; i < 4; i++) {
            if(i < 2) {
                inpRows[i].firstElementChild.value = valRows[i].innerHTML.trim();
            }
            valRows[i].classList.add("hidden");
            inpRows[i].classList.remove("hidden");
        }
    }
    
    //삭제 버튼
    /*
        해당 요소를 삭제한다
    */
    // 경력
    function careerRemoveBtn(event) {
        const mother = event.target.parentElement.parentElement;
        const oldName = mother.firstElementChild.innerHTML.trim();

        //기록을 기반으로 기존에(DB에) 존재하던 요소인지 확인
        // 대충 createRecord[n].existName, modifiedName이 동일한 요소가 있는지 확인
        // 거서 존재하면 그냥 기록, 요소만 지우고 삭제기록에 등록하지 않는다

        let isExistedElement = true;

        for(let i = 0; i < careerChangesRecorder.createRecord.length; i++) {
            if(careerChangesRecorder.createRecord[i].existName === oldName || careerChangesRecorder.createRecord[i].modifiedName === oldName) {
                isExistedElement = false;
                careerChangesRecorder.createRecord.splice(i);
                if(careerChangesRecorder.createRecord.length < 1) {
                    careerChangesRecorder.isCreateEmpty = true;
                }
                for(let j = 0; j < careerChangesRecorder.updateRecord.length; j++) {
                    if(careerChangesRecorder.updateRecord[j].existName === oldName) {
                        careerChangesRecorder.updateRecord.splice(j);
                        if(careerChangesRecorder.updateRecord.length < 1) {
                            careerChangesRecorder.isUpdateEmpty = true;
                        }
                    }
                }
            }
        }
        // 존재하던 요소이면 삭제기록 등록
        if(isExistedElement) {
            if(careerChangesRecorder.isDeleteEmpty) {
                careerChangesRecorder.isDeleteEmpty = false;
            }
            // 업데이트 기록에서는 존재한다면 지운다
            for(let j = 0; j < careerChangesRecorder.updateRecord.length; j++) {
                if(careerChangesRecorder.updateRecord[j].existName === oldName) {
                    careerChangesRecorder.updateRecord.splice(j);
                } else if(careerChangesRecorder.updateRecord[j].modifiedName === oldName) {
                    careerChangesRecorder.updateRecord.splice(j);
                }
            }
            if(careerChangesRecorder.updateRecord.length < 1) {
                careerChangesRecorder.isUpdateEmpty = true;
            }
            //삭제기록 등록
            careerChangesRecorder.deleteRecord.push(new changeRecord(
                oldName,
                "null",
                "null",
                "null"
            ));
            //요소 삭제
            mother.remove();
        }
    }

    // 자격증
    function licenseRemoveBtn(event) {
        const mother = event.target.parentElement.parentElement;
        const oldName = mother.firstElementChild.innerHTML.trim();

        //기록을 기반으로 기존에(DB에) 존재하던 요소인지 확인
        // 대충 createRecord[n].existName, modifiedName이 동일한 요소가 있는지 확인
        // 거서 존재하면 그냥 기록, 요소만 지우고 삭제기록에 등록하지 않는다

        let isExistedElement = true;

        for(let i = 0; i < licenseChangesRecorder.createRecord.length; i++) {
            if(licenseChangesRecorder.createRecord[i].existName === oldName || licenseChangesRecorder.createRecord[i].modifiedName === oldName) {
                isExistedElement = false;
                licenseChangesRecorder.createRecord.splice(i);
                if(licenseChangesRecorder.createRecord.length < 1) {
                    licenseChangesRecorder.isCreateEmpty = true;
                }
                for(let j = 0; j < licenseChangesRecorder.updateRecord.length; j++) {
                    if(licenseChangesRecorder.updateRecord[j].existName === oldName) {
                        licenseChangesRecorder.updateRecord.splice(j);
                        if(licenseChangesRecorder.updateRecord.length < 1) {
                            licenseChangesRecorder.isUpdateEmpty = true;
                        }
                    }
                }
            }
        }
        // 존재하던 요소이면 삭제기록 등록
        if(isExistedElement) {
            if(licenseChangesRecorder.isDeleteEmpty) {
                licenseChangesRecorder.isDeleteEmpty = false;
            }
            // 업데이트 기록에서는 존재한다면 지운다
            for(let j = 0; j < licenseChangesRecorder.updateRecord.length; j++) {
                if(licenseChangesRecorder.updateRecord[j].existName === oldName) {
                    licenseChangesRecorder.updateRecord.splice(j);
                } else if(licenseChangesRecorder.updateRecord[j].modifiedName === oldName) {
                    licenseChangesRecorder.updateRecord.splice(j);
                }
            }
            if(licenseChangesRecorder.updateRecord.length < 1) {
                licenseChangesRecorder.isUpdateEmpty = true;
            }
            //삭제기록 등록
            licenseChangesRecorder.deleteRecord.push(new changeRecord(
                oldName,
                "null",
                "null",
                "null"
            ));
            //요소 삭제
            mother.remove();
        }
    }

    //적용 버튼(각 요소당)
    /*
        수정 사항을 적용시키준다
        또한 수정 내역을 기록한다
    */
    // 경력
    function careerApplyBtn(event) {
        const mother = event.target.parentElement.parentElement;
        const oldName = mother.firstElementChild.innerHTML.trim();
        const newName = mother.getElementsByClassName("inprow")[0].firstElementChild.value.trim();
        const start = mother.getElementsByClassName("inprow")[1].firstElementChild.value.trim();
        const end = mother.getElementsByClassName("inprow")[2].firstElementChild.value.trim();

        let isElementAlreadyChanged = false;

        //제일 우선으로 유효성 체크를 해줘야 함
        //경력명은 유효성 안함
        if(!valiDate(start) || !valiDate(end)) {
            alert("2000-01-01 의 형식으로 입력해주세요");
            return;
        }

        //우선 기록함
        if(careerChangesRecorder.isUpdateEmpty) {
            //첫 기록인 경우
            careerChangesRecorder.isUpdateEmpty = false;
            if(oldName === newName)
                careerChangesRecorder.updateRecord.push(new changeRecord(newName, "null", start, end));
            else
                careerChangesRecorder.updateRecord.push(new changeRecord(oldName, newName, start, end));
        } else {
            //먼저 이름이 수정되었는지 확인
            // 이름이 수정되지 않은 경우
            if(oldName === newName) {
                //해당 요소가 먼저 수정된 적이 있는지 확인
                for(let i = 0; i < careerChangesRecorder.updateRecord.length; i++) {
                    //이름도 수정된 경우
                    if(careerChangesRecorder.updateRecord[i].modifiedName === newName) {
                        isElementAlreadyChanged = true;
                        careerChangesRecorder.updateRecord[i].modifiedName = newName;
                        careerChangesRecorder.updateRecord[i].startTime = start;
                        careerChangesRecorder.updateRecord[i].endTime = end;
                        break;
                    }
                    //이름은 수정되지 않은 경우
                    if(careerChangesRecorder.updateRecord[i].existName === newName) {
                        isElementAlreadyChanged = true;
                        careerChangesRecorder.updateRecord[i].startTime = start;
                        careerChangesRecorder.updateRecord[i].endTime = end;
                        break;
                    }
                }
                if(!isElementAlreadyChanged) {
                    //수정된 적이 없는 요소인 경우
                    careerChangesRecorder.updateRecord.push(new changeRecord(newName, "null", start, end));
                }
            } 
            // 이름이 수정된 경우
            else {
                //해당 요소가 먼저 수정된 적이 있는지 확인
                for(let i = 0; i < careerChangesRecorder.updateRecord.length; i++) {
                    //이름이 수정된 경우
                    if(careerChangesRecorder.updateRecord[i].modifiedName === oldName) {
                        isElementAlreadyChanged = true;
                        careerChangesRecorder.updateRecord[i].modifiedName = newName;
                        careerChangesRecorder.updateRecord[i].startTime = start;
                        careerChangesRecorder.updateRecord[i].endTime = end;
                        break;
                    }
                    //이름은 수정되지 않은 경우
                    if(careerChangesRecorder.updateRecord[i].existName === oldName) {
                        isElementAlreadyChanged = true;
                        careerChangesRecorder.updateRecord[i].modifiedName = newName;
                        careerChangesRecorder.updateRecord[i].startTime = start;
                        careerChangesRecorder.updateRecord[i].endTime = end;
                    }
                }
                if(!isElementAlreadyChanged) {
                    //수정된 적이 없는 요소인 경우
                    careerChangesRecorder.updateRecord.push(new changeRecord(oldName, newName, start, end));
                }
            }
        }
        //값을 옮긴다
        mother.children[0].innerHTML = mother.getElementsByClassName("inprow")[0].firstElementChild.value.trim();
        mother.children[1].innerHTML = mother.getElementsByClassName("inprow")[1].firstElementChild.value.trim();
        mother.children[2].innerHTML = mother.getElementsByClassName("inprow")[2].firstElementChild.value.trim();
        //수정 폼을 숨긴다
        const valRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("valrow"));
        const inpRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("inprow"));
        for(let i = 0; i < 5; i++) {
            if(i < 3) {
                inpRows[i].firstElementChild.value = "";
            }
            valRows[i].classList.remove("hidden");
            inpRows[i].classList.add("hidden");
        }
    }

    // 자격증
    function licenseApplyBtn(event) {
        const mother = event.target.parentElement.parentElement;
        const oldName = mother.firstElementChild.innerHTML.trim();
        const newName = mother.getElementsByClassName("inprow")[0].firstElementChild.value.trim();
        const date = mother.getElementsByClassName("inprow")[1].firstElementChild.value.trim();

        let isElementAlreadyChanged = false;

        //유효성 검사
        if(!valiDate(date)) {
            alert("2000-01-01 의 형식으로 입력해주세요");
            return;
        }

        //우선 기록함
        if(licenseChangesRecorder.isUpdateEmpty) {
            //첫 기록인 경우
            licenseChangesRecorder.isUpdateEmpty = false;
            if(oldName === newName)
                licenseChangesRecorder.updateRecord.push(new changeRecord(newName, "null", date, "null"));
            else
                licenseChangesRecorder.updateRecord.push(new changeRecord(oldName, newName, date, "null"));
        } else {
            //먼저 이름이 수정되었는지 확인
            // 이름이 수정되지 않은 경우
            if(oldName === newName) {
                //해당 요소가 먼저 수정된 적이 있는지 확인
                for(let i = 0; i < licenseChangesRecorder.updateRecord.length; i++) {
                    //이름도 수정된 경우
                    if(licenseChangesRecorder.updateRecord[i].modifiedName === newName) {
                        isElementAlreadyChanged = true;
                        licenseChangesRecorder.updateRecord[i].modifiedName = newName;
                        licenseChangesRecorder.updateRecord[i].startTime = date;
                        break;
                    }
                    //이름은 수정되지 않은 경우
                    if(licenseChangesRecorder.updateRecord[i].existName === newName) {
                        isElementAlreadyChanged = true;
                        licenseChangesRecorder.updateRecord[i].startTime = date;
                        break;
                    }
                }
                if(!isElementAlreadyChanged) {
                    //수정된 적이 없는 요소인 경우
                    licenseChangesRecorder.updateRecord.push(new changeRecord(newName, "null", date, "null"));
                }
            } 
            // 이름이 수정된 경우
            else {
                //해당 요소가 먼저 수정된 적이 있는지 확인
                for(let i = 0; i < licenseChangesRecorder.updateRecord.length; i++) {
                    //이름이 수정된 경우
                    if(licenseChangesRecorder.updateRecord[i].modifiedName === oldName) {
                        isElementAlreadyChanged = true;
                        licenseChangesRecorder.updateRecord[i].modifiedName = newName;
                        licenseChangesRecorder.updateRecord[i].startTime = date;
                        break;
                    }
                    //이름은 수정되지 않은 경우
                    if(licenseChangesRecorder.updateRecord[i].existName === oldName) {
                        isElementAlreadyChanged = true;
                        licenseChangesRecorder.updateRecord[i].modifiedName = newName;
                        licenseChangesRecorder.updateRecord[i].startTime = date;
                    }
                }
                if(!isElementAlreadyChanged) {
                    //수정된 적이 없는 요소인 경우
                    licenseChangesRecorder.updateRecord.push(new changeRecord(oldName, newName, date, "null"));
                }
            }
        }
        //값을 옮긴다
        mother.children[0].innerHTML = mother.getElementsByClassName("inprow")[0].firstElementChild.value.trim();
        mother.children[1].innerHTML = mother.getElementsByClassName("inprow")[1].firstElementChild.value.trim();
        //수정 폼을 숨긴다
        const valRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("valrow"));
        const inpRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("inprow"));
        for(let i = 0; i < 4; i++) {
            if(i < 2) {
                inpRows[i].firstElementChild.value = "";
            }
            valRows[i].classList.remove("hidden");
            inpRows[i].classList.add("hidden");
        }
    }

    //취소 버튼(각 요소당)
    /*
        수정 폼을 숨긴다
    */
    // 경력
    function careerCancelBtn(event) {
        //수정 폼을 숨긴다
        const valRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("valrow"));
        const inpRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("inprow"));
        for(let i = 0; i < 5; i++) {
            if(i < 3) {
                inpRows[i].firstElementChild.value = "";
            }
            valRows[i].classList.remove("hidden");
            inpRows[i].classList.add("hidden");
        }
    }

    // 자격증
    function licenseCancelBtn(event) {
        //수정 폼을 숨긴다
        const valRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("valrow"));
        const inpRows = Array.from(event.target.parentElement.parentElement.getElementsByClassName("inprow"));
        for(let i = 0; i < 4; i++) {
            if(i < 2) {
                inpRows[i].firstElementChild.value = "";
            }
            valRows[i].classList.remove("hidden");
            inpRows[i].classList.add("hidden");
        }
    }

    //추가 버튼
    /*
        하단의 입력폼의 값을 받은 요소를 새로 생성,
        테이블에 삽입한다
    */
    // 경력
    function careerCreateBtn(event) {
        const mother = event.target.parentElement.parentElement;
        const name = mother.children[0].firstElementChild.value.trim();
        const start = mother.children[1].firstElementChild.value.trim();
        const end = mother.children[2].firstElementChild.value.trim();

        //유효성

        //기록
        if(careerChangesRecorder.isCreateEmpty) {
            careerChangesRecorder.isCreateEmpty = false;
        }
        careerChangesRecorder.createRecord.push(new changeRecord(name, "null", start, end));

        //요소 생성
        const trElement = document.createElement("tr");
        for(let i = 0; i < 10; i++) {
            const tdElement = document.createElement("td");
            if(i < 5) {
                tdElement.classList.add("valrow");
                switch(i) {
                    case 0:
                        tdElement.innerHTML = name;
                        break;
                    case 1:
                        tdElement.innerHTML = start;
                        break;
                    case 2:
                        tdElement.innerHTML = end;
                        break;
                    case 3:
                        const aBtnElement1 = document.createElement("a");
                        aBtnElement1.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement1.innerHTML = "수정";
                        aBtnElement1.onclick = careerAdjustmentBtn;
                        tdElement.appendChild(aBtnElement1);
                        break;
                    case 4:
                        const aBtnElement2 = document.createElement("a");
                        aBtnElement2.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement2.innerHTML = "삭제";
                        aBtnElement2.onclick = careerRemoveBtn;
                        tdElement.appendChild(aBtnElement2);
                        break;
                }
            } else {
                tdElement.classList.add("inprow", "hidden");
                switch(i) {
                    case 5:
                    case 6:
                    case 7:
                        const inpElement = document.createElement("input");
                        inpElement.type = "text";
                        tdElement.appendChild(inpElement);
                        break;
                    case 8:
                        const aBtnElement1 = document.createElement("a");
                        aBtnElement1.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement1.innerHTML = "취소";
                        aBtnElement1.onclick = careerCancelBtn;
                        tdElement.appendChild(aBtnElement1);
                        break;
                    case 9:
                        const aBtnElement2 = document.createElement("a");
                        aBtnElement2.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement2.innerHTML = "적용";
                        aBtnElement2.onclick = careerApplyBtn;
                        tdElement.appendChild(aBtnElement2);
                        break;
                }
            }
            trElement.appendChild(tdElement);
        }
        //생성된 요소 적용
        document.getElementById("career-dynamic").appendChild(trElement);
    }

    // 자격증
    function licenseCreateBtn(event) {
        const mother = event.target.parentElement.parentElement;
        const name = mother.children[0].firstElementChild.value.trim();
        const date = mother.children[1].firstElementChild.value.trim();

        //유효성

        //기록
        if(licenseChangesRecorder.isCreateEmpty) {
            licenseChangesRecorder.isCreateEmpty = false;
        }
        licenseChangesRecorder.createRecord.push(new changeRecord(name, "null", date, "null"));

        //요소 생성
        const trElement = document.createElement("tr");
        for(let i = 0; i < 8; i++) {
            const tdElement = document.createElement("td");
            if(i < 4) {
                tdElement.classList.add("valrow");
                switch(i) {
                    case 0:
                        tdElement.innerHTML = name;
                        break;
                    case 1:
                        tdElement.innerHTML = date;
                        break;
                    case 2:
                        const aBtnElement1 = document.createElement("a");
                        aBtnElement1.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement1.innerHTML = "수정";
                        aBtnElement1.onclick = licenseAdjustmentBtn;
                        tdElement.appendChild(aBtnElement1);
                        break;
                    case 3:
                        const aBtnElement2 = document.createElement("a");
                        aBtnElement2.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement2.innerHTML = "삭제";
                        aBtnElement2.onclick = licenseRemoveBtn;
                        tdElement.appendChild(aBtnElement2);
                        break;
                }
            } else {
                tdElement.classList.add("inprow", "hidden");
                switch(i) {
                    case 4:
                    case 5:
                        const inpElement = document.createElement("input");
                        inpElement.type = "text";
                        tdElement.appendChild(inpElement);
                        break;
                    case 6:
                        const aBtnElement1 = document.createElement("a");
                        aBtnElement1.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement1.innerHTML = "취소";
                        aBtnElement1.onclick = licenseCancelBtn;
                        tdElement.appendChild(aBtnElement1);
                        break;
                    case 7:
                        const aBtnElement2 = document.createElement("a");
                        aBtnElement2.classList.add("button", "small", "smaller", "smallest");
                        aBtnElement2.innerHTML = "적용";
                        aBtnElement2.onclick = licenseApplyBtn;
                        tdElement.appendChild(aBtnElement2);
                        break;
                }
            }
            trElement.appendChild(tdElement);
        }
        //생성된 요소 적용
        document.getElementById("license-dynamic").appendChild(trElement);
    }

    //적용(submit) 버튼
    /*
        수정 사항을 전송한다
    */
    // 경력
    function careerSubmitBtn(event) {
        ajaxCont(JSON.stringify(careerChangesRecorder));
    }
    
    // 자격증
    function licenseSubmitBtn(event) {
        ajaxCont(JSON.stringify(licenseChangesRecorder));
    }
    
    //================================================================================================
    //== AJAX ========================================================================================
    
    function ajaxCont(json) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            switch(xhr.readyState) {
                case XMLHttpRequest.DONE:
                    if(xhr.status === 200) {
                        if(xhr.responseText != null) {
                            let resArr = xhr.responseText.split(",");
                            if(resArr.shift().split(":")[1] === "false") {
                                //실패한 경우
                                switch(respVal[1].split(":")[1]) {
                                    case "empty":
                                    case "emptyorblank":
                                    case "valifail":
                                        alert("잘못된 입력값입니다");
                                        break;
                                    case "dbfail":
                                        alert("서버 오류로 등록을 실패했습니다");
                                        break;
                                }
                            } 
                            //성공한 경우
                            else {
                                alert("정보 등록을 성공했습니다");
                                window.location.href="${pageContext.request.contextPath}/expertinfo.ep";
                            }
                        } else {
                            alert("연결에 문제가 있습니다");
                        }
                    } else {
                        //404
                        alert("서버 접속에 실패하였습니다");
                    }
                    break;
            }
        }

        xhr.open("POST", "${pageContext.request.contextPath}/expertinfo/update/aj.ep", true);
        xhr.setRequestHeader("Context-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send(json);
    }

</script>
</html>