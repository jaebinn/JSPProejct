<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>everycare</title>
    <link rel="icon" href="${cp}/images/everycare.ico" />
    <script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${cp}/css/reservation.css">
</head>
<body>
    <div class="wrap">
        <div class="top_title">
            <a href="${cp}/expertlist.ep" class="btn_back" title="이전 화면으로 이동">
                <i class="fa-solid fa-arrow-left"></i>
            </a>
            <h2>
                <a href="${cp}/index.jsp" class="title">
                    <i class="fa-solid fa-house"></i>
                    <span>everycare</span></a>
            </h2>
                <a href="${cp}/userinfo.us" class="btn_my">
                    <span title="내 예약">MY</span>
                </a>
        </div>
        <div class="page_inner">
            <div class="page_confirm">
                    예약정보
            </div>
            <div class="confirm_item_top">
                <h3 class="confirm_title">
                    <i class="fa-regular fa-clock"></i>
                    <span class="title_text" data-tst_booking_state="0">예약중</span>
                </h3>
                <div class="confirm_top_content">
                    <p class="reservation_number" id="reservation_id"><span data-tst_rserv_no="0">예약번호 : NO.${chat.chat_idx}</span></p>
                    <h4 class="tit" data-tst_resoc_name="0"><a href="${cp}/app/expert/expertView.jsp?expert_idx=${chat.expert_idx}" class="expert_id">${expert_name}</a></h4>
                    <div class="detail_info">
                        <ul class="info_lst">
                            <li class="info_item">
                                <div class="item_tit"><b>&lt;일정&gt;</b></div>
                                <div class="item_desc">
                                    <div class="booked_date" data-tst_booking_date="0" id="reservation_time">
										날짜: <input type="date" id="service_day" style="margin-right:20px"> <!-- ex) 2024-04-20 -->
										시작시간: 	<select id="start_date" style="margin-right:10px">
												    <c:forEach var="hour" begin="${startTime}" end="${endTime}">
												        <option value="${hour}">${hour}시</option>
												    </c:forEach>
												</select>	
										종료시간: 	<select id="end_date">
												    <c:forEach var="hour" begin="${startTime}" end="${endTime}">
												        <option value="${hour}">${hour}시</option>
												    </c:forEach>
												</select>	
										<input type="button" value="확인" id="confirmBtn"/>										
									</div>
                                </div>
                            </li>
                            <li class="info_item">
                                <div class="item_tit">
                                    <span><b>&lt;분야&gt;</b></span>
                                </div>
                                <div class="item_desc" id="keyword_list">${expert.keyword_list}</div>
                                <input type="text" id="select_keyword" value="" placeholder="원하는 분야를 입력하세요" />
                            </li>
                            <li class="info_item">
                                <div class="item_tit"><b>&lt;요청&gt;</b></div>
                                <div class="item_desc" id="reservation_detail">
                                	<textarea style="resize:none;" cols=82 id="req" value=""></textarea>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="detail_info inform">
                        <ul class="info_lst">
                            <li class="info_item">
                                <div class="item_tit">
                                    <i class="fa-regular fa-comment-dots"></i>
                                    <span><b>everycare</b></span><span>에서 드리는 글</span>
                                </div>
                                <div class="item_desc">
                                    <i class="ico_arr"></i>
                                    <div class="box_info"><span>예약이 확정되었습니다 !<br>
                                     </span>
                                        <span>예약정보를 꼼꼼히 기입해주세요 감사합니다 :)</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="common_bottom_buttongroup_wrap">
                        <div class="common_bottom_buttongroup column2">
                            <a class="common_bottom_btn">
                                <i class="fa-regular fa-calendar"></i>
                                <span>결제하기</span>
                            </a>
                        </div>
                    </div>
                    <div id="map" style="width:600px; height:300px; margin:0 auto; margin-top:20px;"></div>
                </div>
            </div>
            <div class="confirm_item_body">
                <h3 class="tit_confirm_item">
                    <a href="">
                        <div class="text_confirm_item">
                            <span>결제금액</span>
                            <span class="btn_open_card">
                                <i class="fa-solid fa-chevron-down"></i>
                            </span>                    
                        </div>
                        <div class="hidden" id="cost"></div>
                    </a>
                </h3>
            </div>
            <div class="confirm_item_body">
                <h3 class="tit_confirm_item">
                    <a href="">
                        <div class="text_confirm_item">
                            <span>전문가 연락처</span>
                            <span class="btn_open_card">
                                <i class="fa-solid fa-chevron-down"></i>
                            </span>
                        </div>
                        <div class="hidden" id="tel_mobile">${expert_phone}</div>
                    </a>
                </h3>
            </div>
            <div class="confirm_item_body">
                <h3 class="tit_confirm_item">
                    <a href="">
                        <div class="text_confirm_item">
                            <span>예약자 정보</span>
                            <span class="btn_open_card">
                                <i class="fa-solid fa-chevron-down"></i>
                            </span>
                        </div>
                        <div class="hidden" id="user_name">${user.name}<br>${user.tel_mobile}<br>${user.email}</div>

                    </a>
                </h3>
            </div>

        </div>
        
    </div>
    <script> const cp = "${cp}"</script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23697895f1f73fcadc63e0aa3f1d0bf9&libraries=services"></script>
    <script>
    	
    	
        var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
			
			var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			marker.setMap(map);
    </script>
    <script>
	    document.addEventListener("DOMContentLoaded", function () {
	        const keywordList = "${expert.keyword_list}".split(","); // keyword_list를 쉼표로 구분하여 배열로 변환
	
	        document.getElementById("select_keyword").addEventListener("blur", function () {
	            const inputKeyword = this.value.trim(); // 입력된 키워드
	
	            // 입력된 키워드가 목록에 있는지 확인
	            const keywordExists = keywordList.includes(inputKeyword);
	
	            // 목록에 없는 경우 알림창 표시
	            if (!keywordExists && inputKeyword !== "") {
	                alert("목록에 있는 키워드를 입력하세요.");
	                this.value = ""; // 입력 필드 비우기
	            }
	        });
	    });
    	let cost = "${expert.cost}";
	    document.querySelector("#confirmBtn").addEventListener('click', function(){
	        let startTime = document.getElementById("start_date").value;
	        let endTime = document.getElementById("end_date").value;
			startTime = parseInt(startTime);
			endTime = parseInt(endTime);
			
	        if(startTime > endTime || startTime == endTime){
	        	alert("시작시간이 종료시간보다 크거나 같으면 안됩니다! 다시 입력해주세요");
	        }
	        else{
		        let hour_gap = endTime - startTime;
		        let pay = hour_gap * cost; 

		        document.getElementById("cost").innerText = "금액: " + pay + "원";	
		        alert("날짜가 입력되었습니다.")
	        }
			
	    });
    
        
        document.addEventListener("DOMContentLoaded", function () {
            var hiddenDivs = document.querySelectorAll('.hidden');
            hiddenDivs.forEach(function (div) {
                div.style.height = '0';
                div.style.overflow = 'hidden';
            });
    
            var tabLinks = document.querySelectorAll('.tit_confirm_item a');
            tabLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    event.preventDefault(); 
    
                    var parentDiv = event.target.closest('.confirm_item_body');
    
                    var hiddenDiv = parentDiv.querySelector('.hidden');
                    if (hiddenDiv.style.height === '0px') {
                        hiddenDiv.style.height = hiddenDiv.scrollHeight + 'px';
                    } else {
                        hiddenDiv.style.height = '0';
                    }
                });
            });
        });
        
		//결제 API 
         const IMP = window.IMP;
        IMP.init("imp16375222");

        const button = document.querySelector(".common_bottom_btn");
        const onClickPay = async () => {
        	
        	let serviceDay = document.getElementById("service_day").value;
        	let startTime = document.getElementById("start_date").value;
        	let endTime = document.getElementById("end_date").value;
        	let req = document.querySelector("#reservation_detail textarea").value;
			
        	let expert_name = "${expert_name}";
         	let payment_idx = "${chat.chat_idx}"; 
       		let keyword = document.getElementById("select_keyword");
       		let select_keyword = keyword.value;
       		let costText = document.getElementById("cost").innerText; // "금액: 65000원"과 같은 문자열
       		let pay = parseInt(costText.match(/\d+/)[0]); //65000만 뺴오기
	
	       	console.log(pay);
        	
            IMP.request_pay({
                    pg: "kakaopay",
                    pay_method: "card",
                    name: select_keyword,
                    amount: pay+"원",
                    merchant_uid: 100+payment_idx, //payment_idx로 받으면 됨

                },function(res) {

                    // 결제검증
                   $.ajax({
			            type: "POST",
			            url: cp+"/paymentInfo.pm",
			            data: {
			            	payment_idx: payment_idx,
			                serviceDay: serviceDay,
			                startTime: startTime,
			                endTime: endTime,
			                req: req,
			                pay: pay,
			                select_keyword: select_keyword,
			                expert_name: expert_name			                
			            }
                    }).done(function(data) {
                    	alert("결제가 완료되었습니다.")
                    	window.location.href = "/getpaymentlist.pm";
                    });
            });
        };

        button.addEventListener("click", onClickPay);

	//지도 API
	$(document).ready(function(){
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
	
	
</script>
</body>
</html>