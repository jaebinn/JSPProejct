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
                    <span class="title_text" data-tst_booking_state="0">예약완료</span>
                </h3>
                <div class="confirm_top_content">
                    <p class="reservation_number" id="reservation_id"><span data-tst_rserv_no="0">${reservation.reservation_id}</span></p>
                    <h4 class="tit" data-tst_resoc_name="0"><a href="전문가프로필창으로" class="expert_id">김사과</a></h4>
                    <div class="detail_info">
                        <ul class="info_lst">
                            <li class="info_item">
                                <div class="item_tit"><b>&lt;일정&gt;</b></div>
                                <div class="item_desc">
                                    <span class="booked_date" data-tst_booking_date="0" id="reservation_time">2023. 12. 23(토) 오후 2:00</span>
                                </div>
                            </li>
                            <li class="info_item">
                                <div class="item_tit">
                                    <span><b>&lt;분야&gt;</b></span>
                                </div>
                                <div class="item_desc" id="keyword_list">가사도우미</div>
                            </li>
                            <li class="info_item">
                                <div class="item_tit"><b>&lt;요청&gt;</b></div>
                                <div class="item_desc" id="reservation_detail">집안일 깨끗이 부탁드립니다!</div>
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
                                        </span><span>혹시라도 변동사항이 있을 경우, 꼭 미리 연락 부탁드려요~ 감사합니다 :)</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="common_bottom_buttongroup_wrap">
                        <div class="common_bottom_buttongroup column2">
                            <a class="common_bottom_btn">
                                <i class="fa-regular fa-calendar"></i>
                                <span>다시 예약하기</span>
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
    </script>
</body>
</html>