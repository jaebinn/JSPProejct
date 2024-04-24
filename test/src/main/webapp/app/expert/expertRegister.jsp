<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>everycare</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="icon" href="${cp}/images/everycare.ico" />
<script src="https://kit.fontawesome.com/1924b51539.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<style>
<style>
* {
   box-sizing: border-box;
   vertical-align: baseline;
   font-family: 'Pretendard-Regular' !important;
}

.main {
   margin-top: 10%;
   padding: 0 20%;
   font-family: 'Pretendard-Regular' !important;
}

a {
   text-decoration: none;
   border-bottom: none;
}

#wrap {
   width: 100%;
   height: auto;
   text-align: center;
   border-radius: 50px;
   box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
   background-color: white;
   font-family: 'Pretendard-Regular' !important;
}

body {
   background: #f6f5f7;
   justify-content: center;
   align-items: center;
   margin: -20px 0 50px;
}
h2 {
   text-align: center;
   font-size: 40px;
   margin: 0;
}
#info_box {
   text-align: center !important;
}
#imgArea {
   width: 120px !important;
   height: 120px !important;
   border: 1px solid white !important;
   text-align: center !important;
   line-height: 120px !important;
   color: gray !important;
   border-radius: 50% !important;
   margin: 0 auto !important;
   cursor: pointer !important;
   background-image: url(/images/basic.png);
   background-size: cover !important;
   background-position: center !important;
}
#fileArea {
   display: none !important;
}


table th {
   text-align: center;
   font-weight: bold;
   font-family: 'Pretendard-Regular' !important;
}

input[type="button"] {
   /* margin-top : 20px; */
   margin-bottom : 20px;
   margin-right : 10px;
}

textarea {
    resize: none !important;
  }
#resume {
    text-align: center !important;
    vertical-align: middle !important;
}
#is_drivable_yes, #is_drivable_no {
    width: 200px !important;
}
#is_drivable_yes {
    margin-right: 20px !important;
}
#is_drivable_no {
    margin-left: 20px !important;
}
#info_box {
    border-collapse: separate !important;
    border-spacing: 0 !important;
}
table tbody tr:nth-child(2n + 1) {
     background-color: transparent !important;
}
#e_id_value {
    width: 100% !important;
}
.btn_area {
    text-align: right !important;
    padding-right: 10px !important;
}
#careerAdd, #licenseAdd, #careerDelete, #licenseDelete {
    width: 250px;
}
#careerAdd, #licenseAdd {
    margin-right: 20px !important;
}
#keyword {
   text-align: center !important;
    vertical-align: middle !important;
}
#info_box {
   text-align: center !important;
}
#imgArea {
   width: 120px !important;
   height: 120px !important;
   border: 1px solid white !important;
   text-align: center !important;
   line-height: 120px !important;
   color: gray !important;
   border-radius: 50% !important;
   margin: 0 auto !important;
   cursor: pointer !important;
   background-image: url(/images/basic.png);
   background-size: cover !important;
   background-position: center !important;
}
#fileArea {
   display: none !important;
}

.box2 {
    background-color: #F2FFED;
    border-radius: 50px 50px 50px 50px / 50px 50px 50px 50px !important;
    padding: 50px 30px 0px 30px;
}
#addbutton {
    margin: 10px 0px 0px 0px !important;
}
#complete {
   margin: 0px 0px 40px 0px;
}
#is_drivable_yes, #is_drivable_no, #addbutton, #careerAdd, #careerDelete,
#licenseAdd, #licenseDelete, #complete, #keyword1, #keyword2, #keyword3,
#keyword4, #keyword5 {
   box-shadow: none;
   border: 2px solid #1bcea5;
}
h2 {
   padding: 50px 0px 0px 0px;
}
#is_drivable_yes.selected,
#is_drivable_no.selected {
  background-color: #F2FFED !important;
}
.choice {
   background-color: #F2FFED !important;
}
#keywordinfo {
    text-align: center !important;
    border: none;
}
#resume_value.has-text {
   background-color: lightblue;
}
#available_time {
   vertical-align: middle !important;
   text-align: center !important;
}

input[type="button"] [value="등록 완료"] {
   text-align: center !important;
   align-item : center;
   justify-content: center;
}



