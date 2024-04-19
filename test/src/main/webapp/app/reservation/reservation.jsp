<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약페이지</title>
    <script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${cp}/css/reservation.css">
</head>
<body>
    <div class="wrap">
        <div class="top_title">
            <a href="#" class="btn_back" title="이전 화면으로 이동">
                <i class="fa-solid fa-arrow-left"></i>
            </a>
            <h2>
                <a href="${cp}/index.jsp" class="title">
                    <i class="fa-solid fa-house"></i>
                    <span>everycare</span></a>
            </h2>
                <a href="#" class="btn_my">
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
                    <p class="reservation_number" id="reservation_id"><span data-tst_rserv_no="0">${reservation.reservation_id}</span></p>
                    <h4 class="tit" data-tst_resoc_name="0"><a href="전문가프로필창으로" class="expert_id">김사과</a></h4>
                    <div class="detail_info">
                        <ul class="info_lst">
                            <li class="info_item">
                                <div class="item_tit"><b>&lt;일정&gt;</b></div>
                                <div class="item_desc">
                                    <div class="booked_date" data-tst_booking_date="0" id="reservation_time">
										날짜: <input type="date" id="start_date" style="margin-right:20px">
										시작시간: <input type="time" id="available_time start_time"/>					
										종료시간: <input type="time" id="available_time end_time"/>											
									</div>
                                </div>
                            </li>
                            <li class="info_item">
                                <div class="item_tit">
                                    <span><b>&lt;분야&gt;</b></span>
                                </div>
                                <div class="item_desc" id="keyword_list">${expert.keyword_list}</div>
                            </li>
                            <li class="info_item">
                                <div class="item_tit"><b>&lt;요청&gt;</b></div>
                                <div class="item_desc" id="reservation_detail">
                                	<textarea style="resize:none;" cols=82></textarea>
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
                                        </span><span>예약정보를 꼼꼼히 기입해주세요 감사합니다 :)</span>
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
                        <div class="hidden" id="cost">금액: ${expert.cost}</div>
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
                        <div class="hidden" id="tel_mobile">${user.tel_mobile}</div>
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
                        <div class="hidden" id="user_name">${user.user_name}</div>
                    </a>
                </h3>
            </div>

        </div>
        
    </div>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23697895f1f73fcadc63e0aa3f1d0bf9"></script>
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
        // 페이지가 로드될 때 숨겨진 요소의 높이를 0으로 설정합니다.
        document.addEventListener("DOMContentLoaded", function () {
            var hiddenDivs = document.querySelectorAll('.hidden');
            hiddenDivs.forEach(function (div) {
                div.style.height = '0';
                div.style.overflow = 'hidden';
            });
    
            // 각 탭에 대한 클릭 이벤트를 설정합니다.
            var tabLinks = document.querySelectorAll('.tit_confirm_item a');
            tabLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    event.preventDefault(); // 링크의 기본 동작을 막습니다.
    
                    // 현재 클릭된 탭의 부모 요소를 찾습니다.
                    var parentDiv = event.target.closest('.confirm_item_body');
    
                    // 부모 요소에서 숨겨진 요소를 찾아 높이를 토글합니다.
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
            IMP.request_pay({
                    pg: "kakaopay",
                    pay_method: "card",
                    name: "가사도우미",
                    amount: "1원",
                    merchant_uid: "ORD20231030-000003", //상품번호(예약번호로 받을 것)
                    buyer_email : "apple@naver.com",
                    buyer_name : "김사과",
                    buyer_tel : "010-1111-1111",
                    buyer_addr : "경기도 수원시",
                },function(res) {

                    // 결제검증
                    $.ajax({
                        type : "POST",
                        url : "/verifyIamport/" + res.imp_uid
                    }).done(function(data) {

                        if(res.paid_amount == data.response.amount){
                            alert("결제 및 결제검증완료");

                            //결제 성공 시 비즈니스 로직

                        } else {
                            alert("결제 실패");
                        }
            
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