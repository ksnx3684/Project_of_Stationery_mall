<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

    <script>
        let IMP = window.IMP; // 생략 가능
        IMP.init("imp73530197"); // 예: imp00000000

        // IMP.certification(param, callback) 호출
        IMP.certification({ // param
            m_redirect_url : "localhost/project/users/join", // 모바일환경에서 popup:false(기본값) 인 경우 필수, 예: https://www.myservice.com/payments/complete/mobile
            popup : false // PC환경에서는 popup 파라메터가 무시되고 항상 true 로 적용됨
        }, function (rsp) { // callback
            if (rsp.success) { // 인증 성공 시
                // jQuery로 HTTP 요청
                jQuery.ajax({
                url: "{서버의 인증 정보를 받는 endpoint}", // 예: https://www.myservice.com/certifications
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: { imp_uid: rsp.imp_uid }
                });
                alert("본인인증이 완료되었습니다")
            } else {
                alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
            }
        });
    </script>
    

</body>
</html>