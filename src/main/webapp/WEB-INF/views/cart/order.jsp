<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
</head>
<link rel="stylesheet" href="../resources/css/order.css">
<body>
    <form action="./order" method="post" enctype="multipart/form-data">
    <script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>

    <!-- <script>
        const totalPrice = document.getElementsByClassName("totalPrice");
        const count = document.querySelectorAll(".count");
        const price = document.querySelectorAll(".price");
        const total = new Array;
        let totaling = 0;

        $(document).load(function(){
            for(let i = 0; i < count.length; i++){
                console.log("test");
                let counting = Number(count[i].textContent);
                let pricing = Number(price[i].textContent);
                total[i] = counting * pricing
                console.log(counting);
                console.log(pricing);
                console.log("-----")
                console.log(total[i]);

                totaling += total[i];
                console.log(totaling);
            }

            $('.totalPrice').append($(totaling));
        })

    </script> -->


    
    <script>
        function displayView(select){
            let defaultAddress = document.getElementById("defaultAddress"); // 기본배송지
            let newAddress = document.getElementById("newAddress"); // 새로입력

            if(select == 0){ // 기본배송지
                defaultAddress.style.display = 'block';
                newAddress.style.display = 'none';
                $('#addressDetail1').attr('disabled', false); // 기본배송지의 최종주소 활성화
                $('#postalCode1').attr('disabled', false); // 기본배송지의 우편번호 활성화
                $('#postalCode').attr('disabled', true); // 새로입력의 우편번호 비활성
                $('#address').attr('disabled', true); // 새로입력의 주소 비활성
                $('#detailAddress').attr('disabled', true); // 새로입력의 상세주소 비활성
                $('#extraAddress').attr('disabled', true); // 새로입력의 참고항목 비활성
                $('#addressDetail2').attr('disabled', true); // 새로입력의 최종주소 비활성
                
            } else { // 새로입력
                defaultAddress.style.display = 'none';
                newAddress.style.display = 'block';
                $('#addressDetail1').attr('disabled', true); // 기본배송지의 최종주소 비활성
                $('#postalCode1').attr('disabled', true); // 기본배송지의 우편번호 비활성
                $('#postalCode').attr('disabled', false); // 새로입력의 우편번호 활성화
                $('#address').attr('disabled', false); // 새로입력의 주소 활성화
                $('#detailAddress').attr('disabled', false); // 새로입력의 상세주소 활성화
                $('#extraAddress').attr('disabled', false); // 새로입력의 참고항목 활성화
                $('#addressDetail2').attr('disabled', false); // 새로입력의 최종주소 활성화
            }
        }
    </script>
	<!-- <c:forEach items="${order}" var="dto">
		<h1>상품명 : ${dto.productDTO.name}</h1>
		<h1>상품갯수 : ${dto.productCount}</h1>
		<h1>가격 : ${dto.productDTO.price}</h1>
	</c:forEach> -->

    <div class="mainStreet">
        <h1>주문 작성</h1>
        <table class="tg" style="table-layout: fixed; width: 800px">
            <colgroup>
            <col style="width: 550px">
            <col style="width: 100px">
            <col style="width: 150px">
            </colgroup>
            <thead>
            <tr>
                <th class="tg-daby">상품명</th>
                <th class="tg-daby">갯수</th>
                <th class="tg-daby">가격</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order}" var="dto">
                <tr class="contents">
                <input type="hidden" name="productNum" value="${dto.productNum}">
                <td class="tg-af47 name"><input type="hidden" name="name" value="${dto.productDTO.name}">${dto.productDTO.name}</td>
                <td class="tg-af47 con count"><input type="hidden" name="count" value="${dto.productCount}">${dto.productCount}</td>
                <td class="tg-af47 con price"><input type="hidden" name="price" value="${dto.productDTO.price}">${dto.productDTO.price}</td>
                </tr>
            </c:forEach>
            <tr>
                <td class="tg-10pf"></td>
                <td class="tg-10pf"></td>
                <td class="tg-10pf"></td>
            </tr>
            </tbody>
        </table>
        
        <input type="hidden" name="id" id="id" value="${myinfo.id}" readonly>
        <input type="hidden" name="orderCheck" id="orderCheck" value="0" readonly>
        <input type="hidden" name="payCheck" id="payCheck" value="0" readonly>

        <h1 class="totalPrice">최종 결제금액 : </h1>
        <br>
        <h1>배송주소</h1>
        기본배송지<input type="radio" name="col" onclick="displayView('0')" value="defaultAddress" checked>
        새로입력<input type="radio" name="col" onclick="displayView('1')" value="newAddress">
        <br>
        <legend>이름</legend><input type="text" name="addressName" id="addressName" value="${myinfo.name}">
        <br>
        <legend>전화번호</legend><input type="text" name="addressPhone" id="addressPhone" value="${myinfo.phone}">
        <br>
        배송주소
            <!-- 기본배송지 -->
            <div id="defaultAddress">
                <input type="text" name="addressPostal" id="postalCode1" value="${myinfo.postalCode}" readonly>
                <br>
                <input type="text" name="addressDetail" id="addressDetail1" value="${myinfo.addressDetail}" readonly> 
            </div>
            <!-- 기본배송지 -->
            <!-- 새로입력 -->
            <div id="newAddress" style="display:none">
                <input type="text" name="addressPostal" id="postalCode" placeholder="우편번호" readonly disabled>
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" name="address" id="address" placeholder="주소" readonly disabled><br>
                <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" disabled>
                <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" disabled>
                <input type="hidden" name="addressDetail" id="addressDetail2" readonly disabled>
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var addr = ''; // 주소 변수
                                var extraAddr = ''; // 참고항목 변수

                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                    addr = data.roadAddress;
                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                    addr = data.jibunAddress;
                                }

                                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                if(data.userSelectedType === 'R'){
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraAddr !== ''){
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    document.getElementById("extraAddress").value = extraAddr;
                                
                                } else {
                                    document.getElementById("extraAddress").value = '';
                                }
                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('postalCode').value = data.zonecode;
                                document.getElementById("address").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("detailAddress").focus();
                            }
                        }).open();
                    }
                </script>
            </div>
            <!-- 새로입력 -->
        <br>
        배송요청메모<div class="memo">
            <input type="text" name="memo" id="memo" placeholder="30자 이내">
        </div>

        <script>
            function payDisplayView(select){
                let kakaopay = document.getElementById("kakaopay"); // 카카오페이
                let kakaoPayConfirm = document.getElementById("kakaoPayConfirm") // 카카오페이 버튼
                let cashpay = document.getElementById("cashpay"); // 무통장입금
                let cahsPayConfirm = document.getElementById("cashPayConfirm"); // 무통장입금 버튼
    
                if(select == 0){ // 카카오페이
                    kakaopay.style.display = 'block';
                    kakaoPayConfirm.style.display = 'block';
                    cashpay.style.display = 'none';
                    cashPayConfirm.style.display = 'none';
                    $('#kakao').attr('disabled', false); // 카카오페이 cardName 활성화
                    $('#cardNum1').attr('disabled', false); // 카카오페이 cardNum1 활성화
                    $('#cardExp1').attr('disabled', false); // 카카오페이 cardExp1 활성화
                    $('#payRequest1').attr('disabled', false); // 카카오페이 요청 활성화
                    $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                    $('#cardNum2').attr('disabled', true); // 무통장입금 cardNum2 비활성
                    $('#cardExp2').attr('disabled', true); // 무통장입금 cardExp2 비활성
                    $('#payRequest2').attr('disabled', true); // 무통장입금 요청 비활성

                } else { // 무통장입금
                    kakaopay.style.display = 'none';
                    kakaoPayConfirm.style.display = 'none';
                    cashpay.style.display = 'block';
                    cashPayConfirm.style.display = 'block';
                    $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                    $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                    $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                    $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                    $('#cash').attr('disabled', false); // 무통장입금 cardName 활성화
                    $('#cardNum2').attr('disabled', false); // 무통장입금 cardNum2 활성화
                    $('#cardExp2').attr('disabled', false); // 무통장입금 cardExp2 활성화
                    $('#payRequest2').attr('disabled', false); // 무통장입금 요청 활성화               
                }
            }
            // function lawCheck(){
            //     let lawChecking = $("input:checkbox[id='law']").is('checked');
            //     if(!lawChecking){
            //         alert("전자상거래법에 동의해주세요");
            //         return false;
            //     }
            // }
        </script>
        <h1>결제수단</h1>
        카카오페이<input type="radio" name="payment" id="kakaobtn" onclick="payDisplayView('0')" value="kakao" checked>
        무통장입금<input type="radio" name="payment" id="cashbtn" onclick="payDisplayView('1')" value="cash">

        <div id="kakaopay">
            <input type="hidden" name="cardName" id="kakao" value="카카오페이">
            <input type="hidden" name="cardNum" id="cardNum1" value="0">
            <input type="hidden" name="cardExp" id="cardExp1" value="2022/01/01">
        </div>
        <div id="cashpay" style="display:none">
            <input type="hidden" name="cardName" id="cash" value="무통장입금" disabled>
            <input type="hidden" name="cardNum" id="cardNum2" value="1" disabled>
            <input type="hidden" name="cardExp" id="cardExp2" value="2022/01/01" disabled>
            <div>입금계좌 : 신한은행 이병훈 111-111111-11-111</div>
        </div>
        <br>
        <!-- <div><input type="checkbox" id="law" value="0"> 동의합니다. (전자상거래법 제 8조 제2항)</div> -->
        <div>전자상거래법 제 8조 제2항에 동의하고 결제합니다.</div>
        <br>
        <div id="kakaoPayConfirm">
            <input type="hidden" name="payRequest" id="payRequest1" value="kakao">
            <img src="../resources/img/payment_icon_yellow_medium.png">
            <button id="finalPay">결제하기</button>
        </div>

        <div id="cashPayConfirm" style="display:none">
            <input type="hidden" name="payRequest" id="payRequest2" value="cash" disabled>
            <button id="finalPay">결제하기</button>
        </div>
    </div>
    </form>
    
    <script type="text/javascript" src="../resources/js/cart/order.js"></script>
</body>
</html>