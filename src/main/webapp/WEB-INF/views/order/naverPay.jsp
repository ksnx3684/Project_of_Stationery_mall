<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버페이 결제</title>
</head>
<body>
    <button id="naverPay">결제</button>
    <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
    <script>
        var oPay = Naver.Pay.create({
            "mode" : "production", // development or production
            "clientId": "1HrPDBZC1JsqNKzAu9vn", // clientId
        });

        //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
        var naverPay = document.getElementById("naverPay");

        naverPay.addEventListener("click", function() {
            oPay.open({
            // "merchantUserKey": "1000001",
            "merchantPayKey": "1000001",
            "productName": "TEST 상품",
            "totalPayAmount": "1000",
            "taxScopeAmount": "1000",
            "taxExScopeAmount": "0",
            "returnUrl": "../order/orderComplete"
            });
        });
    </script>
    
</body>
</html>