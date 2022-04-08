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
<style type="text/css">
/*  	.detailBox {
		border : 1px solid black;
		width : 500px;
		heigth : 200px;
	}  */
button.accordion {
	background-color: #FFF;
	cursor: pointer;
	width: 100%;
	border: none;
	font-size: 16px;
	transition: 0.5s;
	text-align: left;
	padding: 10px;
}

button.accordion>p {
	float: left;
	margin-left: 10px;
	width: 76%;
}

button.accordion.active {
	font-weight: bold;
	color: #000;
}

button.accordion:after { // 아코디언이 닫혀 있을 때 화살표 background-size:18px18px;
	display: inline-block;
	width: 18px;
	height: 18px;
	content: "";
	float: right;
	position: relative;
	top: 18px;
}

button.accordion.active:after { // 아코디언이 열렸을 때 화살표 이미지를 바꿔준다. content:"";
	
}

div.panel {
	padding: 0 18px;
	background-color: #f7f7f7;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	border-top: 1px solid #F0F0F0;
	color: #666666;
	font-size: 14px;
	/* line-height: 1.5px; */
}
</style>
</head>
<body>
	<!--  Qna Detail Ajax 용 페이지입니다. -->
	<div class="qna_board">
		<h2 class="titleArea">Q&A</h2>
		<div id="qnaArea" class="qna-inside">
			<p class="boardBtn">
				<a href="../qnas/qnaAdd?productNum=${param.productNum}"
					class="add-board">문의하기</a>
			</p>

			<div class="table-container">
				<table class="table-basic" id="qnaTable">
					<thead>
						<tr>
							<th>글번호</th>
							<th>문의유형</th>
							<th>글제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.qnaDto}" var="dto">
							<tr>
								<td>${dto.num}</td>
								<td><c:choose>
										<c:when test="${dto.type eq 1}">배송문의</c:when>
										<c:otherwise>상품문의</c:otherwise>
									</c:choose></td>
								<td><button type="button" class="qna accordion"
										data-num="${dto.num}">
										<c:catch>
											<c:forEach begin="1" end="${dto.depth}">↳&nbsp;</c:forEach>
										</c:catch>
										${dto.title}

									</button></td>
								<td>${dto.id}</td>
							</tr>
							<tr>
								<td colspan="5"><div class="panel contents"
										id="contentsArea">${dto.contents}
										<c:forEach items="${dto.fileDTOs}" var="f">
											<h3>${f.oriName}</h3>
											<img class="qnaImg" alt=""
												src="../resources/upload/qnas/${f.fileName}">
										</c:forEach>

										<%-- 답변 달린지 구분하는 코드 추가... --%>

										<%-- 작성자만 수정 및 삭제하게끔 --%>
										<c:if test="${auth.id eq dto.id}">
											<a data-delNum="${dto.num}"
												href="../qnas/qnaDelete?num=${dto.num}&productNum=${dto.productNum}"
												onclick="return confirm('정말 삭제하시겠습니까?');">질문삭제</a>
											<a href="../qnas/qnaUpdate?num=${dto.num}"><br>질문수정</a>
										</c:if>

										<%-- 보류
										<c:choose>
											<c:when test="${auth.userAccount eq 0}">
												<c:choose>
													<c:when test="${dto.step eq 0}">
														<a href="../qnas/qnaReply?num=${dto.num}"><br>답변달기</a>
													</c:when>
													<c:otherwise>
														<a href="../qnas/qnaUpdate?num=${dto.num}"><br>답변수정</a>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										 --%>

										<c:choose>
											<c:when test="${dto.step eq 0}">
												<a href="../qnas/qnaReply?num=${dto.num}"><br>답변달기</a>
											</c:when>
											<c:otherwise>
												<a href="../qnas/qnaUpdate?num=${dto.num}"><br>답변수정</a>
											</c:otherwise>
										</c:choose>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pager" id="pagerArea" data-num="${param.productNum}">
					<c:if test="${pager.pre}">
						<a class="pre" href=#>◀</a>
					</c:if>

					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<a class="pageNum" href="#">${i}</a>
					</c:forEach>

					<c:if test="${pager.next}">
						<a class="next" href=#>▶</a>
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

 for(con of contents) {
     //con.innerHtml = con.innerText.replace(/.$/, '');
    //마지막 글자 공백으로 변경..근데 왜 안돼
 }

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

	</script>
</body>
</html>