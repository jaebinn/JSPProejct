<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
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
<link rel="stylesheet" href="${cp}/css/expertChatList.css" /> 
</head>
<body class="is-preload">
   <!-- Wrapper -->
      <!-- Header -->
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
							<!-- <span class="note-num"></span>	 -->
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
	<div class="container" style="margin-top: 40px;">
         <div class="messaging">
            <div class="inbox_msg">
               <div class="inbox_people">
                  <div class="headind_srch">
                     <div class="recent_heading">
                        <h4>채팅 리스트</h4>
                     </div>
                  </div>
                  <div class="inbox_chat">
                  	${list.user_id}
                     <div class="chat_list active_chat">
                        <div class="chat_people">
                           <div class="chat_img">
                              <img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg"
                                 alt="sunil">
                           </div>
                           <div class="chat_ib">
                              <h5>
                                 Sunil Rajput <span class="chat_date">Dec 25</span>
                              </h5>                              
                           </div>
                        </div>
                     </div>
                     <div class="chat_list">
                        <div class="chat_people">
                           <div class="chat_img">
                              <img src="https://ptetutorials.com/images/user-profile.png"
                                 alt="sunil">
                           </div>
                           <div class="chat_ib">
                              <h5>
                                 Sunil Rajput <span class="chat_date">Dec 25</span>
                              </h5>
                              <p>Test, which is a new approach to have all solutions
                                 astrology under one roof.</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="mesgs">
                  <div class="msg_history">
                     <div class="incoming_msg">
                        <div class="incoming_msg_img">
                           <img src="https://ptetutorials.com/images/user-profile.png"
                              alt="sunil">
                        </div>
                        <div class="received_msg">
                           <div class="received_withd_msg">
                              <p>Test which is a new approach to have all solutions</p>
                              <span class="time_date"> 11:01</span>
                           </div>
                        </div>
                     </div>
                     <div class="outgoing_msg">
                        <div class="sent_msg">
                           <p>Test which is a new approach to have all solutions</p>
                           <span class="time_date"> 11:01 AM | June 9</span>
                        </div>
                     </div>
                     <div class="incoming_msg">
                        <div class="incoming_msg_img">
                           <img src="https://ptetutorials.com/images/user-profile.png"
                              alt="sunil">
                        </div>
                        <div class="received_msg">
                           <div class="received_withd_msg">
                              <p>Test, which is a new approach to have</p>
                              <span class="time_date"> 11:01 AM | Yesterday</span>
                           </div>
                        </div>
                     </div>
                     <div class="outgoing_msg">
                        <div class="sent_msg">
                           <p>Apollo University, Delhi, India Test</p>
                           <span class="time_date"> 11:01 AM | Today</span>
                        </div>
                     </div>
                     <div class="incoming_msg">
                        <div class="incoming_msg_img">
                           <img src="https://ptetutorials.com/images/user-profile.png"
                              alt="sunil">
                        </div>
                        <div class="received_msg">
                           <div class="received_withd_msg">
                              <p>We work directly with our designers and suppliers, and
                                 sell direct to you, which means quality, exclusive products,
                                 at a price anyone can afford.</p>
                              <span class="time_date"> 11:01 AM | Today</span>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="type_msg">
                     <div class="input_msg_write">
                        <input type="text" class="write_msg"
                           placeholder="Type a message" />
                           <button class="msg_send_btn" type="button" >
                           <i class="fa fa-paper-plane-o" aria-hidden="true" style="color: white; position:absolute; right:25px; bottom:7px;"></i>
                        </button>
                     </div>
                     
                  </div>
               </div>
            </div>
         </div>
         
         <!-- Footer -->
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
         const cp = '${cp}';
      </script>
      <script src="${cp}/js/jquery.min.js"></script>
      <script src="${cp}/js/jquery.dropotron.min.js"></script>
      <script src="${cp}/js/jquery.selectorr.min.js"></script>
      <script src="${cp}/js/jquery.scrollex.min.js"></script>
      <script src="${cp}/js/jquery.scrolly.min.js"></script>
      <script src="${cp}/js/browser.min.js"></script>
      <script src="${cp}/js/breakpoints.min.js"></script>
      <script src="${cp}/js/util.js"></script>
      <script src="${cp}/js/chat.js"></script>
      <script src="${cp}/js/main.js"></script>
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
      
      <script>
      // let expert_idx = ${expertSession} 세션가져오기
      let expert_idx = ${expertSession};
      let stopChat = false;
      
      function formatRegDate(regdate) {
          const messageDate = new Date(regdate); // 문자열을 Date 객체로 변환

          const messageYear = messageDate.getFullYear();
          const messageMonth = messageDate.getMonth() + 1;
          const messageDay = messageDate.getDate();
          const messageHour = messageDate.getHours();
          const messageMinute = messageDate.getMinutes();

          const currentDate = new Date();
          const currentYear = currentDate.getFullYear();
          const currentMonth = currentDate.getMonth() + 1;
          const currentDay = currentDate.getDate();
       
          let outputDate = "";

          if (currentYear === messageYear && currentMonth === messageMonth && currentDay === messageDay) {
              // 오늘의 메시지
              outputDate = messageHour + ":" + messageMinute;
          } else if (currentYear === messageYear && currentMonth === messageMonth) {
              // 이번 달의 메시지
              outputDate = messageMonth + "월 " + messageDay + "일 " + messageHour + ":" + messageMinute;
          } else if (currentYear === messageYear) {
              // 올해의 메시지
              outputDate = messageYear + "년 " + messageMonth + "월 " + messageDay + "일 " + messageHour + ":" + messageMinute;
          } else {
              // 올해가 아닌 메시지
              outputDate = messageYear + "년 " + messageMonth + "월 " + messageDay + "일 " + messageHour + ":" + messageMinute;
          }

          return outputDate;
      }
      
      //채팅룸 리스트
      function getExpertChatList(expert_idx){
         console.log(expert_idx);
          $.ajax({
              url: '/getExpertChatList.ch',
              type: 'POST',
              data: { 'expert_idx': expert_idx},
              dataType: 'json',
              success: function (data) {
                  $.each(data, function (index, chat) {
                      //유저이름, 안읽은채팅개수 가져오기
                      const chatContent = '<div class="chat_list" id="'+chat.chat_idx+'">' +
                   '<div class="chat_people">' +
                   '<div class="chat_img">' +
                   '<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" alt="sunil">' +
                   '</div>' +
                   '<div class="chat_ib">' +
                   '<h5>'+'<p class="user_id">'+chat.user_id+'</p>'+ chat.user_name + ' <span class="chat_date">' + chat.notReadCnt + '</span></h5>' +
                   '</div>' +
                   '</div>' +
                   '</div>';
                     $(".inbox_chat").append(chatContent);
                  });
              },
              error: function () {
                  console.log("오류 발생")
              }
          });
      }
      //유저 정보 가져오기
      function getUserInfoByUserId(chat_idx){
         $.ajax({
            url: '/getUserByUserId.us',
            type: 'POST',
            data:{"chat_idx":chat_idx},
            dataType: 'json',
            success:function(userInfo){
               if(userInfo){
                  let gender = "";
                  if(userInfo.gender === 'M'){
                     gender = '남';
                  }else{
                     gender = '여';
                  }
                  $('.headind_srch').empty();
                  const headText = 
                  '<div class="stopTrigger" style="font-size: 20px; float: right; cursor: pointer; width:2%;">'+
                  'x'+
                  '</div>'+
                  '<div class="recent_heading">'+
                  '<h4>'+userInfo.name+'('+userInfo.user_id+') <br>성별 : '+gender+' / 나이 : '+userInfo.age+'</h4>';
                  
                  $('.headind_srch').append(headText);
                  $('.inbox_chat').empty();
                  const userInfoText = '<div class="userInfo-area">'+
                  '<div class="userInfo" style="padding: 10%;">' +
                  '<div class="tel">' +
                  '<h3><i class="fa-solid fa-phone"></i> '+userInfo.tel_mobile+'</h3>' +
                  '<h3 style="font-size:16px;"><i class="fa-solid fa-phone"></i> '+userInfo.tel_sub+'</h3>' +
                  '</div>' +
                  '<div class="email">' +
                  '<h3><i class="fa-regular fa-envelope"></i> '+userInfo.email+'</h3>' +
                  '</div>' +
                  '<div class="addr">' +
                  '<h3><i class="fa-solid fa-location-dot"></i> '+userInfo.addr+' '+userInfo.addr_detail+'</h3>' +
                  '</div>' +
                  '<div class="user_etc">' +
                  '<h4><i class="fa-brands fa-rocketchat"></i> '+userInfo.user_etc+'</h4>' +
                  '</div>' +
                  '<div class="reservationBtn_area">'+
                  '<input type="button" class="reservationBtn" value="예약버튼 전송하기" style="margin-top:20%; margin-left:20%;">'+
                  '</div>'+
                  '</div>' +
                  '</div>';
                  $(".inbox_chat").append(userInfoText);
               }else{
                  console.log('유저정보가 없습니다.');
               }
            },
            error:function(){
               console.log('유저정보 가져오기 실패');
            }
         })
      }

      //들어간 채팅방 읽음처리
      function expertChatIsReadUpdate(chat_idx){
         $.ajax({
            url: '/expertChatIsReadUpdate.ch',
            type: 'POST',
            data: {'chat_idx' : chat_idx},
            dataType: 'text',
            success: function(res){
               if(res === 'o'){
                  console.log("리드카운트 업데이트 성공");
               }else{
                  console.log("리드카운트 업데이트 실패");
               }
            },
            error: function(xhr){
               console.error("리드카운트 업데이트 오류발생: "+xhr);
            }
         })
      }

      //메세지 보내기
      function sendmsg(){
         const contents = $(".write_msg").val();
         const chat_idx = $(".msg_history").attr('id');
         $.ajax({
            url: '/expertSendMsg.ch',
            type: 'POST',
            data: {'chat_idx': chat_idx,'contents': contents},
            success: function(res){
               if(res === 'o'){
                  console.log('메세지 보내기 성공');
                  if(contents.trim() !== ''){
                     const regdate = formatRegDate(new Date().toISOString());
                     const msg = "<div class='outgoing_msg'>"+
                              "<div class='sent_msg'>"+
                              "<p>"+contents+"</p>"+
                              "<span class='time_date'>"+regdate+"</span>"+
                              "</div>"+
                              "</div>";
                     $('.msg_history').append(msg);
                     $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
                  }
                  $(".write_msg").val('');
               }else{
                  console.log('메세지 보내기 실패');
               }
            },
            error: function(e){
               console.log("메세지 보내기 오류"+e);
            }
         });
      }

      //채팅방 번호로 채팅내역가져오기
      function getExpertChat_detail(chat_idx){
         $(".msg_history").empty();
         $.ajax({
            url: '/getExpertChat_detail.ch',
            type: 'POST',
            data: {'chat_idx' : chat_idx},
            dataType: 'json',
            success: function(chat_detail_list){
               $.each(chat_detail_list, function(index, chat_detail){
                  if(chat_detail.type === 'u'){
                     const regdate = formatRegDate(chat_detail.regdate);
                     var newMessage =
                     "<div class='incoming_msg'>" +
                     "<div class='incoming_msg_img'>" +
                     "<img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>" +
                     "</div>" +
                     "<div class='received_msg'>" +
                     "<div class='received_withd_msg'>" +
                     "<p>"+chat_detail.contents+"</p>" +
                     "<span class='time_date'>"+regdate+"</span>" +
                     "</div>" +
                     "</div>" +
                     "</div>";
                  $('.msg_history').append(newMessage);
                  }else if(chat_detail.type !== 'er'){
                     const regdate = formatRegDate(chat_detail.regdate);
                     var newMessage =
                     "<div class='outgoing_msg'>"+
                     "<div class='sent_msg'>"+
                     "<p>"+chat_detail.contents+"</p>"+
                     "<span class='time_date'>"+regdate+"</span>"+
                     "</div>"+
                     "</div>";
                  $('.msg_history').append(newMessage);
                  }
                  if(index === chat_detail_list.length - 1){
                     lastChatId = chat_detail.chat_detail_num;
                     console.log(lastChatId);
                      chat_idx = chat_detail.chat_idx;
                      console.log(chat_idx);
                      fetchChatDetailUpdate(chat_idx,lastChatId);
                  }
                  $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
               });
            }
         })
      }

      //실시간 채팅 업데이트
      function fetchChatDetailUpdate(chat_idx, lastChatId) {
          console.log("패치챗에서찍은챗인덱스:" + chat_idx);
          console.log("패치챗에서찍은라스트챗아이디:" + lastChatId);
          if (!stopUpdate) {
              let currentLastChatId = lastChatId; // 초기 lastChatId 값을 저장합니다
              $.ajax({
                  url: '/fetchChatDetailUpdate.ch',
                  type: 'POST',
                  data: { "chat_idx": chat_idx },
                  dataType: 'json',
                  success: function (Last_chat_detail) {
                      if (Last_chat_detail !== null && Last_chat_detail !== undefined) {
                          const regdate = formatRegDate(Last_chat_detail.regdate);
                          if (Last_chat_detail.chat_detail_num !== currentLastChatId && Last_chat_detail.type === "u") {
                              // 받은 chat_detail_num이 현재의 lastChatId와 다르면 진행합니다
                              const newMessage =
                                  "<div class='incoming_msg'>" +
                                  "<div class='incoming_msg_img'>" +
                                  "<img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>" +
                                  "</div>" +
                                  "<div class='received_msg'>" +
                                  "<div class='received_withd_msg'>" +
                                  "<p>"+Last_chat_detail.contents+"</p>" +
                                  "<span class='time_date'>"+regdate+"</span>" +
                                  "</div>" +
                                  "</div>" +
                                  "</div>";
                              currentLastChatId = Last_chat_detail.chat_detail_num; // currentLastChatId를 업데이트합니다
                              $('.msg_history').append(newMessage);
                          } else {
                              console.log("이미 받은 채팅입니다");
                          }
                          if (!stopChat) {
                        setTimeout(function () {
                           fetchChatDetailUpdate(chat_idx, currentLastChatId); // currentLastChatId를 사용합니다
                        }, 3000); // 다음 요청 전에 3초 대기합니다
                     }
                      } else {
                          console.log("새로운 메시지가 없습니다.");
                      }
                  },
                  error: function () {
                      console.log("채팅 업데이트에 실패했습니다.");
                      console.log("에러에서의 lastChatId: " + currentLastChatId);
                  }
              });
          }
      }
      
      function sendReservation(chat_idx){
         $.ajax({
            url: '/sendReservation.ch',
            data: {'chat_idx':chat_idx},
            success:function(res){
               if(res === "o"){
                  const successText='<div>예약버튼 전송완료</div>';
                  $(".reservationBtn_area").empty();
                  $(".reservationBtn_area").append(successText);
               }else{
                  console.log("예약페이지가 안보내졌습니다.");
               }   
            },
            error: function(){
               console.log("예약페이지 보내기 오류");
            }
         });
      }

      
      //채팅방들어갈때
      $(document).on("click", ".chat_list", function () {
         stopChat = false;
         const chatRoom = $(this).attr('id');
         getUserInfoByUserId(chatRoom);
         expertChatIsReadUpdate(chatRoom);
         getExpertChat_detail(chatRoom);
         $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
         $('.msg_history').attr('id',chatRoom);
      });
      
      //메세지 보내기
      $(document).on("click", ".msg_send_btn", function(){
         sendmsg();
      })
       $(document).on("keypress", ".input_msg_write", function(e){
          if(e.which == 13){ // 13은 엔터키의 keyCode
              e.preventDefault(); // 기본 엔터키 동작을 막기
              sendmsg();
          }
      });
      //로딩할떄 비우고 채팅룸리스트 띄워주기
      $(document).ready(function(){ 
         $(".msg_history").empty();
         $(".inbox_chat").empty();
         getExpertChatList(expert_idx);         
      })
      
      //페이지 나갈때 실시간 채팅호출 스탑
      $(window).on('beforeunload', function() {
          stopChat = true;
      });
      
      //채팅리스트로 돌아갈때
      $(document).on("click", ".stopTrigger", function(){
    	 stopChat = true;
         $(".inbox_chat").empty();
         $(".headind_srch").empty();
         const headText = '<div class="recent_heading">'+
         '<h4>채팅 리스트</h4>'+'</div>';
         $(".headind_srch").append(headText);
         getExpertChatList(expert_idx);
         $(".msg_history").empty();
         $(".msg_history").removeAttr('id');
      })
      
      $(document).on("click", ".reservationBtn", function(){
         sendReservation($(".msg_history").attr('id'));
      })

      </script>
</body>
</html>
