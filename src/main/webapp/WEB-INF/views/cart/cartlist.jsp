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
    <title>장바구니</title>

    <!-- Core Style CSS -->
	  <link rel="stylesheet" href="../resources/css/core-style.css">

</head>
<body>
    <!-- ##### Search Content ##### -->
    <c:import url="../template/new_search.jsp"></c:import>


    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

      <c:import url="../template/new_header.jsp"></c:import>

      <!-- Cart table Area Start -->
        <div class="cart-table-area section-padding-100">
          <div class="container-fluid">
            <form id="frm" action="./cartlist" method="post">
              <div class="row">
                  <div class="col-12 col-lg-8">
                      <div class="cart-title mt-50">
                        <h2>Shopping Cart</h2>
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
                            <c:forEach items="${cartlist}" var="dto" varStatus="status">
                              <tr>
                                <td class="cart_product_img">
                                  <input class="check" name="cartNum" type="checkbox" data-cartNum="${dto.cartNum}" value="${dto.cartNum}">&nbsp;
                                  <c:if test="${dto.productDTO.thumbnail ne null}">
                                    <a href="../product/detail?productNum=${dto.productNum}"><img class="image" src="../resources/upload/product/${dto.productDTO.thumbnail}" alt="Product"></a>
                                  </c:if>
                                </td>
                                <td class="cart_product_desc">
                                  <h5>${dto.productDTO.name}</h5>
                                  <c:forEach items="${optionlist}" var="op" begin="${status.index}" end="${status.index}">
                                    <c:choose>
                                      <c:when test="${op.optionContents ne null}">
                                        ( 옵션 : ${op.optionContents} ) <input class="option" type="hidden" name="optionContents" value="${op.optionContents}" disabled>
                                      </c:when>
                                      <c:otherwise>
                                        <input class="option" type="hidden" name="optionContents" value="${op.optionContents}" disabled>
                                      </c:otherwise>
                                    </c:choose>
                                  </c:forEach>
                                </td>
                                <td class="count">
                                  <span>${dto.productCount}</span>
                                </td>
                                <td class="price">
                                  <span>${dto.productDTO.price}</span>
                                </td>
                              </tr>
                            </c:forEach>                                   
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div class="col-12 col-lg-4">
                    <div class="cart-summary">
                      <h5>Cart Total</h5>
                      <ul class="summary-table">
                        <li>
                          <span>total:</span>
                          <span>
                            <c:forEach items="${cartlist}">
                              <span class="totalPrice"></span>
                            </c:forEach>
                            <span class="totalPrice">원</span>
                          </span>
                        </li>
                      </ul>
                      <div class="cart-btn">
                        <a class="btn amado-btn w-100" id="selectOrder_btn2" style="color: white;">
                          <span class="site-btn clear-btn">주문하기</span>
                        </a>
                        <form class="frm" action="./cartlistDelete" method="post" style="display: inline;">
                          <a class="btn amado-btn w-100" id="selectDelete_btn" style="margin-top: 10px; color: white;">
                            <span class="site-btn clear-btn">선택 상품 삭제</span>
                          </a>
                        </form>
                      </div>
                    </div>
                  </div>
              </div>
            </form>
          </div>
        </div>
      <!-- Cart table Area End -->

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
      </script>

      <script type="text/javascript" src="../resources/js/cart/cartlist.js"></script>

</body>
</html>