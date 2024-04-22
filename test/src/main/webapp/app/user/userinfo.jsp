<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>everycare</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
    <style>
        html {
            font-size: 16px;
        }

        .inner-content-div {
            margin: 0 0 4rem 0;
            text-align: center;
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
    </style>
</head>
<body>
    <div id="wrapper">
        <!-- 헤더 위치 -->
        <section class="main alt">
            <header class="accent1">
                <h1>개인정보 관리</h1>
                <p>
                    ${userdto.name}님 환영합니다
                </p>
            </header>
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
                                                <!-- 폼 open 시 hidden -->
                                                <td id="id-display" class="default-display">${userdto.user_id}</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="id-inputbox" class="default-info-input this-is-hidden">
                                                    <input type="text" name="userid" id="id-input">
                                                </td>
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
                                                <td>성별</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="sex-display" class="default-display">
                                                	<c:choose>
                                                		<c:when test="${userdto.gender eq 'M'}">남성</c:when>
                                                		<c:when test="${userdto.gender eq 'W'}">여성</c:when>
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
                                                <td>생년월일</td>
                                                <!-- 폼 open 시 hidden -->
                                                <td id="birth-display" class="default-display">${userdto.birth}</td>
                                                <!-- 폼 close 시 hidden -->
                                                <td id="birth-inputbox" class="default-info-input this-is-hidden">
                                                    <input type="text" name="userbirth" id="birth-input" placeholder="ex) 2000-01-01 형태로 입력">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <!-- 폼 open 시 hidden -->
                                <div class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formopener-btn-default" class="button primary fit small" style="cursor: pointer;">기본 정보 수정하기</a>
                                </div>
                                <!-- 폼 close 시 hidden -->
                                <ul class="actions fit small this-is-hidden">
                                    <li>
                                        <a id="formsubmit-btn-default" class="button primary fit small" style="cursor: pointer;">수정 적용하기</a>
                                    </li>
                                    <li>
                                        <a id="formcancel-btn-default" class="button primary fit small" style="cursor: pointer;">수정 취소하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- 기본 정보 끝 -->
                            <!-- 전문가 가입 홍보 -->
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
                                    <a href="#" class="button primary fit" style="cursor: pointer;">에브리케어 전문가 가입하기</a>
                                </div>
                            </div>
                            <!-- 전문가 가입 끝 -->
                        </div>
                        <!-- content 좌측 끝 -->

                        <!-- content 우측 -->
                        <div class="col-6 col-12-medium">
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
                                <div class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formopener-btn-contacts" class="button primary fit small" style="cursor: pointer;">연락처 수정하기</a>
                                </div>
                                <!-- 폼 close 시 hidden -->
                                <ul class="actions fit small this-is-hidden">
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
                                                    <!-- 씨발 우편번호API 필요함!!!!!!!!!!!!!!!!! -->
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
                                <div class="inner-content-div-fitbtn-limiter-m8r bottom-margin-inserter">
                                    <a id="formopener-btn-addr" class="button primary fit small" style="cursor: pointer;">주소 수정하기</a>
                                </div>
                                <ul class="actions fit small this-is-hidden">
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
    </div>
</body>
<!-- 카카오 주소찾기 API -->
<!-- 
    관련 코드는 이벤트 등록, script 맨 밑쪽에 있음
 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

    // open/cancel 버튼
    for(let i = 0; i < 3; i++) {
        document.getElementById(FORM_OPENED_BTN_ID[i]).addEventListener("click", uniFormOpenCancel_btnClickEvent);
        document.getElementById(FORM_CANCEL_BTN_ID[i]).addEventListener("click", uniFormOpenCancel_btnClickEvent);
        document.getElementById(FORM_SUBMIT_BTN_ID[i]).addEventListener("click", uniFormSubmit_btnClickEvent);
    }

    // 카카오 주소찾기 API 버튼
    document.getElementById("kakao-postbtn").addEventListener("click", kakaoPostcode);

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
    */
    // 기본정보 - default 폼 오프너 함수
    function defaultFormValueTransporter() {
        // 기존 값 불러오기(td)
        const valTdArr = document.getElementById("default-block").getElementsByClassName("default-display");

        // input<td 가져오기 - input을 가져오는게 아님!
        const inputTdArr = document.getElementById("default-block").getElementsByClassName("default-info-input");

        // input들 공개하기 전에 우선 값부터 옮기자
        // 반복 횟수는 그냥 하드코딩으로 박음 어짜피 여기서 뭘 추가하려하면 어떻게 해왔던간에 코드 전부 뜯어고쳐야함
        for(let i = 0; i < 4; i++) {
            if(i < 2) {
                // ID, 이름은 그냥 옮긴다
                inputTdArr[i].children[0].value = valTdArr[i].innerHTML;
            } else if(i == 2) {
                // 성별은 값을 체크해 적절한 input에 checked를 부여함
                // 성별값 검증은 안함 - 검증은 백이 해야지
                // 일단 "남성", "여성" 외의 값이 오면 체크를 풀게 해둠
                const genderChecker = valTdArr[i].innerHTML.trim();
                console.log(valTdArr[i].innerHTML);
                console.log("genderChecker : " + genderChecker);
                if(genderChecker == "남성") {
                    document.update_default_info.usersex[0].checked = true;
                } else if(genderChecker == "여성") {
                    document.update_default_info.usersex[1].checked = true;
                } else {
                    document.update_default_info.usersex[0].checked = false;
                    document.update_default_info.usersex[1].checked = false;
                }
            } else {
                // 생년월일은 좀 복잡함
                // 일단 대시("-")로 잘라 배열에 저장함
                const birthArr = valTdArr[i].innerHTML.split("-");
                // 먼저 각 배열 요소의 길이 검증
                if(birthArr.length == 3 && birthArr[0].length == 4 && birthArr[1].length == 2 && birthArr[2].length == 2) {
                    // 값 검증은 안함 ㅅㅂ
                    document.update_default_info.userbirth.value = valTdArr[i].innerHTML;
                }
            }
        }
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
            //전화번호는 -를 없앤다
            if(i < 2) {
                const tel = valTd[i].innerHTML.split("-");
                inputTd[i].children[0].value = "";
                for(let telEle of tel) {
                    inputTd[i].children[0].value += telEle;
                }
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
    //폼 submit 함수
    /*
        Ajax
    */

    //이벤트리스너 - 어느 폼이 submit을 했는지 확인해야 함
    function uniFormSubmit_btnClickEvent(event) {
        const formArr = document.getElementsByTagName("form");
        for(let i = 0; i < formArr.length; i++) {
            if(event.target.id === FORM_SUBMIT_BTN_ID[i]) {
                sendJsonByAjax(jsonPacker(formArr[i]));
                break;
            }
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
                //default폼 - 성별 input인 경우
                if(inpArr[i].name === "usersex") {
                    // 대충 남성인 경우 value=male, 여성은 value=female, 그외의 경우는 등록하지 않음
                    if(inpArr[i].checked)
                        obj.inputs.push(new innerJsonPacker(inpArr[i]));
                    else if(inpArr[i+1].checked)
                        obj.inputs.push(new innerJsonPacker(inpArr[i+1]));
                    //한칸 뛰어넘기
                    i++;
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
        this.type = inputElement.type;
        this.name = inputElement.name;
        this.value = inputElement.value;
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
                        console.log("receiving success");
                        console.log("result JSON : \n" + xhr.responseText);
                    }
                    // 백에서 온 응답 체크해서
                    //      등록 성공/DB 기입 실패/서버 오류/입력값 잘못됨 정도로 분기처리
                    break;
            }
        }

        // 성공/실패 여부 판별및 처리 이전까지는 submit 입력을 막아야 함!
        xhr.open("POST", "/teamproject/user/userinfo-update", true);
       	// xhr.open("POST", "/teamproject/test/ajax", true);
        xhr.setRequestHeader("Context-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        xhr.send(json);
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