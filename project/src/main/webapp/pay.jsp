<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <button>Pay now!</button>
	

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	const IMP = window.IMP;
	IMP.init("imp16375222");
	const button = document.querySelector("button");
	const onClickPay = async () => {
    IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        name: "가사도우미",
        amount: "60000원",
        merchant_uid: "ORD20231030-000001",
        /* buyer_email: "apple@naver.com",
        buyer_name: "구매자이름",
        buyer_tel: "010-1234-5678",
        buyer_addr: "서울특별시 강남구 역삼동",
        buyer_postcode: "123-456", */
    });
};
	button.addEventListener("click", onClickPay);
</script>
</body>
</html>