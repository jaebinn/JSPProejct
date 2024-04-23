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
<script src="https://kit.fontawesome.com/1924b51539.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/paymentDetail.css">

</head>
<body>
	<div class="wrap">
		<div class="top_title">
			<a href="${cp}/getpaymentlist.pm?page="${param.page} class="btn_back" title="이전 화면으로 이동"> <i
				class="fa-solid fa-arrow-left"></i>
			</a>
			<h2>
				<a href="${cp}/index.jsp" class="title"> <i
					class="fa-solid fa-house"></i> <span>everycare</span></a>
			</h2>
			<a href="${cp}/userinfo.us" class="btn_my"> <span title="내 예약">MY</span>
			</a>
		</div>
		<div class="page_inner">
			<div class="page_confirm">결제상세정보</div>
			<div class="confirm_item_top">
				<h3 class="confirm_title">
					<i class="fa-regular fa-clock"></i> <span class="title_text"
						data-tst_booking_state="0">결제완료</span>
				</h3>
				<div class="confirm_top_content">
					<h4 class="tit" data-tst_resoc_name="0">
						전문가 : <a href="${cp}/expertview.ep?expert_idx=${payment.expert_idx}" class="expert_id">${payment.expert_name}</a>
					</h4>
					<div class="detail_info">
						<ul class="info_lst">
							<li class="info_item">
								<div class="item_tit">
									<b>&lt;기간&gt;</b>
								</div>
								<div class="item_desc">
									<span class="booked_date" data-tst_booking_date="0"id="reservation_time">
										${payment.service_day} : ${payment.start_date}시 ~ ${payment.end_date}시 
									</span>
								</div>
							</li>
							<li class="info_item">
								<div class="item_tit">
									<b>&lt;분야&gt;</b>
								</div>
								<div class="item_desc" id="payment_req">
									<p>${payment.keyword}</p>
								</div>
							</li>
							<li class="info_item">
								<div class="item_tit">
									<b>&lt;요구사항&gt;</b>
								</div>
								<div class="item_desc" id="payment_req">
									<p>${payment.req}</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="confirm_item_body" style="margin-top:20px">
						<h3 class="tit_confirm_item">
							<a href="">
								<div class="text_confirm_item">
									<span>결제금액</span> <span class="btn_open_card"> <i
										class="fa-solid fa-chevron-down"></i>
									</span>
								</div>
								<div class="hidden" id="cost">금액: ${payment.pay}원</div>
							</a>
						</h3>
					</div>
					<div class="confirm_item_body">
						<h3 class="tit_confirm_item">
							<a href="">
								<div class="text_confirm_item">
									<span>전문가 연락처</span> <span class="btn_open_card"> <i
										class="fa-solid fa-chevron-down"></i>
									</span>
								</div>
								<div class="hidden" id="tel_mobile">${payment.tel_mobile}</div>
							</a>
						</h3>
					</div>
					<div class="detail_info inform">
						<ul class="info_lst">
							<li class="info_item">
								<div class="item_tit">
									<i class="fa-regular fa-comment-dots"></i> <span><b>everycare</b></span><span>에서
										드리는 글</span>
								</div>
								<div class="item_desc">
									<i class="ico_arr"></i>
									<div class="box_info">
										<span>결제가 완료되었습니다 !<br></span>
										<span>만족하셨다면 내가 고용한 전문가한테 리뷰한번 달아주시는게 어떨까요~?<br></span>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="common_bottom_buttongroup_wrap">
						<div class="common_bottom_buttongroup column2">
							<a class="common_bottom_btn" href="${cp}/expertview.ep?expert_idx=${payment.expert_idx}"><span>전문가 리뷰 쓰러 가기</span></a>
						</div>
						<div class="common_bottom_buttongroup column2">
							<a class="common_bottom_btn" href="${cp}/getpaymentlist.pm?page="${param.page}><span>목록으로 돌아가기</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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