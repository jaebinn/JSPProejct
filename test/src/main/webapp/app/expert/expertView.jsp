<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
   <head>
      <title>everycare</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="icon" href="${cp}/images/everycare.ico" />
      <script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="${cp}/css/main.css" />
      <link rel="stylesheet" href="${cp}/css/expert_view.css" />
      <link rel="stylesheet" href="${cp}/css/expert_list.css" />
      <link rel="stylesheet" href="${cp}/css/chat.css" />
      
   </head>
   <body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">
            <!-- Header -->
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

               <!--프로필  -->
            <section class="profile-card">
               <div class="image">
                  <img src="${cp}/file/${expert.original_name}" alt="" class="profile-img">
               </div>

               <div class="text-data">
                  <span class="name">${expert.name}</span>
                  <span class="age">나이: ${expert.age}</span>
                  <table>                     
                     <tr>
                        <th>가능시간:</th>
                        <td>${expert.available_time}시</td>
                     </tr>
                     <tr>
                        <th>가능지역:</th>
                        <td>${expert.location}</td>
                     </tr>
                     <tr style="vertical-align:middle; text-align:center;">
                        <th>지도</th>
                        <td><div id="map" style="width:300px; height:300px"></div></td>
                     </tr>
                     <tr>
                        <th>시간당 요금:</th>
                        <td>${expert.cost}</td>
                     </tr>
                     <tr>
                        <th>분야:</th>
                        <td>${expert.keyword_list}</td>
                     </tr>
                     <tr>
                        <th>운전여부:</th>
                        <c:choose>
                            <c:when test="${expert.is_drivable}">
                                <td>가능</td>
                            </c:when>
                            <c:otherwise>
                                <td>불가능</td>
                            </c:otherwise>
                        </c:choose>                                          
                     </tr>
                     <tr>
                        <th>계좌번호:</th>
                        <td>${expert.account}</td>
                     </tr>
                     <tr>
                        <th>경력:</th>
                        <td>${expert.career_name}</td>
                     </tr>
                     <tr>
                        <th>자기소개:</th>
                        <td>${expert.resume}</td>
                     </tr>
                  </table>
               </div>

               <div class="media-buttons">
                  <a href="#" style="background: #4267b2;" class="link">
                     <i class="fa-brands fa-facebook"></i>
                  </a>
                  <a href="#" style="background: #1da1f2;" class="link">
                     <i class="fa-brands fa-twitter"></i>
                  </a>
                  <a href="#" style="background: #e1306c;" class="link">
                     <i class="fa-brands fa-instagram"></i>
                  </a>
                  <a href="#" style="background: #ff0000;" class="link">
                     <i class="fa-brands fa-youtube"></i>
                  </a>
               </div>
               
               <div class="btns">
                  <c:if test="${is_chatRoom ne 'o'}">
                        <div class="chat_btn">
                           <input type="button" class="chatting" value="1대1 채팅하기" style="margin-right:10px;"/>
                        </div>
                       </c:if>
                        <div class="review_btn">
                     <a href="${cp}/app/review/review_write.jsp?expert_idx=${expert.expert_idx}&expert_name=${expert.name}" class="review_write" style="padding:10px 20px;">리뷰쓰기</a>
                  </div>                         
               </div>
               <c:if test="${not empty sessionScope.loginUser}">
                   <!-- 세션이 있을 때 (로그인된 상태) -->
                   <c:set var="loginUser" value="${sessionScope.loginUser}" />
                  <c:set var="likeInfo" value="${likeInfo}"/>
               </c:if>
               
                   <div class="analytics" data-expert_idx="${expert.expert_idx}">
                       <div class="data">
                           <c:choose>
                               <c:when test="${likeInfo ne null and likeInfo.expert_idx eq expert.expert_idx and likeInfo.isLike eq 'O'}">
                                   <i class="fa-solid fa-heart toggle" style="color:red"></i>
                               </c:when>
                               <c:otherwise>
                                   <i class="fa-regular fa-heart toggle"></i>
                               </c:otherwise>
                           </c:choose>
                           <span>${expert.totalCnt}</span>                    
                       </div>              
                   </div>
            </section>
            <div class="chat-container">
            <c:if test="${!empty loginUser}">
                     <button id="chat-circle" class="icon solid fa-regular fa-comments major"><span class="note-num">0</span></button>
               </c:if>
                   </div>
                   <div id="chatbox" style="display: none;" >
                     <div id="friendslist">
                        <div id="topmenu">
                          <span class="friends"></span>
                        </div>
                           
                          <div id="friends">
                           <!-- <div class="friend">
                              <img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />
                                 <p>
                                 <strong>임은정</strong>
                                 </p>
                                 <div class="status active">3</div>
                              </div>  -->    
                                  <div id="search">
                                    <input type="text" id="searchfield" value="" />
                                 </div>         
                              </div>                
                           </div>  
                           
                           <div id="chatview" class="p1">      
                              <div id="profile">
                                 <div id="close">
                                    <div class="cy"></div>
                                    <div class="cx"></div>
                                 </div>
                                 <p></p>
                              </div>
                              <div id="chat-messages">
                              <label></label>                               
                           
                           	  </div>
                           	  
                              <div id="sendmessage">
                              <input type="text" value="Send message..." />
                                 <button id="send"></button>
                              </div>
                           </div>        
                        </div>  
                     </div>
            
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
			${loginUser}
			${expert.expert_idx}
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
         
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23697895f1f73fcadc63e0aa3f1d0bf9&libraries=services"></script>
         <script>
         
         const user_id = "${loginUser}";
         const expert_idx = "${expert.expert_idx}";

         function openChatRoom(user_id,expert_idx){
              $.ajax({
                      url: '/openChatRoom.ch',
                      type: 'POST',
                      data: {
                         user_id: user_id,
                         expert_idx: expert_idx
                      },
                      dataType: 'text',
                      success: function (res) {
                          // 서버로부터 응답을 받으면 필요한 처리를 수행합니다.
                          if(res === 'o'){
                             console.log('채팅방 생성 완료 5초후 채팅방이 열립니다.');
                             setTimeout(function() {
                                  $('#chat-circle').trigger('click');
                              }, 5000);
                          }else{
                             console.log('채팅방 만들기 실패 이유는 몰?루');
                          }
                      },
                      error: function (e) {
                          // 에러 처리
                          console.error('채팅방 만들기에 에러발생:'+e);
                      }
                });
         }
         
         
         $(document).ready(function() {
              $('.analytics .data').click(function () {
                 let expert_idx = $(this).closest('.analytics').data('expert_idx');
                  
                  let heart = $(this).find('.toggle');
                  let totalCnt = parseInt($(this).find('span').text());
                  
                  heart.toggleClass('fa-regular fa-heart fa-solid fa-heart');
                  if (heart.hasClass('fa-solid')) {
                      heart.css('color', 'red');
                      totalCnt++;
                      isLiked = true;
                  } else {
                      heart.css('color', '');
                      totalCnt--;
                      isLiked = false;
                  }

                  $(this).find('span').text(totalCnt);

                  // 좋아요 정보를 서버로 전송
                  $.ajax({
                      url: cp+'/expertlikecnt.ep',
                      type: 'POST',
                      data: {
                          expert_idx: expert_idx,
                          totalCnt: totalCnt,
                          isLiked: isLiked
                      },
                      success: function (response) {
                          // 서버로부터 응답을 받으면 필요한 처리를 수행합니다.
                          console.log('좋아요 정보가 업데이트되었습니다.');
                      },
                      error: function (xhr, status, error) {
                          // 에러 처리
                          console.error('좋아요 정보 업데이트 중 에러가 발생했습니다:', error);
                      }
                  });
              });
              let location = "${expert.location}";
                console.log(location);
              var mapContainer = document.getElementById('map'), 
              mapOption = {
                  center: new kakao.maps.LatLng(33.450701, 126.570667),
                  level: 3 // 지도의 확대 레벨
              };  
             var map = new kakao.maps.Map(mapContainer, mapOption); 
   
             var geocoder = new kakao.maps.services.Geocoder();
   
             geocoder.addressSearch(location, function(result, status) {
   
                  if (status === kakao.maps.services.Status.OK) {
   
                     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
                     var marker = new kakao.maps.Marker({
                         map: map,
                         position: coords
                     });
   
                     var infowindow = new kakao.maps.InfoWindow({
                         content: '<div style="width:150px;text-align:center;padding:6px 0;">가능지역</div>'
                     });
                     infowindow.open(map, marker);
   
                     map.setCenter(coords);
                 } 
             });    
       });
         
      
         $(window).on('beforeunload', function() {
                stopUpdate = true;
         });
         $(document).on("click", ".chatting", function(){
                 openChatRoom(user_id, expert_idx);
                 $(this).remove();
              });

      </script>
      <script src="${cp}/js/chat.js"></script>
   </body>
</html>