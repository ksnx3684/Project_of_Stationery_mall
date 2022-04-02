<%@page import="java.net.URLDecoder"%>
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

            if(select == 0){
                defaultAddress.style.display = 'block';
                newAddress.style.display = 'none';
            } else {
                defaultAddress.style.display = 'none';
                newAddress.style.display = 'block';
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
                <td class="tg-af47 name"><input type="hidden" name="name" value="${dto.productDTO.name}">${dto.productDTO.name}</td>
                <td class="tg-af47 con count"><input type="hidden" name="productCount" value="${dto.productCount}">${dto.productCount}</td>
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
	
        <h1 class="totalPrice">최종 결제금액 : </h1>
        <br>
        <h1>배송주소</h1>
        기본배송지<input type="radio" name="col" onclick="displayView('0')" value="defaultAddress" checked>
        새로입력<input type="radio" name="col" onclick="displayView('1')" value="newAddress">
        <br>
        <legend>이름</legend><input type="text" value="${myinfo.name}">
        <br>
        <legend>전화번호</legend><input type="text" value="${myinfo.phone}">
        <br>
        배송주소
            <div id="defaultAddress">
                <input type="text" name="addressDetail" id="addressDetail" value="${myinfo.addressDetail}" readonly> 
            </div>
            <div id="newAddress" style="display:none">
                <input type="text" placeholder="배송지명" name="addressName" id="addressName"><br>
                <input type="text" name="postalCode" id="postalCode" placeholder="우편번호" readonly>
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" name="address" id="address" placeholder="주소" readonly><br>
                <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
                <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
                <input type="hidden" name="addressDetail" id="addressDetail" readonly>
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
        <br>
        
        <h1>결제수단</h1>
        카드<input type="radio" id="card" value="card" checked>
        무통장입금<input type="radio" id="cash" value="cash">
        
        <div><input type="checkbox"> 동의합니다. (전자상거래법 제 8조 제2항)</div>
        <button>결제하기</button>
    </div>
    
    
    <script type="text/javascript" src="../resources/js/cart/order.js"></script>
</body>
</html>