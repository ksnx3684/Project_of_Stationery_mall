<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 결제</title>
</head>
<body>
    <!-- <form action="./kakaoPay" method="post">
        <button style="border:none"><img src="../resources/img/payment_icon_yellow_medium.png"></button>
        <div>결제진행을 위해 버튼을 클릭해주세요!</div>
    </form> -->

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

    <script>
        var IMP = window.IMP; // 생략 가능
        IMP.init("imp73530197"); // 가맹점 식별 코드
        IMP.request_pay({ // param
          pg: "kakaopay.TC0ONETIME",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000014", // !!!!! 테스트 결제 진행 완료 시 매번 숫자를 변경해줘야함 !!!!!
          name: "TEST 상품",
          amount: 25000,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              var msg = "결제가 완료되었습니다";
              location.href="./orderComplete";
          } else {
              var msg = "결제에 실패하였습니다"
              rsp.error_msg;
          }
      });
    </script>

</body>
</html>