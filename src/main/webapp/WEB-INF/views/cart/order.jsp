<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>주문</title>

    <!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">
    <link rel="stylesheet" href="../resources/css/cart/order.css">

</head>
<body>
    <!-- ##### Search Content ##### -->
	<c:import url="../template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="../template/new_header.jsp"></c:import>

			<!-- Order table Area Start -->
			<div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <form id="frm" action="./order" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <div class="cart-title mt-50">
                                    <h2>Order</h2>
                                </div>
                                <div class="cart-table clearfix">
                                    <table class="table table-responsive">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>상품명</th>
                                                <th>갯수</th>
                                                <th>가격</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${order}" var="dto" varStatus="status">
                                                <tr class="contents">
                                                    <input type="hidden" name="cartNum" value="${dto.cartNum}">
                                                    <input type="hidden" name="productNum" value="${dto.productNum}">
                                                    <td class="cart_product_img"><input type="hidden" name="name" value="${dto.productDTO.name}">
                                                        <c:if test="${dto.productDTO.thumbnail ne null}">
                                                            <a href="../product/detail?productNum=${dto.productNum}"><img class="image" src="../resources/upload/product/${dto.productDTO.thumbnail}" alt="Product"></a>
                                                        </c:if>
                                                    </td>
                                                    <td class="cart_product_desc">
                                                        <h5>${dto.productDTO.name}</h5>
                                                        <c:forEach items="${orderoption}" var="op" begin="${status.index}" end="${status.index}">
                                                            <c:choose>
                                                                <c:when test="${op ne ''}">
                                                                    ( 옵션 : ${op} ) <input type="hidden" name="optionContents" value="${op}">   
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="hidden" name="optionContents" value="">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="count">
                                                        <input type="hidden" name="count" value="${dto.productCount}">
                                                        <span>${dto.productCount}</span>
                                                    </td>
                                                    <td class="price">
                                                        <input type="hidden" name="price" value="${dto.productDTO.price}">
                                                        <span>${dto.productDTO.price}</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>                                   
                                        </tbody>
                                    </table>
                                    <input type="hidden" name="id" id="id" value="${myinfo.id}" readonly>
                                    <input type="hidden" name="orderCheck" id="orderCheck" value="0" readonly>
                                    <input type="hidden" name="payCheck" id="payCheck" value="0" readonly>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="cart-summary">
                                    <h5>Order Total</h5>
                                    <ul class="summary-table">
                                        <li><span>delivery:</span> <span class="deliver"></span></li>
                                        <li>
                                            <span>total:</span>
                                            <span>
                                                <c:forEach items="${cartlist}">
                                                    <span class="totalPrice"></span>
                                                </c:forEach>
                                                <span class="totalPrice"></span>&nbsp;원
                                            </span>
                                        </li>
                                    </ul>
                                    <div class="cart-btn">
                                        <a href="./cartlist" class="btn amado-btn w-100" id="cart" style="color: white;">
                                            <span class="site-btn clear-btn">카트로 돌아가기</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="cart-summary" style="margin-top: 30px;">
                                    <h5>배송주소</h5>
                                    <ul class="summary-table">
                                        <label><input type="radio" name="col" onclick="displayView('0')" value="defaultAddress" checked>&nbsp;기본배송지&nbsp;</label>
                                        <label><input type="radio" name="col" onclick="displayView('1')" value="newAddress">&nbsp;새로입력</label> 
                                    </ul>
                                    <div class="addressplace">
                                        <label>이름</label><br><input type="text" name="addressName" id="addressName" value="${myinfo.name}">
                                        <br><br>
                                        <label>전화번호</label><br><input type="text" name="addressPhone" id="addressPhone" value="${myinfo.phone}">
                                        <br><br>
                                        <label>배송주소</label><br>
                                            <!-- 기본배송지 -->
                                            <div id="defaultAddress">
                                                <input type="text" name="addressPostal" id="postalCode1" value="${myinfo.postalCode}" readonly>
                                                <br>
                                                <input type="text" name="addressDetail" id="addressDetail1" value="${myinfo.addressDetail}" style="width:300px" readonly> 
                                            </div>
                                            <!-- 기본배송지 -->
                                            <!-- 새로입력 -->
                                            <div id="newAddress" style="display:none">
                                                <input type="text" name="addressPostal" id="postalCode" placeholder="우편번호" readonly disabled>
                                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                                <input type="text" name="address" id="address" placeholder="주소" style="width:300px" readonly disabled><br>
                                                <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" style="width:300px" disabled>
                                                <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" style="width:300px" disabled>
                                                <input type="hidden" name="addressDetail" id="addressDetail2" readonly style="width:300px" disabled>
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
                                        <label>배송요청메모</label><br><div class="memo">
                                            <input type="text" name="memo" id="memo" placeholder="30자 이내" style="width:300px">
                                        </div>
                                    </div>
                                </div>
                                <div class="cart-summary" style="margin-top: 30px;">
                                    <h5>결제수단</h5>
                                    <ul class="summary-table">
                                        <label><input type="radio" name="payment" id="kakaobtn" onclick="payDisplayView('0')" value="kakao" checked>&nbsp;<img src="../resources/img/payment_icon_yellow_medium.png" style="width:60px; height:25px">&nbsp;카카오페이</label><br><br>
                                        <label><input type="radio" name="payment" id="naverbtn" onclick="payDisplayView('1')" value="naver">&nbsp;<img src="../resources/img/naverpay.png" style="width:74px; height:18px">&nbsp;네이버페이</label><br><br>
                                        <label><input type="radio" name="payment" id="cashbtn" onclick="payDisplayView('2')" value="cash">&nbsp;무통장입금</label>
                                        
                                        <div id="kakaopay">
                                            <input type="hidden" name="cardName" id="kakao" value="카카오페이">
                                            <input type="hidden" name="cardNum" id="cardNum1" value="0">
                                            <input type="hidden" name="cardExp" id="cardExp1" value="2022/01/01">
                                        </div>
                                        <div id="naverpay" style="display:none">
                                            <input type="hidden" name="cardName" id="kakao" value="네이버페이" disabled>
                                            <input type="hidden" name="cardNum" id="cardNum2" value="1" disabled>
                                            <input type="hidden" name="cardExp" id="cardExp2" value="2022/01/01" disabled>
                                        </div>
                                        <div id="cashpay" style="display:none">
                                            <input type="hidden" name="cardName" id="cash" value="무통장입금" disabled>
                                            <input type="hidden" name="cardNum" id="cardNum3" value="2" disabled>
                                            <input type="hidden" name="cardExp" id="cardExp3" value="2022/01/01" disabled>
                                            <div>입금계좌 : 신한은행 이병훈 111-111111-11-111</div>
                                        </div>
                                        <br>
                                        <div>전자상거래법 제 8조 제2항에 동의하고 결제합니다.</div>
                                        <br>
                                        <div id="kakaoPayConfirm">
                                            <input type="hidden" name="payRequest" id="payRequest1" value="kakao">
                                            <!-- <button id="kakaoPay" class="btn btn-primary">결제하기</button> -->
                                            <div class="cart-btn">
                                                <a id="kakaoPay" class="btn amado-btn w-100" style="color: white;">
                                                    <span class="site-btn clear-btn">주문하기</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div id="naverPayConfirm" style="display:none">
                                            <input type="hidden" name="payRequest" id="payRequest2" value="naver" disabled>
                                            <!-- <button id="naverPay" class="btn btn-primary">결제하기</button> -->
                                            <div class="cart-btn">
                                                <a id="naverPay" class="btn amado-btn w-100" style="color: white;">
                                                    <span class="site-btn clear-btn">주문하기</span>
                                                </a>
                                            </div>
                                        </div>
                                
                                        <div id="cashPayConfirm" style="display:none">
                                            <input type="hidden" name="payRequest" id="payRequest3" value="cash" disabled>
                                            <!-- <button id="cashPay" class="btn btn-primary">결제하기</button> -->
                                            <div class="cart-btn">
                                                <a id="cashPay" class="btn amado-btn w-100" style="color: white;">
                                                    <span class="site-btn clear-btn">주문하기</span>
                                                </a>
                                            </div>
                                        </div>
                                    </ul>
                                    <!-- <div class="cart-btn">
                                        <a class="btn amado-btn w-100" id="selectOrder_btn2" style="color: white;">
                                            <span class="site-btn clear-btn">주문하기</span>
                                        </a>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
			<!-- Order table Area End -->

	</div>
	<!-- ##### Main Content Wrapper End ##### -->


	<!-- ##### Footer Content ##### -->
	<c:import url="../template/new_footer.jsp"></c:import>


	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="../resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="../resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="../resources/js/active.js"></script>

    
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

    <script>
        function payDisplayView(select){
            let kakaopay = document.getElementById("kakaopay"); // 카카오페이
            let kakaoPayConfirm = document.getElementById("kakaoPayConfirm") // 카카오페이 버튼
            let naverpay = document.getElementById("naverpay"); // 네이버페이
            let naverPayConfirm = document.getElementById("naverPayConfirm"); // 네이버페이 버튼
            let cashpay = document.getElementById("cashpay"); // 무통장입금
            let cahsPayConfirm = document.getElementById("cashPayConfirm"); // 무통장입금 버튼

            if(select == 0){ // 카카오페이
                kakaopay.style.display = 'block';
                kakaoPayConfirm.style.display = 'block';
                naverpay.style.display = 'none';
                naverPayConfirm.style.display = 'none';
                cashpay.style.display = 'none';
                cashPayConfirm.style.display = 'none';
                $('#kakao').attr('disabled', false); // 카카오페이 cardName 활성화
                $('#cardNum1').attr('disabled', false); // 카카오페이 cardNum1 활성화
                $('#cardExp1').attr('disabled', false); // 카카오페이 cardExp1 활성화
                $('#payRequest1').attr('disabled', false); // 카카오페이 요청 활성화
                $('#naver').attr('disabled', true); // 네이버페이 cardName 비활성
                $('#cardNum2').attr('disabled', true); // 네이버페이 cardNum2 비활성
                $('#cardExp2').attr('disabled', true); // 네이버페이 cardExp2 비활성
                $('#payRequest2').attr('disabled', true); // 네이버페이 요청 비활성
                $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                $('#cardNum3').attr('disabled', true); // 무통장입금 cardNum3 비활성
                $('#cardExp3').attr('disabled', true); // 무통장입금 cardExp3 비활성
                $('#payRequest3').attr('disabled', true); // 무통장입금 요청 비활성

            } else if(select == 1) { // 네이버페이
                kakaopay.style.display = 'none';
                kakaoPayConfirm.style.display = 'none';
                naverpay.style.display = 'block';
                naverPayConfirm.style.display = 'block';
                cashpay.style.display = 'none';
                cashPayConfirm.style.display = 'none';
                $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                $('#naver').attr('disabled', false); // 네이버페이 cardName 활성화
                $('#cardNum2').attr('disabled', false); // 네이버페이 cardNum2 활성화
                $('#cardExp2').attr('disabled', false); // 네이버페이 cardExp2 활성화
                $('#payRequest2').attr('disabled', false); // 네이버페이 요청 활성화
                $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                $('#cardNum3').attr('disabled', true); // 무통장입금 cardNum3 비활성
                $('#cardExp3').attr('disabled', true); // 무통장입금 cardExp3 비활성
                $('#payRequest3').attr('disabled', true); // 무통장입금 요청 비활성

            } else { // 무통장입금
                kakaopay.style.display = 'none';
                kakaoPayConfirm.style.display = 'none';
                naverpay.style.display = 'none';
                naverPayConfirm.style.display = 'none';
                cashpay.style.display = 'block';
                cashPayConfirm.style.display = 'block';
                $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                $('#naver').attr('disabled', true); // 네이버페이 cardName 비활성
                $('#cardNum2').attr('disabled', true); // 네이버페이 cardNum2 비활성
                $('#cardExp2').attr('disabled', true); // 네이버페이 cardExp2 비활성
                $('#payRequest2').attr('disabled', true); // 네이버페이 요청 비활성
                $('#cash').attr('disabled', false); // 무통장입금 cardName 활성화
                $('#cardNum3').attr('disabled', false); // 무통장입금 cardNum3 활성화
                $('#cardExp3').attr('disabled', false); // 무통장입금 cardExp3 활성화
                $('#payRequest3').attr('disabled', false); // 무통장입금 요청 활성화               
            }
        }
    </script>
    
    <script type="text/javascript" src="../resources/js/cart/order.js"></script>
</body>
</html>