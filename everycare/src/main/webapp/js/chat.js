
   let active_chat_idx;
   let lastChatId;
   let stopUpdate = false;
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

   $(document).ready(function () {
       const chatButton = document.getElementById('chat-circle');
       const chatBox = document.getElementById('chatbox');
       userChatGetNotReadCnt(user_id);

       // 채팅창 토글 버튼 이벤트 리스너 추가
       chatButton.addEventListener('click', function () {
           chatBox.style.display = (chatBox.style.display === 'none') ? 'block' : 'none';
       });

       // 클릭 이벤트 한 번만 실행
       let clicked = false;

       // 채팅방 내용 가져오기
       $("#chat-circle").click(function () {
           if (!clicked) {
               clicked = true;
               $.ajax({
                   url: '/getChatList.ch',
                   type: 'POST',
                   data: { 'user_id': user_id },
                   dataType: 'json',
                   success: function (data) {
                       $.each(data, function (index, chat) {
                           let expert_idx = chat.expert_idx;
                           let chat_idx = chat.chat_idx;

                           // 전문가 이름 가져오기
                           $.ajax({
                               url: '/getNamebyExpert_idx.ep',
                               type: 'POST',
                               data: { "expert_idx": expert_idx },
                               dataType: 'text',
                               success: function (data) {
								   const userData = JSON.parse(data);
    
								    // 사용자 이름 가져오기
								   console.log(userData);
								   const userName = userData.user_name;
								   const originalFile = userData.profile;
                                   console.log("네임 : " + userName);
                                   let nameElement = $('<strong>').text(userName);

                                   // 안읽은 채팅 개수 가져오기
                                   $.ajax({
                                       url: '/getChatNotReadCnt.ch',
                                       type: 'POST',
                                       data: { "chat_idx": chat_idx },
                                       success: function (notReadCnt) {
                                           console.log("낫리드시엔트 : " + notReadCnt);
                                           const statusElement = $('<div class="status available">').text(notReadCnt);
                                           const friendElement = $('<div class="friend"></div>');
                                           const imgElement = $('<img>').attr('src', '/file/'+originalFile);
                                           friendElement.append(imgElement, $('<p>').append(nameElement), statusElement);
                                           friendElement.attr('id', chat_idx);
                                           $("#friends").prepend(friendElement); // 여기서 추가
                                       },
                                       error: function () {
                                           console.log("안읽은 채팅 개수 불러오기 실패")
                                       }
                                   });
                               },
                               error: function () {
                                   console.log("전문가 이름 받아오기 실패")
                               }
                           });
                       });
                   },
                   error: function () {
                       console.log("오류 발생")
                   }
               });
           }
       });

       const preloadbg = document.createElement("img");

       // 검색 필드 초기화 및 포커스 아웃 이벤트 핸들러 추가
       $("#searchfield").focus(function () {
           if ($(this).val() == "Search contacts...") {
               $(this).val("");
           }
       }).focusout(function () {
           if ($(this).val() == "") {
               $(this).val("Search contacts...");
           }
       });

       // 메시지 입력 필드 초기화 및 포커스 아웃 이벤트 핸들러 추가
       $("#sendmessage input").focus(function () {
           if ($(this).val() == "Send message...") {
               $(this).val("");
           }
       }).focusout(function () {
           if ($(this).val() == "") {
               $(this).val("Send message...");
           }
       });

       // 친구 목록 클릭 이벤트 핸들러 추가
       $(document).on("click", ".friend", function () {
          stopUpdate = false;
          $(this).find('.status').text('0');
          $(this).addClass('active');
           const childOffset = $(this).offset();
           const parentOffset = $(this).parent().parent().offset();
           const childTop = childOffset.top - parentOffset.top;
           const clone = $(this).find('img').eq(0).clone();
           const top = childTop + 12 + "px";

           $(clone).css({ 'top': top }).addClass("floatingImg").appendTo("#chatbox");

           setTimeout(function () { $("#profile p").addClass("animate"); $("#profile").addClass("animate"); }, 100);
           setTimeout(function () {
               $("#chat-messages").addClass("animate");
               $('.cx, .cy').addClass('s1');
               setTimeout(function () { $('.cx, .cy').addClass('s2'); }, 100);
               setTimeout(function () { $('.cx, .cy').addClass('s3'); }, 200);
           }, 150);

           $('.floatingImg').animate({
               'width': "68px",
               'height': "68px",
               'left': '108px',
               'top': '20px'
           }, 200);

           const name = $(this).find("p strong").html();
           const email = $(this).find("p span").html();
           $("#profile p").html(name);
           $("#profile span").html(email);

           $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));
           $('#friendslist').fadeOut();
           $('#chatview').fadeIn();
           // 채팅 내용 가져오기
         $.ajax({
            url: '/getChatDetail.ch',
            type: 'POST',
            data: { "chat_idx": $(this).attr('id') },
            dataType: 'json',
            success: function (chat_detail_list) {
               let chat_idx;
               $.each(chat_detail_list, function (index, chat_detail) {
                  let message;
                  let regdate = formatRegDate(chat_detail.regdate);
                  if (chat_detail.type === 'u') {
                     message = '<div class="message right">' +
                        '<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />' +
                        '<div class="bubble">' +
                           chat_detail.contents +
                           '<div class="corner"></div>' +
                           '<span>' + regdate + '</span>' +
                           '</div>' +
                           '</div>';
                  }else if(chat_detail.type === 'er'){
                     message = '<div class="message">' +
                        '<img src="/file/'+chat_detail.original_name+'" />' +
                        '<div class="bubble">' +
                        '<a href="'+cp+'/getreservationinfo.rv?chat_idx='+chat_detail.chat_idx+'">전문가가 예약링크를 보냈습니다</a>' +
                        '<div class="corner"></div>' +
                        '<span>' + regdate + '</span>' +
                        '</div>' +
                        '</div>';
                  } 
                  else {
                     message = '<div class="message">' +
                           '<img src="/file/'+chat_detail.original_name+'" />' +
                           '<div class="bubble">' +
                           chat_detail.contents +
                           '<div class="corner"></div>' +
                           '<span>' + regdate + '</span>' +
                           '</div>' +
                           '</div>';
                  }
                  $("#chat-messages").append(message);
                  if (index === chat_detail_list.length - 1) {
                       lastChatId = chat_detail.chat_detail_num;
                       console.log("처음 겟 챗 디테일에서 찍은 라스트 챗아이디:"+lastChatId)
                       chat_idx = chat_detail.chat_idx;
                       fetchChatDetailUpdate(chat_idx,lastChatId);
                  }
   
               });               
               $("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
            },
            error: function () {
               console.log("채팅창 내용 불러오기 실패");
            }
         });
          
         //채팅창 실시간 업데이트
      // 수정된 fetchChatDetailUpdate 함수
         function fetchChatDetailUpdate(chat_idx, lastChatId) {
             if (!stopUpdate) {
                 let currentLastChatId = lastChatId; // 초기 lastChatId 값을 저장합니다
                 $.ajax({
                     url: '/fetchChatDetailUpdate.ch',
                     type: 'POST',
                     data: { "chat_idx": chat_idx },
                     dataType: 'json',
                     success: function (Last_chat_detail) {

                         if (Last_chat_detail) {
                             const regdate = formatRegDate(Last_chat_detail.regdate);         
                             if (Last_chat_detail.chat_detail_num !== currentLastChatId && Last_chat_detail.type === "e") {
                                 // 받은 chat_detail_num이 현재의 lastChatId와 다르면 진행합니다
                                 const message = '<div class="message">' +
                                              '<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />' +
                                              '<div class="bubble">' +
                                              Last_chat_detail.contents +  
                                              '<div class="corner"></div>' +
                                              '<span>' + regdate + '</span>' +
                                              '</div>' +
                                              '</div>';
                                 currentLastChatId = Last_chat_detail.chat_detail_num; // currentLastChatId를 업데이트합니다
                                 $("#chat-messages").append(message);
                             }else if(Last_chat_detail.chat_detail_num !== currentLastChatId && Last_chat_detail.type === "er"){
                                const message = '<div class="message">' +
                                       '<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />' +
                                       '<div class="bubble">' +
                                       '<a href="'+cp+'/reservation.jsp?'+chat_detail.chat_idx+'">전문가가 예약메세지를 보냈습니다</a>' +
                                       '<div class="corner"></div>' +
                                       '<span>' + regdate + '</span>' +
                                       '</div>' +
                                       '</div>';
                                currentLastChatId = Last_chat_detail.chat_detail_num; // currentLastChatId를 업데이트합니다
                                 $("#chat-messages").append(message);
                             } 
                             else {
                                 console.log("이미 받은 채팅입니다");
                             }
         
                             // 스크롤을 맨 아래로 이동합니다
                             $("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
         
                             if (!stopUpdate) {
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


                        
           // 닫기 버튼 클릭 이벤트 핸들러 추가
           $('#close').unbind("click").click(function () {
               $("#chat-messages, #profile, #profile p").removeClass("animate");
               $('.cx, .cy').removeClass("s1 s2 s3");
               $('.floatingImg').animate({
                   'width': "40px",
                   'top': top,
                   'left': '12px'
               }, 200, function () { $('.floatingImg').remove() });
            stopUpdate = true;
               setTimeout(function () {
                   $('#chatview').fadeOut();
                   $('#friendslist').fadeIn();
               }, 50);

               // 메시지 내용을 지우기
               $("#chat-messages").empty();
               $(".friend.active").removeClass('active');
           });
       });
   });

   // send 버튼 클릭 이벤트 핸들러
   $("#send").click(function () {
       sendMessage();
   });

   // 입력 필드에서 Enter 키를 눌렀을 때 이벤트 핸들러
   $("#sendmessage input").keypress(function (e) {
       if (e.which == 13) { // Enter 키를 누르면
           sendMessage();
       }
   });

   // 메시지 전송 함수
   function sendMessage() {
       const contents = $("#sendmessage input").val(); // 입력된 메시지 가져오기
       const chat_idx = $(".friend.active").attr('id');
       // 입력된 메시지가 비어있지 않은 경우에만 처리
       if (contents.trim() !== '') {
           const regdate = formatRegDate(new Date().toISOString()); // 현재 날짜 및 시간 가져오기
           // 채팅창에 내가 쓴 메시지 추가
           
           const message = '<div class="message right">' +
               '<img src="https://i.pinimg.com/564x/4b/f3/2a/4bf32ae5f06735b1d83174e9c90a385b.jpg" />' +
               '<div class="bubble">' +
               contents +
               '<div class="corner"></div>' +
               '<span>' + regdate + '</span>' +
               '</div>' +
               '</div>';

           $("#chat-messages").append(message);

           // 채팅 메시지 스크롤을 항상 아래로 이동
           $("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);

           // 서버로 메시지 전송
           $.ajax({
               url: '/sendMessage.ch', // 메시지를 전송할 서버 엔드포인트
               type: 'POST',
               data: {
                   chat_idx: chat_idx,
                   contents: contents,
               },
               dataType: 'json',
               success: function (response) {
                   console.log("데이터 전송 성공");
               },
               error: function () {
                   console.log("메시지 전송 실패");
               }
           });

           // 입력 필드 비우기
           $("#sendmessage input").val('');
       }
   }
   function userChatGetNotReadCnt(user_id){
      $.ajax({
         url: 'userChatGetNotReadCnt.ch',
         type:'POST',
         data: {'user_id':user_id},
         dataType:'text',
         success: function(res){
            if(res === "" || res === null){
               console.log("유저 전체 안본채팅개수 가져온게 없습니다.");
            }else{
               $('note-num').text(res);
            }
         },
         error: function(e){
            console.log("유저 전체 안본채팅개수 에러"+e);
         }
      });
   }
   
   
   
   