</style>

</head>
<body class="is-preload">
   <!-- Wrapper -->
   <div id="wrapper">
      <header id="header" class="alt">

         <!-- Logo -->
         <div class="logo">
            <a href="${cp}/index.jsp"><strong>everycare</strong></a>
         </div>

         <!-- Nav -->
         <nav id="nav">
            <ul style="display: flex">
               <li class="current"><a href="${cp}/index.jsp">Home</a></li>
               <li><a href="${cp}/expertsort.ep?psort=1">전문가매칭</a></li>
               <li><a href="${cp}/u_boardlist.ub"
                  class="icon solid fa-angle-down" style="pointer-events: none;">게시판</a>
                  <ul class="drop_menu">
                     <li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
                     <li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
                     <li><a href="${cp}/reviewlist.rf">리뷰게시판</a></li>
                  </ul></li>
               <c:if test="${not empty loginUser}">
                  <li class="mypage"><a href="${cp}/"
                     class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
                     <ul class="drop_menu">
                        <li class="mypage"><a href="${cp}/userinfo.us">유저 정보</a></li>
                        <c:if test="${not empty expertSession}">
                           <li class="expertpage"><a href="${cp}/expertinfo.ep">전문가
                                 정보</a></li>
                        </c:if>
                     </ul></li>
               </c:if>
               <c:if test="${not empty sessionScope.loginUser}">
                  <!-- 세션이 있을 때 (로그인된 상태) -->
                  <c:choose>
                     <c:when test="${not empty expertSession}">
                        <!-- 전문가 세션이 있을 때 -->
                        <li><a href="${cp}/app/expertChat/expertChatList.jsp"><input
                              type="button" value="전문가채팅" id="expert_chat"></a></li>
                        <!-- <span class="note-num"></span>    -->
                     </c:when>
                     <c:otherwise>
                        <!-- 전문가 세션이 없을 때 -->
                        <li><a href="${cp}/app/expert/expertRegister.jsp"><input
                              type="button" value="전문가등록" id="expert_btn"></a></li>
                     </c:otherwise>
                  </c:choose>
                  <li><a href="${cp}/app/user/user-logout.jsp"><input
                        type="button" value="로그아웃" id="logout_btn"></a></li>
                  <li><p id="login_user" style="font-weight: bold">${sessionScope.loginUser}님</p></li>
               </c:if>
               <c:if test="${empty sessionScope.loginUser}">
                  <li><a href="${cp}/app/user/user-login.jsp"><input
                        type="button" value="로그인" id="login_btn"></a></li>
               </c:if>
            </ul>
         </nav>
      </header>
      <section id="banner" class="main">
         <div class="content primary">
            <form action="${cp}/expertok.ep" method="post" name="expertAddForm"
               enctype="multipart/form-data">
               <div id="wrap" class="box2">
                  <h2>전문가 등록</h2>
                  <h4>당신의 도움이 필요합니다.</h4>
                  <table id="info_box">
                     <tr id="tr1">
                        <div id="imgArea" name="imgArea" onclick="uploadFile()"></div>
                        <input type="file" id="fileArea" name="fileArea"
                           onchange="previewFile()">
                        <input type="hidden" id="orgFileName" name="orgFileName"
                           value="">
                     </tr>
                     <tr>
                        <th id="e_id">아이디</th>
                        <td colspan="3"><input type="text" id="e_id_value"
                           name="e_id_value" value="${loginUser}" readonly></td>
                     </tr>
                     <tr>
                        <th id="is_drivable">운전가능여부</th>
                        <td colspan="3"><input type="button" id="is_drivable_yes"
                           name="is_drivable_yes" value="가능"
                           onclick="is_drivable('is_drivable_yes')"> <input
                           type="button" id="is_drivable_no" name="is_drivable_no"
                           value="불가능" onclick="is_drivable('is_drivable_no')"></td>
                     </tr>
                     <tr>
                        <th id="location">근무가능지역</th>
                        <td colspan="3"><input type="text" id="location_value"
                           name="location_value" placeholder="Ex : 경기도 안양시, ...">
                        </td>
                     </tr>
                     <tr>
                        <th>근무StartTime</th>
                        <td><input type="text" id="available_time_value1"
                           name="available_time_value1" placeholder="Ex : 24시 표기법(09) 사용">
                        </td>
                        <th>근무EndTime</th>
                        <td><input type="text" id="available_time_value2"
                           name="available_time_value2" placeholder="Ex : 24시 표기법(18) 사용">
                        </td>
                     </tr>
                     <tr>
                        <th id="cost">시간당 급여</th>
                        <td colspan="3"><input type="text" id="cost_value"
                           name="cost_value" placeholder="Ex : 20000"></td>
                     </tr>
                     <tr>
                        <th>계좌정보</th>
                        <td colspan="3"><input type="text" id="account"
                           name="account" placeholder="Ex : 우리은행 xxxxxxxxx('-'빼고입력) 예금주명">
                        </td>
                     </tr>
                     <tr>
                        <th id="resume">자기소개</th>
                        <td colspan="3"><textarea id="resume_value"
                              name="resume_value" cols="30" rows="10"
                              placeholder="300자 미만으로 입력"></textarea></td>
                     </tr>
                     <tr>
                        <th id="keyword">키워드</th>
                        <td colspan="3">
                           <div>
                              <input type="text" value="가능하신 업무의 키워드를 클릭해주세요!(1개 이상)"
                                 id="keywordinfo">
                              <div id="keyword_input">
                                 <input type="button" value="베이비시터" id="keyword1"
                                    name="keyword1" onclick="choice('keyword1')"> <input
                                    type="button" value="학습시터" id="keyword2" name="keyword2"
                                    onclick="choice('keyword2')"> <input type="button"
                                    value="등하원도우미" id="keyword3" name="keyword3"
                                    onclick="choice('keyword3')"> <input type="button"
                                    value="병원동행" id="keyword4" name="keyword4"
                                    onclick="choice('keyword4')"> <input type="button"
                                    value="가사도우미" id="keyword5" name="keyword5"
                                    onclick="choice('keyword5')">
                              </div>
                              <input type="hidden" value="" name="keyWordList"
                                 class="keyWordList" id="keyWordList">
                           </div>
                        </td>
                     </tr>
                     <tr class="careerRow">
                        <th>경력사항1</th>
                        <td id="line1" colspan="3"><input type="text"
                           id="career_name" name="career_name" placeholder="Ex : 전 근무지명">
                        </td>
                     </tr>
                     <tr class="careerRow">
                        <th>입사일자</th>
                        <td><input type="text" id="start_time" name="start_time"
                           placeholder="Ex : 20240401"></td>
                        <th>퇴사일자</th>
                        <td><input type="text" id="end_time" name="end_time"
                           placeholder="Ex : 20240402"></td>
                     </tr>
                     <tr>
                        <td colspan="4"><input type="button" value="추가 하기"
                           id="careerAdd" onclick="addRow()"> <input type="button"
                           value="삭제 하기" id="careerDelete" onclick="deleteRow()">
                        </td>
                     </tr>
                     <tr class="licenseRow">
                        <th id="license1">자격증명1</th>
                        <td><input type="text" id="license_name"
                           name="license_name" placeholder="Ex : 사회복지사"></td>
                        <th id="license_get1">취득일자</th>
                        <td><input type="text" id="acquire_date"
                           name="acquire_date" placeholder="Ex : 20210221"></td>
                     <tr>
                        <td colspan="4"><input type="button" value="추가 하기"
                           id="licenseAdd" name="licenseAdd" onclick="licenseRowAdd()">
                           <input type="button" value="삭제 하기" id="licenseDelete"
                           name="licenseDelete" onclick="licencRowDelete()"></td>
                     </tr>
                  </table>
                  <div class="btn_area">
                     <input type="button" id="complete" value="등록 완료"
                        onclick="sendit()">
                  </div>
               </div>
            </form>
         </div>
      </section>
      
      <footer id="footer">
         <div class="inner">
            <section>
               <h3>EveryCare</h3>
               <p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해
                  사용자들이 안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
               <ul class="icons">
                  <li><a href="#" class="icon brands fa-facebook-f"><span
                        class="label">Facebook</span></a></li>
                  <li><a href="#" class="icon brands fa-twitter"><span
                        class="label">Twitter</span></a></li>
                  <li><a href="#" class="icon brands fa-linkedin-in"><span
                        class="label">LinkedIn</span></a></li>
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
               <p>EveryCare 고객센터는 여러분의 궁금증이나 문의사항에 친절하고 신속하게 대응해 드립니다. 저희 팀은
                  24시간 365일 연중무휴로 운영되며, 다음과 같은 서비스를 제공합니다.
               <p>
               <p>
                  <a href="#" class="major">(000) 000-0000</a>
               </p>
            </section>
         </div>
         <div class="copyright">
            <p>&copy; EveryCare. All rights reserved.</p>
         </div>
      </footer>


   </div>

   <!-- Scripts -->
   <script>
      const cp = "${cp}"
   </script>
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
   var imgeUrl; // 프로필사진에 들어갈 변수

   const arKeyword = [];
   // 운전여부 클릭시 이벤트
   function is_drivable(elementId) {
      var button = document.getElementById(elementId);
      var otherButtonId = (elementId === "is_drivable_yes") ? "is_drivable_no"
            : "is_drivable_yes";
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
      console.log(otherButtonId);
   }

   // 경력입력란 추가
   function addRow() {
      i++
      var careerRow = document.getElementsByClassName("careerRow");

      if (careerRow.length >= 5) {
         alert("최대 2개까지만 추가 가능합니다.")
         return;
      }
      var careerTr = document.createElement('tr'); // 경력사항 tr 생성
      var newtd1 = document.createElement('td'); // 경력사항 td1
      var newtd2 = document.createElement('td'); // 경력사항 td2
      var input = document.createElement("input"); // input태그 생성하는 변수 생성
      newtd1.innerHTML = "경력사항" + (i + 1); //  td1에 HTML문 기입 1
      input.setAttribute("type", "text"); // input type속성 지정
      input.setAttribute("id", "career_name"); // input id속성 지정 1
      input.setAttribute("name", "career_name"); // input name속성 지정 1
      input.setAttribute("placeholder", "Ex : 전 근무지명"); // placeholder속성 지정
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

      newtd3.innerHTML = "입사일자";
      input2.setAttribute("type", "text");
      input2.setAttribute("id", "start_time"); // 1
      input2.setAttribute("name", "start_time"); // 1
      input2.setAttribute("placeholder", "2024.04.01");
      newtd4.appendChild(input2);

      newtd5.innerHTML = "퇴사일자";
      input3.setAttribute("type", "text");
      input3.setAttribute("id", "end_time"); // 1
      input3.setAttribute("name", "end_time"); // 1
      input3.setAttribute("placeholder", "2024.04.02");
      newtd6.appendChild(input3);

      careerTr2.classList.add("careerRow");
      careerTr2.appendChild(newtd3);
      careerTr2.appendChild(newtd4);
      careerTr2.appendChild(newtd5);
      careerTr2.appendChild(newtd6);

      careerRow[careerRow.length - 1].after(careerTr);
      careerRow[careerRow.length - 1].after(careerTr2);

      // careerRow마지막 배열의 그 다음에 carrerTr 삽입
   }

   // 경력입력란 삭제
   function deleteRow() {
      var careerRow = document.getElementsByClassName("careerRow");
      if (careerRow.length > 2) {
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

      if (licenseRow.length >= 3) {
         alert("최대 2개까지만 추가 가능합니다.")
         return;
      }
      var licenseTr = document.createElement('tr');
      var licensetd1 = document.createElement('td');
      var licensetd2 = document.createElement('td');
      var licensetd3 = document.createElement('td');
      var licensetd4 = document.createElement('td');
      var li_input1 = document.createElement("input");
      li_input1.setAttribute("type", "text");
      li_input1.setAttribute("id", "license_name"); // 1
      li_input1.setAttribute("name", "license_name"); // 1
      li_input1.setAttribute("placeholder", "Ex : 사회복지사");
      var li_input2 = document.createElement("input");
      li_input2.setAttribute("type", "text");
      li_input2.setAttribute("id", "acquire_date"); // 1
      li_input2.setAttribute("name", "acquire_date"); // 1
      li_input2.setAttribute("placeholder", "Ex : 2021.02.21");

      licensetd1.innerHTML = "자격증명" + (j + 1);
      licensetd2.appendChild(li_input1);
      licensetd3.innerHTML = "취득일자";
      licensetd4.appendChild(li_input2);

      licenseTr.classList.add("licenseRow");
      licenseTr.appendChild(licensetd1);
      licenseTr.appendChild(licensetd2);
      licenseTr.appendChild(licensetd3);
      licenseTr.appendChild(licensetd4);

      licenseRow[licenseRow.length - 1].after(licenseTr);
   }
   // 자격증 입력란 삭제
   function licencRowDelete() {
      var licenseRow = document.getElementsByClassName("licenseRow");

      if (licenseRow.length > 1) {
         var licenseArray = Array.from(licenseRow);

         licenseArray[licenseArray.length - 1].remove();
         j--;
      } else {
         alert("첫번째 입력란입니다!");
      }
   }

   // 키워드
   function choice(elementId) {
      var clickElement = document.getElementById(elementId);
      var keyWordList = document.getElementById("keyWordList");

      if (clickElement.classList.contains("choice")) {
         clickElement.classList.remove("choice");
      } else {
         clickElement.classList.add("choice");
      }

      var choiceKeyWords = [];
      // #keyword_input 안에 있는 모든 input태그들을 찾아옴
      var buttons = document.querySelectorAll("#keyword_input input");
      // buttons : 노드 리스트임
      // buttons에 있는 각각의 버튼 요소들을 순회하며 클래스 choice를 가진 버튼의 값을 choiceKeyword배열에 추가
      buttons.forEach(function(button) {
         if (button.classList.contains("choice")) {
            choiceKeyWords.push(button.value);
         }
      });
      // choiceKeyWords의 요소들을 ,로 구분지어 keyWordList의 value에 삽입
      keyWordList.value = choiceKeyWords.join(",");
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
      var imgArea = document.getElementById("imgArea");
      var orgFileName = document.getElementById("orgFileName");
      var reader = new FileReader();
      var imageUrl = "url('{cp}/images/basic.png')";

      if (file == undefined) {
         imgArea.style.backgroundImage = imageUrl;
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
         if (ext == "jpeg" || ext == "png" || ext == "jpg" || ext == "webp"
               || ext == "gif") {
            // 프로필창에 미리보기  사진 삽입
            reader.onloadend = function() {
               imgArea.style.backgroundImage = "url(" + reader.result
                     + ")";
            }
         } else {
            alert("유효하지 않은 파일형식 입니다!");
            imgArea.style.backgroundImage = imageUrl;
            orgFileName.value = "";
         }
      }
   };

   // 이미지 파일 클릭 시 파일 삭제
   document.getElementById("imgArea").addEventListener("click", function() {
      // 파일 영역을 초기화하고, 이미지 영역도 초기화
      imgArea.style.backgroundImage = imageUrl;
      ;
      fileArea.value = null;
   });

   // 제출

   function sendit() {

      const expertAddForm = document.expertAddForm;
      var viewId = expertAddForm.e_id_value.value;
      var drivableYes = document.getElementById("is_drivable_yes");
      var drivableNo = document.getElementById("is_drivable_no");
      var location = document.getElementById("location_value")
      var Pettern1 = /^[가-힣a-zA-Z\d\s]*$/; // 한글과 숫자,영어
      var available_time_value1 = document
            .getElementById("available_time_value1");
      var available_time_value2 = document
            .getElementById("available_time_value2");
      var cost = document.getElementById("cost_value");
      var account = document.getElementById("account");
      var resume = document.getElementById("resume_value");
      var carrer = document.getElementById("career_name");
      var start = document.getElementById("start_time");
      var end = document.getElementById("end_time");
      var license = document.getElementById("license_name");
      var acquire = document.getElementById("acquire_date");
      var Pettern2 = /^[0-9]+$/; // 숫자
      var Pettern3 = /^[가-힣0-9\s]+$/; // 한글, 숫자
      var Pettern4 = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9\s~`!@#$%^&*()-_=+\[\]{}|;:'",.<>\/?]{1,300}$/;
      var pettern5 = /^[1-9]\d{7}$/; // 8자리수의 숫자를 입력받되 첫글자가 0이면 안됨
      var pettern6 = /^\d{2}$/; // 정수 숫자 2개 입력받기
      var keyWordList = document.getElementById("keyWordList");

      // 아이디
      if (viewId == null || viewId == "") {
         alert("로그인 후 등록이 가능합니다!");
         return;
      }

      // 운전가능여부
      if (!drivableYes && !drivableNo) {
         alert("운전가능여부를 선택하지 않으셨습니다. 가능과 불가능 중 하나를 꼭 선택해주세요!");
         return;
      }

      // 근무가능지역
      if (location.value.trim() === "" || location.value.trim() === null) {
         alert("근무가능한 지역을 입력해주세요!");
         location.focus();
         return;
      }

      // 근무가능지역 한글과 숫자,영어만 입력제한
      if (!Pettern1.test(location.value.trim())) {
         alert("근무가능지역에는 한글과 숫자, 영어만 입력이 가능합니다");
         location.focus();
         return;
      }

      // 근무가능시간
      if (available_time_value1.value.trim() === ""
            || available_time_value1.value.trim() === null) {
         alert("근무를 시작 가능한 시간을 입력해주세요! Ex : 09 (24시 표기법을 사용하며 'HH'형태로 입력해주세요)");
         available_time_value1.focus();
         return;
      }

      if (!pettern6.test(available_time_value1.value)) {
         alert("근무를 시작 가능한 시간(정수 2글자)을 입력해주세요! Ex : 09 (24시 표기법을 사용하며, 'HH'형태로 입력해주세요)")
         available_time_value1.value = "";
         available_time_value1.focus();
         return;
      }

      if (available_time_value2.value.trim() === ""
            || available_time_value2.value.trim() === null) {
         alert("몇시까지 근무가 가능한지 입력해주세요! Ex : 18 (HH 형태로 입력해주세요!)")
         available_time_value2.focus();
         return;
      }

      if (!pettern6.test(available_time_value2.value)) {
         alert("몇시까지 근무가 가능한지(정수 2글자) 입력해주세요! Ex : 09 (24시 표기법을 사용하며, 'HH'형태로 입력해주세요)")
         available_time_value2.value = "";
         available_time_value2.focus();
         return;
      }

      if (available_time_value1.value > available_time_value2.value) {
         alert("24시 표기법을 사용하므로 시작시간이 끝낼(몇시까지 근무가능한지)시간보다 큰 숫자가 들어갈 수 없습니다.")
         available_time_value1.value = "";
         available_time_value2.value = "";
         available_time_value1.focus();
         return;
      }

      // 시간당 급여
      if (cost.value === "" || cost.value === null) {
         alert("시간당 희망급여를 입력해주세요!");
         cost.focus();
         return;
      }

      // 시간당 급여 숫자 입력제한
      if (!Pettern2.test(cost.value)) {
         alert("시간당 급여에는 ','를 포함하면 안되며 숫자 정수만 입력이 가능합니다!");
         cost.focus();
         return;
      }

      // 계좌정보
      if (account.value === "" || account.value === null) {
         alert("계좌정보를 입력해주세요! (Ex : 우리은행 123456789('-'제외)예금주명)");
         account.focus();
         return;
      }

      // 계좌정보 한글과 숫자만 입력제한
      if (!Pettern3.test(account.value)) {
         alert("계좌정보에는 한글과 숫자만 입력이 가능 합니다");
         account.focus();
         return;
      }

      // 자기소개
      if (resume_value.value == "" || resume_value.value == null) {
         alert("자기소개를 입력해주세요!")
         resume_value.focus();
         return;
      }

      // 자기소개 한글입력제한과 글자 수 제한
      if (!Pettern4.test(resume_value.value)) {
         alert("자기소개에는 최대 300자를 초과할 수 없습니다!")
         resume_value.focus();
         return;
      }

      // 키워드
      if (keyWordList.value == null || keyWordList.value == "") {
         alert("키워드는 적어도 1개 이상 선택해주세요!");
         return;
      }
      // 전문가등록시 프로필사진들 등록하지 않으면 등록이 되지않음
      if (orgFileName.value == null || orgFileName.value == "") {
         alert("프로필 사진을 설정해주세요!")
         return;
      }

      alert("등록이 완료되었습니다!");
      expertAddForm.submit();

   }
</script>
