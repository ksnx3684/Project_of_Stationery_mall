<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
    <link rel="stylesheet" href="../resources/css/join.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body style="background-image: url('../resources/img/joanna-kosinska-RE-8WswW95o-unsplash.jpg')">
    <script type="text/javascript">
        function idChecker(){
            let idValue = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
            $.ajax({
                url: "./idChecker", //Controller에서 인식할 주소
                type: "post", //POST 방식으로 전달
                data: {id:idValue},

                success:function(cnt){ // UsersDAO에서 return한 cnt를 매개변수로 받는다
                    if(cnt != 1) { // cnt가 1이 아닐 경우 사용 가능 출력
                        $('.idResult').css("display", "none");
                        $('.id_ok').css("display", "inline-block");
                        $('.id_no').css("display", "none");
                        if($('#id').val() == ""){ // 아이디 입력칸이 비어 있다면 필수입력사항 멘트 출력
                            $('.idResult').css("display", "inline-block");
                            $('.id_ok').css("display", "none");
                            $('.id_no').css("display", "none");
                        }
                    } else { // cnt가 1일 경우 사용 불가 출력
                        $('.idResult').css("display", "none");
                        $('.id_no').css("display", "inline-block");
                        $('.id_ok').css("display", "none");
                    }
                    console.log("처리 성공");
                },
                error:function(){
                    alert("에러발생");
                }
            });
            
            
        };
    </script>

    <div id = total>
        <div class="container" style="width:600px; background-color: white;">
            <h2 style="text-align: center;">회원가입</h2>
            <form class="frm" action="./join" method="post" id="frm" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="id">ID</label>
                    <span class="idResult">필수 입력사항입니다</span>
                    <span class="id_ok">사용 가능한 아이디입니다</span>
                    <span class="id_no">이미 사용 중인 아이디입니다</span>
                    <input type="text" class="form-control" placeholder="ID" name="id" id="id" required oninput="idChecker()">
                </div>
                <div class="form-group">
                    <label for="pwd">비밀번호</label>
                    <span id="pwResult1"></span>
                    <span id="pwResult2"></span>
                    <input type="password" class="form-control" placeholder="8글자 이상 16글자 이하" name="pw" id="pw">
                </div>
                <div class="form-group">
                    <label for="pwd">비밀번호 확인</label>
                    <span id="pwResultCheck1"></span>
                    <span id="pwResultCheck2"></span>
                    <input type="password" class="form-control" placeholder="8글자 이상 16글자 이하" name="pw2" id="pw2">
                </div>
                <div class="form-group">
                    <label>이름</label>
                    <input type="text" class="form-control" placeholder="이름" name="name" id="name">
                </div>
                <div class="form-group">
                    <label>전화번호</label>
                    <input type="text" class="form-control" placeholder="전화번호" name="phone" id="phone">
                </div>
                <div class="form-group">
                    <label>이메일</label><br>
                    <input type="text" placeholder="이메일 아이디" name="email_id" id="email_id">&nbsp;@&nbsp;
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
                </div>
                <div class="form-group">
                    <label>성별</label><br>
                    <select name="gender" id="gender">
                        <option value="0">- 선택 -</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>주소</label><br>
                    <input type="text" placeholder="배송지명" name="addressName" id="addressName"><br>
                    <input type="text" name="postalCode" id="postalCode" placeholder="우편번호" readonly>
                    <input type="button" class="btn btn-info" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
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
                <div class="form-group">
                    <label>배송연락처</label><br>
                    <input type="text" placeholder="배송연락처" name="addressPhone" id="addressPhone">
                </div>
                <div class="form-group">
                    <label>프로필사진(최대10MB)</label>
                    <input type="file" name="multipartFile" id="multipartFile">
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary" id="btn">가입</button>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="../resources/js/users/join.js"></script>
</body>
</html>