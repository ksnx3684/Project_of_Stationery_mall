<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/header.css" rel="stylesheet">
<div id="header">
    
    <div class="part_01">
    	<div class="inner">
              
            <!-- 상단 우측 메뉴 -->
            <ul class="JS_topMenu menuOver">
            <!-- 로그인전 -->
            <li class="xans-element- xans-layout xans-layout-statelogoff"><a href="/member/login.html" class="log">로그인</a></li>
		    <!-- 로그인후 -->
			<li class="arrow">
			<a href="/myshop/index.html">마이쇼핑</a>
			<ul>
			
					<li><a href="/order/basket.html">장바구니</a></li>
		            <li><a href="/users/wishlist.jsp">관심상품</a></li>
		            <li><a href="/myshop/order/list.html">주문조회</a></li>

		           
				</ul>
				</li>
    
	<li class="xans-element- xans-layout xans-layout-boardinfo arrow"><a href="/board/index.html">고객센터</a>
<ul>
<li class="xans-record-"><a href="/board/free/list.html?board_no=1">공지사항</a></li>
            <li class="xans-record-"><a href="/board/free/list.html?board_no=3">이용안내</a></li>
<li class="xans-record-"><a href="/board/product/list.html?board_no=4">상품 리뷰</a></li>
<li class="xans-record-"><a href="/board/product/list.html?board_no=6">상품문의</a></li>
		</ul>
</li>
    

