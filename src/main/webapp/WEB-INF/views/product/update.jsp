<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="../resources/css/product/add.css">
<link rel="stylesheet" href="../resources/css/product/update.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+sharp" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
</head>
<body>
<!--title -->
	<div id="titleArea">
    <h2>상품 수정</h2>
    <span class="xans-element- xans-layout xans-layout-mobileaction "><a href="javascript:history.back();" ><img src="//img.echosting.cafe24.com/skin/mobile_ko_KR/layout/btn_back.gif" width="33" alt="뒤로가기"></a>
</span>
</div>

	<form action="./update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productNum" value="${dto.productNum}" id="getProductNum">
		<div>
			<label class="desc" id="title1" for="Field1" >상품 이름</label>
			<div>
				<input type="text" name="name" id="Field1" value="${dto.name}"> 
			</div>
		</div>
		
		<div>
			<label class="desc" id="title2" for="Field2">상품 설명</label>
			<div>
				<textarea name="contents" rows="15" cols="40" id="Field2">${dto.contents}</textarea>
			</div>
		</div>
		
		<div>
			<label class="desc" id="title3" for="Field3">상품 가격</label>
			<div>
				<input type="text" name="price" placeholder="숫자만 입력" id="Field3" value="${dto.price}">
			</div>
		</div>
		
<!-- 재고 -->
		<c:choose>
			<c:when test="${empty options}">
				재고 <input type="text" value="${dto.stock}" id="stockForm" readonly>
				재고 추가 <input type="text" name="stock" value="0"> 
			</c:when>
			<c:otherwise>
				<input type="hidden" value="${dto.stock}" id="stockForm">
				<input type="hidden" name="stock" value="0"> 
			</c:otherwise>
		</c:choose>
		<c:if test="${empty options}"> 
			<input type="hidden" name="stock" value="${dto.stock}" id="stockForm">
			<input type="hidden" name="stock" value="0"> 
		</c:if>

<hr><!--------카테고리------------->		
		<div>
			상품 카테고리<select name="categoryNum">
				<c:forEach items="${list}" var="list">
					<c:choose>
						<c:when test="${list.parentId eq null}">
							<!--parentid가 null -> 최상위카테고리 -->
							<optgroup label="${list.categoryName}">
							</optgroup>
						</c:when>
						<c:otherwise>
							<option value="${list.categoryNum}">
								&nbsp;&nbsp;&nbsp;${list.categoryName}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select>
		</div>
<hr><!--------옵션------------->
	<form:form action="./update" method="post" enctype="multipart/form-data">
	<div id="options">
		<div id="oriOption">
			<c:forEach items="${options}" var="options" varStatus="state">
	
				<li style="list-style: none;">
				<button type="button">${options.optionContents}</button>	
				재고: ${options.optionStock}
		
				재고 추가 <input type="text" name="optionStock" value="0"> 
				
				<input type="hidden" name="optionNum" value="${options.optionNum}">
				<input type="hidden" name="productNum" value="${options.productNum}">
				<button type="button" data-fileNum="${options.optionNum}" class="optionDeleteBtn">X</button>
				</li>

			</c:forEach>
		</div>
		
		<div id="optionResult"></div>
		
		<button type="button" id="optionAdd_btn">옵션 추가</button>
	
	</div>
	</form:form>
<hr><!--------파일------------->


		<div id="files">
			<c:forEach items="${dto.productFileDTOs}" var="f" varStatus="state">
				<div>
					<c:choose>
						<c:when test="${state.first}">
					대표이미지 ${f.oriName} <button type="button"
								data-fileNum="${f.fileNum}" class="fileDeleteBtn_t">X</button>
							<%-- 대표사진<input type="file" name="files" value="${f.fileName}"> --%>
							<!-- 		나중에 썸네일 수정하기
						
						파일선택버튼을 눌렀으면 히든을 보내줌 아니면 지우기
						수정안하는 경우에는 히든을 보내지 않음   -->
							<%-- 	<input type="hidden" name="fileNum" value="${f.fileNum}" id="hiddenfileNum">  --%>

						</c:when>


						<c:otherwise>
					기본이미지 ${f.oriName} <button type="button"
								data-fileNum="${f.fileNum}" class="fileDeleteBtn">X</button>

							<%-- 사진 <input type="file" name="files" value="${f.fileName}"> --%>
						</c:otherwise>

					</c:choose>
				</div>
				
			
				<div id="fileResult_t"></div>

			</c:forEach>
			<input type="hidden" name="check" id="tCheck" value="2">
		</div>


		<div id="fileResult"></div>
		<div>
			<button type="button" id="fileAdd">파일 추가</button>
		</div>

		<button type="submit">수정 확인</button>
	</form>

	<script type="text/javascript" src="../resources/js/product/productFileUpdate.js"></script>
	<script type="text/javascript" src="../resources/js/product/productOption.js"></script>

</body>
</html>