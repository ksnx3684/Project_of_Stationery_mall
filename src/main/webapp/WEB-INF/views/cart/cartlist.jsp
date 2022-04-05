<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
    <link rel="stylesheet" href="../resources/css/cartlist.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
	<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>

  <form action="./cartlist" method="post">
    <div class="mainStreet">
    <h2>장바구니</h2>
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
        <c:forEach items="${cartlist}" var="dto">
          <tr class="contents">
            <td class="tg-af47 name"><input class="check" name="cartNum" type="checkbox" data-cartNum="${dto.cartNum}" value="${dto.cartNum}">&nbsp;${dto.productDTO.name}</td>
            <td class="tg-af47 con count">${dto.productCount}</td>
            <td class="tg-af47 con price">${dto.productDTO.price}</td>
          </tr>
        </c:forEach>
        <tr>
          <td class="tg-10pf"></td>
          <td class="tg-10pf"></td>
          <td class="tg-10pf"></td>
        </tr>
      </tbody>
    </table>
        
    <c:forEach items="${cartlist}">
      <span class="totalPrice"></span>
    </c:forEach>
    <span class="totalPrice">원</span><br>
      <!-- <a href="./cartOrder"><button id="selectOrder_btn">주문하기</button></a> -->
      <span class="site-btn clear-btn id="selectOrder_btn2"><button class="btn btn-primary">주문하기</button></span>
      <span><a href="../"><button type="button" class="btn btn-primary">쇼핑계속하기</button></a></span>
  </form>

  <form class="frm" action="./cartlistDelete" method="post" style="display: inline;">
    <span id="selectDelete_btn"><button type="button" class="btn btn-danger">선택된 리스트 삭제</button></span>
    <script>
      $("#selectDelete_btn").click(function () {
          let confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");

          if (confirm_val) {
              let checkArr = new Array();
              // let checkArr = [];

              $("input[class='check']:checked").each(function () {
                  checkArr.push($(this).attr("data-cartNum"));
              });

              $.ajax({
                  url: "cartlistDelete",
                  type: "post",
                  data: { checkbox : checkArr},
                  traditional : true,

                  success: function () {
                      location.href = "./cartlist";
                  }
              });
              const frm = document.getElementsByClassName("frm");
              frm.submit();
          } else {
            //location.reload;
          }
      });

      // $("#selectOrder_btn").click(function () {
      //     let confirm_val = confirm("선택한 상품을 주문하시겠습니까?");

      //     if (confirm_val) {
      //         let checkArr = new Array();

      //         $("input[class='check']:checked").each(function () {
      //             checkArr.push($(this).attr("data-cartNum"));
      //         });

      //         $.ajax({
      //             url: "./cartOrder",
      //             type: "post",
      //             data: { checkbox: checkArr },
      //             traditional : true,
                  
      //             success: function (data) {
      //                 // location.href = "/cart/cartOrder";
      //                 console.log(data);
      //             }
      //         });
      //     }
      // });
    </script>
    </div>
  </form>
  <script type="text/javascript" src="../resources/js/cart/cartlist.js"></script>
    
</body>
</html>