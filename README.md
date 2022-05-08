# Project_of_Stationery_mall
![main](https://user-images.githubusercontent.com/84880772/167296388-1f6be713-09b2-4ef0-9645-539f58787043.png)

## 쌍용교육센터 세미프로젝트 (문구 쇼핑몰)
- Spring Legacy를 이용한 문구 쇼핑몰 웹사이트를 구현했습니다.


## 개발 기간
- 2022.03.16 ~ 2022.04.13 (4주)
- 2022.04.16 ~ 2022.04.26 (레이아웃 개선, 11일)


## 세부 일정
![프로젝트 기간](https://user-images.githubusercontent.com/84880772/167294650-cb6a7ba1-673a-4135-a171-2d90b8a42291.PNG)

## 개발 환경
**Back-End**
- OS : Windows 10 / Mac OS Monterey
- Languages : Java JDK 1.11
- Framework : Spring 4.3.2 (Legacy) / Mybaits 3.5.9
- IDE : Spring Tool Suite 3 (Eclipse), VS Code
- Web Server Apache Tomcat 9.0.58
- DataBase : Oracle DB 12.1.0.2.v25
- RDS : AWS RDS

**Front-End**
- Languages : HTML5, CSS, JavaScript, Ajax, JSON, jQuery, Bootstrap

**협업 도구**
- Github, Git-Fork (형상 관리 도구)
- ERDCloud (DB ERD 관리 도구)
- Trello (개발 일정 및 협업 관리 도구)


## ERD
![ERD](https://user-images.githubusercontent.com/84880772/167294671-b260219b-b9d3-474c-97fe-09a7c0322b47.png)


## 주요 기능

**회원가입 / 로그인 화면**
- 회원가입 : Ajax를 이용한 아이디 중복체크, 비밀번호 조건 기능, 이메일 형식체크, 카카오주소 API, 프로필사진 등록 기능
- 로그인 및 로그아웃 : 쿠키를 이용한 ID 저장 기능

![join](https://user-images.githubusercontent.com/84880772/167299094-5f1e5799-6636-411b-ab09-08892575e78c.gif)
![login](https://user-images.githubusercontent.com/84880772/167302454-57862a88-0d58-4387-aae2-69c6f32b3776.PNG)

**마이페이지**
- 내 정보 변경 : 개인정보변경, 비밀번호변경, 회원탈퇴 기능 (내 정보 변경 시 본인 인증 기능)
- 위시리스트, 주문내역, 장바구니, 나의 리뷰 보기 기능

![mypage](https://user-images.githubusercontent.com/84880772/167299152-5e8d6242-4469-42f2-9319-c2424212661c.png)

**관리자 페이지**
- 관리자 페이지 진입 전 관리자 계정 인증 및 Google OTP를 이용한 2단계 인증 구현
- 전체회원관리, 회원주문내역, 상품 카테고리 관리, FAQ 관리 추가 삭제

![admin](https://user-images.githubusercontent.com/84880772/167301756-a83cd64c-f68f-4953-bb74-46fe72acd48e.gif)

**FAQ 및 게시판 기능**
- 관리자 공지사항, 회원 문의 사항, 전체 리뷰보기, 게시글 검색 및 페이징 기능 구현
- 게시판 글쓰기 : summernote API를 이용한 글쓰기 구현

![faq](https://user-images.githubusercontent.com/84880772/167301818-5a09a7b9-1926-4af0-862e-f8b1c1480228.PNG)
![notices](https://user-images.githubusercontent.com/84880772/167302291-25ebde74-527c-43b7-8e6e-ae8b4f629f59.PNG)

**상품 리스트**
- 전체상품 및 카테고리 별 상품보기
- 리스트 화면에서 장바구니 및 위시리스트 추가 기능 구현

![list](https://user-images.githubusercontent.com/84880772/167301768-fbd2f64a-920d-4fbf-a60e-9970b966a9fa.PNG)

**상품 상세**
- 상품에 대한 세부 상세를 표현
- 옵션 선택 및 제품 수량 선택 후 장바구니 추가
- 상품 리뷰 기능

![detail](https://user-images.githubusercontent.com/84880772/167301824-89fa3add-bcae-47e7-903a-1790f2bb459e.gif)

**장바구니 및 주문 기능**
- 장바구니 : 상품 선택 또는 삭제 후 주문 페이지 이동 
- 주문 및 결제 : API를 이용하여 카카오페이, 네이버페이의 테스트 결제기능 구현 및 무통장입금 주문 기능 구현

![order](https://user-images.githubusercontent.com/84880772/167301826-26b4cd00-8666-411d-befe-bd23c3bad62d.gif)

