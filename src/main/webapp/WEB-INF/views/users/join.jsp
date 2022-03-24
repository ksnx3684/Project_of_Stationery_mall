<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <div id = total>
    <form class="frm" action="./join" method="post" id="frm" enctype="multipart/form-data">
        <fieldset>
            <legend>ID</legend>
            <input type="text" placeholder="ID" name="id" id="id">
            <div id="idResult"></div>
        </fieldset>
        <fieldset>
            <legend>비밀번호</legend>
            <input type="password" placeholder="8글자 이상 12글자 이하" name="pw" id="pw">
            <div id="pwResult"></div>
        </fieldset>
        <fieldset>
            <legend>비밀번호 확인</legend>
            <input type="password" placeholder="8글자 이상 12글자 이하" name="pw2" id="pw2">
            <div id="pwResultCheck"></div>
        </fieldset>
        <fieldset>
            <legend>이름</legend>
            <input type="text" placeholder="이름" name="name" id="name">
        </fieldset>
        <fieldset>
            <legend>전화번호</legend>
            <input type="text" placeholder="전화번호" name="phone" id="phone">
        </fieldset>
        <fieldset>
            <legend>이메일</legend>
            <input type="text" placeholder="이메일 아이디" name="email_id" id="email_id">@
            <input type="text" placeholder="이메일 도메인" name="email_domain" id="email_domain" readonly="readonly">
            <select class="select" name="domain" id="domain">
                <option value="">- 선택 -</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="nate.com">nate.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hotmail.com">hotmail.com</option>
                <option value="1">직접입력</option>
            </select>
            <input type="hidden" name="email" id="email" readonly>
        </fieldset>
        <fieldset>
            <legend>성별</legend>
            <select name="gender" id="gender">
                <option value="0">- 선택 -</option>
                <option value="1">남자</option>
                <option value="2">여자</option>
            </select>
        </fieldset>
        <fieldset>
            <legend>주소</legend>
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
        </fieldset>
        <fieldset>
            <legend>배송연락처</legend>
            <input type="text" placeholder="배송연락처" name="addressPhone" id="addressPhone">
        </fieldset>
        <fieldset>
            <legend>프로필사진(최대10MB)</legend>
            <input type="file" name="multipartFile" id="multipartFile">
        </fieldset>
        <fieldset>
            <button type="button" id="btn">가입</button>
        </fieldset>
    </form>
    </div>
    <script type="text/javascript" src="../resources/js/join.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
</body>
</html>