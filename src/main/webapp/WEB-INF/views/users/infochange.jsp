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
    <title>개인정보 변경</title>

    <!-- Core Style CSS -->
	<link rel="stylesheet" href="../resources/css/core-style.css">

</head>
<body>
    <!-- ##### Search Content ##### -->
	<c:import url="../template/new_search.jsp"></c:import>


	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

		<c:import url="../template/new_header.jsp"></c:import>

			<!-- Product Catagories Area Start -->
			<div class="products-catagories-area clearfix">
				<div class="clearfix">

                    <div id = total>
                        <div class="container" style="width:600px; margin-top: 60px; margin-bottom: 60px;">
                            <h2 style="text-align: center;">개인정보 변경</h2>
                            <form class="frm" action="./infochange" method="post" id="frm" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="id">ID</label>
                                    <input type="text" class="form-control" placeholder="ID" name="id" id="id" value="${usersDTO.id}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" class="form-control" name="name" id="name" value="${usersDTO.name}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>전화번호</label>
                                    <input type="text" class="form-control" placeholder="전화번호" name="phone" id="phone" value="${usersDTO.phone}">
                                </div>
                                <div class="form-group">
                                    <label>이메일</label><br>
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
                                </div>
                                <div class="form-group">
                                    <label>가입일자</label><br>
                                    <input type="text" name="joinDate" id="joinDate"value="${usersDTO.joinDate}" readonly>
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
                                    <label>프로필사진(최대10MB)</label><br>
                                    <div id="profile">
                                        <div id="files">
                                            <c:choose>
                                                <c:when test="${usersDTO.usersFileDTO.oriName ne null}">
                                                    <a href="../resources/upload/users/${usersDTO.usersFileDTO.fileName}">${usersDTO.usersFileDTO.oriName}</a>
                                                    <button type="button" data-fileNum="${usersDTO.usersFileDTO.fileNum}" class="fileDeleteBtn btn btn-danger">X</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="file" name="multipartFile" id="multipartFile">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="btn">수정</button>
                                </div>
                            </form>
                        </div>
                    </div>

				</div>
			</div>
			<!-- Product Catagories Area End -->

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
    <script src="../resources/js/active2.js"></script>
   
    <script type="text/javascript" src="../resources/js/users/infochange.js"></script>

</body>
</html>