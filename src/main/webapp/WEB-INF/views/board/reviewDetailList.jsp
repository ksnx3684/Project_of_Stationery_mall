<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|
Material+Icons+Round|Material+Icons+sharp"
	rel="stylesheet">
<!-- <link href="../resources/css/table.css" rel="styleSheet" />
<link href="../resources/css/list.css" rel="styleSheet" />
<link href="../resources/css/notice.css" rel="styleSheet" /> -->
<link rel="stylesheet" href="../resources/css/product/qnaDetail.css" />
</head>
<body>
	<!--  review Detail Ajax 용 페이지입니다. -->
	<div class="qna_board">
		<h2 class="titleArea">REVIEW</h2>
		<div id="qnaArea" class="qna-inside">

			<div class="table-container">
				<table class="table-basic" id="qnaTable">
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.reviewDto}" var="dto">
							<tr>
								<td>${dto.num}</td>
								<td><button type="button" class="qna accordion"
										data-num="${dto.num}">
										${dto.title}

									</button></td>
								<td>${dto.id}</td>
							</tr>
							<tr>
								<td colspan="5"><div class="panel contents"
										id="contentsArea">
										${dto.contents}
								<%-- 		<c:forEach items="${dto.fileDTOs}" var="f">
											<div class="qnaImgArea">
												<img class="qnaImg" alt=""
												src="../resources/upload/qnas/${f.fileName}">
											</div>
										</c:forEach> --%>
										<div class="imgBox">
										<c:forEach items="${dto.fileDTOs}" var="f">
					
											<!-- 첫 번째 Modal을 여는 클래스 -->
										    <div class="btn"><img src="../resources/upload/review/${f.fileName}"></div>
										 
										    <!-- 첫 번째 Modal -->
										    <div class="modal">
										 
										      <!-- 첫 번째 Modal의 내용 -->
										      <div class="modal-content">
										        <span class="close">&times;</span>                         
												<img class="qnaImg" alt="" src="../resources/upload/review/${f.fileName}">
										      </div>
										    </div>
										</c:forEach>
									
										</div>

							 		<div class="chooseBox">
										<c:if test="${auth.id eq dto.id}">
											<a data-delNum="${dto.num}" href="../review/reviewDelete?num=${dto.num}&productNum=${param.productNum}"
											onclick="return confirm('정말 삭제하시겠습니까?');"><br>질문삭제</a>
											<a href="../review/reviewUpdate?num=${dto.num}&productNum=${param.productNum}"><br>질문수정</a>
										</c:if>
									</div> 
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pager" id="pagerArea" data-num="${param.productNum}">
					<c:if test="${pager.pre}">
						<a class="pre" href="#" data-pre="${pager.startNum-1}">◀</a>
					</c:if>

					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<a class="pageNum" href="#">${i}</a>
					</c:forEach>

					<c:if test="${pager.next}">
						<a class="next" href=# date-next="${pager.lastNum+1}">▶</a>
					</c:if>

				</div>

			</div>

		</div>
	</div>
	<script>
		const acc = document.getElementsByClassName("accordion");
const contents = document.getElementsByClassName("contents");
/* 	let panel = acc[0].parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
console.log(panel); */

  for (let i = 0; i < acc.length; i++) {
      acc[i].onclick = function(event) {	 
         // 클릭이 일어났을 때 기존에 열려 있던 아코디언을 접는다. (1개의 아코디언만 열리게)
         console.log(acc[i]);
         for (let j = 0 ; j<acc.length; j++){
            // 버튼 상태에 입혀진 active 라는 클래스를 지운다.
             acc[j].classList.remove("active");
            
            // 버튼 다음에 있는 div 콘텐츠 높이를 0으로 만든다. == 아코디언을 접는다.
             if (this!==acc[j]) {
            	 console.log(this);
                 acc[j].parentNode.parentNode.nextSibling.nextSibling.children[0].children[0].style.maxHeight = null;
             }
         }

         this.classList.toggle("active");
        // console.log(this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0]); //div 제대로 가르킴
        
           let panel = this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
        if (panel.style.maxHeight){
            this.classList.remove("active");
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }  
 
      } 
      
} 
  
//Modal을 가져옵니다.
var modals = document.getElementsByClassName("modal");
// Modal을 띄우는 클래스 이름을 가져옵니다.
var btns = document.getElementsByClassName("btn");
// Modal을 닫는 close 클래스를 가져옵니다.
var spanes = document.getElementsByClassName("close");
var funcs = [];
 
// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
function Modal(num) {
  return function() {
    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
    btns[num].onclick =  function() {
        modals[num].style.display = "block";
        console.log(num);
    };
 
    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    spanes[num].onclick = function() {
        modals[num].style.display = "none";
    };
  };
}
 
// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
for(var i = 0; i < btns.length; i++) {
  funcs[i] = Modal(i);
}
 
// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
for(var j = 0; j < btns.length; j++) {
  funcs[j]();
}
 
// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
window.onclick = function(event) {
  if (event.target.className == "modal") {
      event.target.style.display = "none";
  }
};

	</script>
</body>
</html>