</ul></div><!--//.inner-->
    </div><!--//.part_01-->

    <div class="part_02">
        <div class="p0201">
            <div class="inner">
                <!-- 로고 -->
                <!------------------------------------------------------------------------------------------------------------------------------------------

    ### 로고 ###

    • 이미지개수 - 3개
    • 이미지 사이즈 - PC : 300 * 150 픽셀 , Mobile : 400 * 200 픽셀
    • FTP상의 이미지 경로 - /sde_design/skin번호/_wg/img/
    • <a href="링크주소"><img src="이미지주소" alt="" /></a>
    • 로고는 href="/" 로 절대 고정값입니다. 수정시 메인으로 연결되지 않을 수 있습니다.
    • 투명 PNG 파일로 만들어주세요.( 참고링크 - https://www.youtube.com/results?search_query=투명png만들기 )
    • logo_off.png - 마우스 올리기전
      logo_on.png  - 마우스 올렸을 때
      logo_mobile.png - 모바일 로고
    • 로고효과변경 - 아래 html중 class에 updown 이라고 적혀있는 부분
      upDown(위아래-기본값) / stop(효과없음) / fade(페이드) / left(좌우)

------------------------------------------------------------------------------------------------------------------------------------------->
<div class="logo rOver upDown">
    <a href="/">
        
        <!-- PC 로고 -->
     
</div>
                
				<!-- cp503 (상단 원형 슬라이드 배너) -->
				<!------------------------------------------------------------------------------

	cp503 - 상단 원형 슬라이드 배너

	===== 설정 =====
	배너이미지 사이즈 : 120 x 120 픽셀
	ON/OFF 기능으로 숨김가능.(공통매뉴얼 10번 글 참조)
	옵션설정 : 아래 option.js 에서 변경가능
	src="이미지주소"
	href="링크주소"

------------------------------------------------------------------------------>




<div id="cp503">
    <div class="owl-carousel ul owl-loaded owl-drag">
        
        
        
    <div class="owl-stage-outer owl-height" style="height: 0px;"><div class="owl-stage" style="transition: all 0s ease 0s;"><div class="owl-item"><li><a href="#none"><img src="/_wg/_cPack/cp503/img/01.png" alt=""></a></li></div><div class="owl-item"><li><a href="#none"><img src="/_wg/_cPack/cp503/img/02.png" alt=""></a></li></div><div class="owl-item"><li><a href="#none"><img src="/_wg/_cPack/cp503/img/03.png" alt=""></a></li></div></div></div><div class="owl-nav"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots"><div class=".owl-dot owl-dot"><span style="width: 0px;"></span></div><div class=".owl-dot owl-dot active"><span style="width: 48.8667%; overflow: hidden;"></span></div><div class=".owl-dot owl-dot"><span style="width: 0px;"></span></div></div></div>
</div>

                <div class="right_section">
                    <!-- 검색창 -->
                    <form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data">
<input id="banner_action" name="banner_action" value="" type="hidden"><div class="xans-element- xans-layout xans-layout-searchheader header_search "><!--
    $product_page=/product/detail.html
    $category_page=/product/list.html
    -->
<fieldset>
<legend>검색</legend>
        <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"><input type="image" src="/_wg/img/_btn/btn_search_b_50.png" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
</fieldset>
</div>
</form>
                    <!-- 상단 아이콘 -->
                    <div class="header_icon">
    <ul><li class="cp792 btn">
            <a href="#none">
            	<i class="xi-bars"></i>
                <div class="-caption"><p>전체메뉴</p></div>
            </a>
        </li>
        <li class="ico_cart">
            <a href="/order/basket.html">
                <i class="xi-cart-o"></i>
                <span class="xans-element- xans-layout xans-layout-orderbasketcount count mColor displaynone EC-Layout_Basket-count-display "><span class="EC-Layout-Basket-count">0</span>
</span>
                <div class="-caption"><p>장바구니</p></div>
            </a>
        </li>
    	<li class="ico_recent">
            <a href="/myshop/recent_list.html">
                <i class="xi-eye-o"></i>
                <span class="xans-element- xans-myshop xans-myshop-main count mColor "><span class="xans_myshop_main_recent_cnt">5</span></span>
                <div class="-caption"><p>최근본상품</p></div>
            </a>
        </li>
    	<li class="ico_myshop">
            <a href="/myshop/index.html">
                <i class="xi-user-o"></i>
                <div class="-caption"><p>마이샵</p></div>
            </a>
        </li>
    </ul></div>
                </div>
			</div><!--//.inner-->
        </div><!--//.p0201-->
        
        <div class="p0202">
            <div class="inner">
                <!-- 카테고리 전체보기 -->
                <!------------------------------------------------------------------------------

	### cp792 (카테고리 전체보기) ###

------------------------------------------------------------------------------>





<!-- 버튼 -->
<div class="cp792 btn">
    <a href="#none"><i class="xi-bars"></i><div class="-caption"><p>카테고리 전체보기</p></div></a>
</div>

<!-- 팝업 (/_wg/_cPack/cp792/popup.html 파일을 열어서 수정해주세요.) -->
<div class="cp792 popup idx1"><button type="button" class="p-close" alt="닫기버튼"><i class="xi-close"></i></button></div>
                
                <div id="category_scroll" class="mCS_destroyed"><!-- 모바일에서 스크롤생성 -->
                    <div class="wrap_category_scroll">
                        
                        <!-- 추가메뉴1 -->
                        
<!-- 대분류를 더 만드실려면 3~16번줄의 내용을 복사후 이 위치에 넣어주시면 되겠습니다. -->
                      <!-- 상품분류 --><!-- 
    주의!! 아래의 소스를 수정하시면 상품분류메뉴가 정상작동하지 않습니다.
    아래의 소스는 가능한 수정하지 않으시는게 좋습니다.
--><div id="category-lnb" style="height:50px;" class="xans-element- xans-layout xans-layout-category category"><ul class="d1-wrap d_ratio" data-maxheight="480">
<!--★중분류 줄바꿈 최고높이--><li data-param="?cate_no=115" class="d1 li xans-record-"><a href="/product/list.html?cate_no=115">전체 상품</a></li>
        <li data-param="?cate_no=24" class="d1 li xans-record- be"><a href="/product/list.html?cate_no=24">팬시용품</a><div class="d2-wrap"><dl><dd data-param="?cate_no=88" class="d2"><a href="/product/list.html?cate_no=88">스티커</a></dd><dd data-param="?cate_no=29" class="d2"><a href="/product/list.html?cate_no=29">보석함</a></dd><dd data-param="?cate_no=89" class="d2"><a href="/product/list.html?cate_no=89">저금통</a></dd><dd data-param="?cate_no=110" class="d2"><a href="/product/list.html?cate_no=110">연필깎이</a></dd><dd data-param="?cate_no=82" class="d2"><a href="/product/list.html?cate_no=82">쿠션/인형</a></dd><dd data-param="?cate_no=75" class="d2"><a href="/product/list.html?cate_no=75">앞치마/토시</a></dd><dd data-param="?cate_no=94" class="d2"><a href="/product/list.html?cate_no=94">머리끈/헤어밴드</a></dd><dd data-param="?cate_no=83" class="d2"><a href="/product/list.html?cate_no=83">편지지/카드/엽서</a></dd><dd data-param="?cate_no=109" class="d2"><a href="/product/list.html?cate_no=109">기타용품</a></dd></dl></div></li>
        <li data-param="?cate_no=26" class="d1 li xans-record- be"><a href="/product/list.html?cate_no=26">필기용품</a><div class="d2-wrap"><dl><dd data-param="?cate_no=71" class="d2"><a href="/product/list.html?cate_no=71">샤프</a></dd><dd data-param="?cate_no=73" class="d2"><a href="/product/list.html?cate_no=73">볼펜</a></dd></dl></div></li>
<li data-param="?cate_no=28" class="d1 li xans-record- be"><a href="/product/list.html?cate_no=28">노트/수첩</a><div class="d2-wrap"><dl><dd data-param="?cate_no=47" class="d2"><a href="/product/list.html?cate_no=47">노트/수첩</a></dd><dd data-param="?cate_no=67" class="d2"><a href="/product/list.html?cate_no=67">다이어리</a></dd><dd data-param="?cate_no=68" class="d2"><a href="/product/list.html?cate_no=68">스케줄러</a></dd><dd data-param="?cate_no=69" class="d2"><a href="/product/list.html?cate_no=69">메모지/포스트잇</a></dd></dl></div></li>
<li data-param="?cate_no=42" class="d1 li xans-record- be"><a href="/product/list.html?cate_no=42">가방/지갑</a><div class="d2-wrap"><dl><dd data-param="?cate_no=91" class="d2"><a href="/product/list.html?cate_no=91">가방류</a></dd><dd data-param="?cate_no=93" class="d2"><a href="/product/list.html?cate_no=93">지갑류</a></dd></dl></div></li>
<li data-param="?cate_no=27" class="d1 li xans-record- be"><a href="/product/list.html?cate_no=27">필통/파우치</a><div class="d2-wrap"><dl><dd data-param="?cate_no=35" class="d2"><a href="/product/list.html?cate_no=35">파우치류</a></dd><dd data-param="?cate_no=34" class="d2"><a href="/product/list.html?cate_no=34">필통류</a></dd></dl></div></li>
<li data-param="?cate_no=44" class="d1 li xans-record- be"><a href="/product/list.html?cate_no=44">생활/계절용품</a><div class="d2-wrap"><dl><dd data-param="?cate_no=52" class="d2"><a href="/product/list.html?cate_no=52">생활용품</a></dd><dd data-param="?cate_no=51" class="d2"><a href="/product/list.html?cate_no=51">계절용품</a></dd></dl></div></li>
<li data-param="?cate_no=60" class="d1 li xans-record-"><a href="/product/list.html?cate_no=60">악세사리</a></li>
<li data-param="?cate_no=53" class="d1 li xans-record-"><a href="/product/list.html?cate_no=53">완구</a></li>
    </ul>
<!-- 상붐분류 배너 --><ul class="category_img" style="display:none">
<!----------------------------------------------------------------------------------------------------------------------------------

    ### 카테고리 배너 ###

    • 중분류가 없는 경우 이미지만 노출이됩니다.

    • 카테고리의 배너는 진열된 카테고리(대분류)의 순서대로 연결되어 있습니다.
      예를들어 카테고리 메뉴 개수가 5개일 경우 아래의 배너는 #01 ~ #05 까지 자동으로 진열되겠습니다.
    
    • 이미지 사용 - <li><a href="링크"><img class="lazy" data-src="/_wg/img/category_bnr/01.jpg"></a></li>
      이미지 미사용 - <li>사용하지않음</li>

    • href="#none(링크주소)" -> href="http://naver.com" 처럼 들어갈 수 있습니다.
      새창띄우기 - <a href="#none" target="_blank"> 로 변경해주세요.

-----------------------------------------------------------------------------------------------------------------------------------><!-- #01 --><li>사용하지않음</li>
    <!-- #02 --><li>사용하지않음</li>
    <!-- #03 --><li>사용하지않음</li>
    <!-- #04 --><li>사용하지않음</li>
    <!-- #05 --><li>사용하지않음</li>
    <!-- #06 --><li>사용하지않음</li>
    <!-- #07 --><li>사용하지않음</li>
    <!-- #08 --><li>사용하지않음</li>
    <!-- #09 --><li>사용하지않음</li>
    <!-- #10 --><li>사용하지않음</li>
    <!-- #11 --><li>사용하지않음</li>
    <!-- #12 --><li>사용하지않음</li>
    <!-- #13 --><li>사용하지않음</li>
    <!-- #14 --><li>사용하지않음</li>
    <!-- #15 --><li>사용하지않음</li>
    <!-- #16 --><li>사용하지않음</li>
    <!-- #17 --><li>사용하지않음</li>
    <!-- #18 --><li>사용하지않음</li>
    <!-- #19 --><li>사용하지않음</li>
    <!-- #20 --><li>사용하지않음</li>
    </ul>
</div>
<script>
$jq(function() {
    var ww = $(window).width();
    var $clnb = $jq('#category_scroll');
	var scroll_on = false;
    
    var delay = (function(){
  		var timer = 0;
  		return function(callback, ms){
    		clearTimeout (timer);
    		timer = setTimeout(callback, ms);
  		};
	})();
    
    $(window).resize(function(e) {
    	ww = $(window).width();
        delay(toggle_vscroll, 100);
    });
    function toggle_vscroll() {
        if(tl_isMobile()) {
            $clnb.css({'overflow-x':'auto','overflow-y':'hidden'});
        }
        else if(ww > 576 && ww < 1200 && scroll_on == false) {
        	$clnb.mCustomScrollbar({
                axis:"x",
                theme:"dark",
                scrollbarPosition: "inside" });
            scroll_on = true;
        } else if (scroll_on == true && (ww >= 1200 || ww <= 576)){
            scroll_on = false;
            $clnb.mCustomScrollbar("destroy");
        } 
    }
    toggle_vscroll();
});
</script>

                        <!-- 기획전 -->
                        <!-- 추가메뉴2 --><ul class="nav categorySub m02 menuOver"><li><a href="https://www.puppyparang.com" target="_b1ank">링크</a>애완용품
</li>
<li><a href="http://nemosaenggak.com/board/free/list.html?board_no=5">링크</a>입금확인
</li>
                        </ul></div>
                </div>
                
                <!-- 추가메뉴3 (타임세일& 브랜드 & 포토후기) -->
                <!-- 수정전 반드시 백업을 하시고 수정하시기 바랍니다!!!!! -->
<!-- 추가메뉴3 -->
<ul class="nav categorySub m03"><!-- 타임세일 --><li class="timeSale">
        <a href="/_wg/_cPack/cp574/dom.html">링크</a>
        <i class="xi-alarm-o"></i>
        <div class="-caption"><p>타임세일</p></div>
        <p class="sale_ico -spring_y">SALE</p>
    </li>
    
    <!-- 브랜드 -->
    <li class="brand">
        <a href="/_wg/_cPack/cp572/dom.html">링크</a>
        <i class="xi-apps"></i>
        <div class="-caption"><p>브랜드</p></div>
    </li>
    
    <!-- 포토리뷰 -->
    <li class="photoReview">
        <a href="/_wg/_cPack/cp576/dom.html">링크</a>
        <i class="xi-camera-o"></i>
        <div class="-caption"><p>포토리뷰</p></div>
    </li>
    
</ul></div><!--//.inner-->
        </div><!--//.p0202-->
        
        
        <!-- 사용안함 -->
        <div class="p0203">
            <div class="inner">

                <!-- 추가메뉴5 -->
                <ul class="nav categorySub m05 menuOver"><!-- 수정전 반드시 백업을 하시고 수정하시기 바랍니다!!!!! --><!-- 추가메뉴5 --><li class="arrow"><a href="#none">링크</a>추가메뉴5-1
    <ul><li class="arrow"><a href="#none">링크</a>추가메뉴는
            <ul><li><a href="#none">링크</a>상세분류도</li>
                <li><a href="#none">링크</a>설정이 가능합니다</li>
            </ul></li>
        <li class="arrow"><a href="#none">링크</a>html상에서
            <ul><li><a href="#none">링크</a>상세분류도</li>
                <li><a href="#none">링크</a>설정이 가능합니다</li>
            </ul></li>
		<li><a href="#none">링크</a>원하시는 메뉴를</li>
        <li><a href="#none">링크</a>넣을 수 있습니다</li>
    </ul></li>

<li><a href="#none">링크</a>추가메뉴5-2</li>

<li><a href="#none">링크</a>추가메뉴5-3</li>

<li><a href="#none">링크</a>추가메뉴5-4</li>

<li><a href="#none">링크</a>추가메뉴5-5</li>
                </ul></div><!--//.inner-->
        </div><!--//.p0203--><!-- //사용안함 -->
    </div><div style="height: 0px;"></div><!--//.part_02-->
</div>






























