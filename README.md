# Spring을 활용한 인터넷 서점 개발
> Spring Framework를 사용한 쇼핑몰 웹 프로젝트입니다.

<br>

## 🗨 프로젝트 계기
+ 본 repository는 웹 개발 학습을 위해 클론코딩하였습니다.
+ CRUD와 웹 어플리케이션의 전 과정을 숙지하기 위한 개인프로젝트입니다.
<br>

## ⚙ 개발환경
+ Java 8
+ Spring Framework 5.2.25
+ PostgreSQL 16.2
<br>

## 📋 Library
+ Mybatis 3.5.13
+ Spring Securit 5.2.15
<br>

## ERD
![image](https://github.com/user-attachments/assets/5be030f3-6a73-4426-b17c-de8991d6a682)

<br>

## 핵심 기능

### User
+ Spring Security를 이용한 회원가입과 로그인
+ 비밀번호는 bcrypt를 통해 암호화하였습니다. <!-- 이메일 인증 -->
<!-- + 정보 수정: 닉네임 변경, 회원 탈퇴 -->

### Store
+ 도서 CRUD
+ 리뷰 CRUD
+ 장바구니 및 구매
+ 주문정보
+ 페이징 처리

<hr/>

### [ 회원 관리 ]  
![회원가입](https://github.com/user-attachments/assets/7cfb1314-237c-46cd-aca1-41d5e724aebe)
![로그인50](https://github.com/user-attachments/assets/73e23d2a-7333-445b-8589-d19a37cae71f)

- [X] **회원 가입**

    **[ 기능 설명 ]**  
      : 회원 가입을 할 수 있습니다.

    **[ 상세 구조 ]**  
     + **[MemberController](./bookmario/src/main/java/com/bookmario/controller/MemberController.java)**

     + **MemberService**  
       : [MemberService.java](./bookmario/src/main/java/com/bookmario/service/MemberService.java) - [MemberServiceImpl.java](./bookmario/src/main/java/com/bookmario/service/MemberServiceImpl.java)의 구조를 가집니다.

     + **MemberMapper**  
       : [MemberMapper.java](./bookmario/src/main/java/com/bookmario/mapper/MemberMapper.java) - [MemberMapper.xml](./bookmario/src/main/resources/com/bookmario/mapper/MemberMapper.xml)의 구조를 가집니다.

- [X] **로그인**  

    **[ 기능 설명 ]**  
      : Spring Security를 사용하여 로그인을 할 수 있습니다.  
      : Spring Security Handler를 이용하여 로그인 성공, 실패, 접근제한을 처리합니다.

    **[ 상세 구조 ]**  
     + **AuthenticaionProvider**    
       : 실제 인증 작업을 진행합니다. 사용자가 인증 요청한 정보와 DB의 사용자 정보가 일치하는지를 확인합니다.  
      
     + **PasswordEncoder**   
       : 패스워드를 암호화합니다.   
       : 암호화되지 않은 실제 패스워드를 저장하는 일은 위험하기 때문에 암호화된 패스워드로 저장하고, 사용자가 패스워드를 입력하면 이를 암호화해서 저장된 패스워드와 비교합니다.

     + **BCyptPasswordEncoder**   
       : PasswordEncoder구현한 클래스중 하나입니다. 해시 함수로 특정 문자열을 암호화하기 때문에 암호화를 한 후에, 다시 원문으로 돌리지 못합니다.

     + **CustomUserDetailsService**    
       : [CustomUserDetailsService](./bookmario/src/main/java/com/bookmario/security/CustomUserDetailsService.java)은 UserDetailsService를 구현하여 DB의 사용자 정보를 조회합니다.    
       : 유일한 메소드인 loadUserByUsername()는 UserDetails를 상속받아 만든 CustomUser를 반환합니다.   

     + **CustomUser**   
       : [CustomUser](./bookmario/src/main/java/com/bookmario/security/domain/CustomUser.java)는 조회한 사용자 정보를 담고있습니다.   
       : Spring Security에서 제공하고 있는 UserDetails를 구현한 여러 클래스 중에서 User클래스를 상속받았습니다.

     + **security-context.xml**   
      : [security-context.xml](./bookmario/src/main/webapp/WEB-INF/spring/security-context.xml)은 Spring Security와 관련된 설정을 담고 있습니다.   
      : AuthenticationSuccessHandler를 상속받아 [로그인 성공 로직](./bookmario/src/main/java/com/bookmario/security/CustomLoginSuccessHandler.java)을 처리합니다.   
      <!-- : AuthenticationFailureHandler를 상속받아 [로그인 실패 로직]()을 처리합니다. 로그인의 실패 원인을 알려줍니다. -->
      : AccessDeniedHandler를 상속받아 권한이 없는 페이지에 대하여 [접근 제한 로직](./bookmario/src/main/java/com/bookmario/security/CustomAccessDeniedHandler.java)을 처리합니다.    
     + **MemberMapper**   
      : [MemberMapper.java](./bookmario/src/main/java/com/bookmario/mapper/MemberMapper.java) - [MemberMapper.xml](./bookmario/src/main/resources/com/bookmario/mapper/MemberMapper.xml)의 구조를 가집니다.

<hr/>

### [ 상품 관리 ]
![도서 상세보기75](https://github.com/user-attachments/assets/f461d0d9-ef3f-4e24-881e-574947195818)
![리뷰50](https://github.com/user-attachments/assets/93a4683c-2a46-499e-a0d9-42c30593c388)   
![도서등록50](https://github.com/user-attachments/assets/15276f22-7037-46bd-b50b-eb4bcd5a54a0)
![도서 수정50](https://github.com/user-attachments/assets/82340aaa-8087-471a-a60e-311f1256b84b)

- [X] **상품의 CRUD**

   **[ 기능 설명 ]**   
     : 관리자만이 게시물을 등록, 수정, 삭제할 수 있으며, 누구나 조회할 수 있습니다.   
     : 상품은 도서 분류 **카테고리**를 지정하거나 **검색**을 통하여 조회할 수 있습니다.

   **[ 상세 구조 ]**
    + **[BookController](./bookmario/src/main/java/com/bookmario/controller/BookController.java)**   
      : 이미지는 C:\Bookmario\resources\img 폴더에 저장합니다.   
   
    + **BookService**   
       : [BookService](./bookmario/src/main/java/com/bookmario/service/BookService.java) - [BookServiceImpl](./bookmario/src/main/java/com/bookmario/service/BookServiceImpl.java)의 구조를 가집니다.

    + **BookMapper**   
       : [BookMapper.java](./bookmario/src/main/java/com/bookmario/mapper/BookMapper.java) - [BookMapper.xml](./bookmario/src/main/resources/com/bookmario/mapper/BookMapper.xml)의 구조를 가집니다.

- [X] **리뷰 CRUD**

   **[ 기능 설명 ]**   
    : 회원은 리뷰를 등록, 수정, 삭제할 수 있습니다   
    : 리뷰에 대한 조회는 제품의 리뷰 탭 에서 누구나 가능합니다.

   **[ 상세 구조 ]**   
    + **[ReviewController](./bookmario/src/main/java/com/bookmario/controller/ReviewController.java)**   
       : json를 반환하는 RestController를 사용하였고, View단에서 JQuery의 AJAX로 데이터를 주고 받습니다.

    + **[ReviewMapper]**   
       :[ReviewMapper.java](./bookmario/src/main/java/com/bookmario/mapper/ReviewMapper.java) - [ReviewMapper.xml](./bookmario/src/main/resources/com/bookmario/mapper/ReviewMapper.xml)의 구조를 가집니다.

<hr/>

### [ 구매 절차 ]
![장바구니50](https://github.com/user-attachments/assets/e134edf9-3479-44a3-b046-0da29537b5b1)
![주문내역50](https://github.com/user-attachments/assets/5ee608c7-2e8c-4d3d-add4-481085ae2898)

- [X] **장바구니**

   **[ 기능 설명 ]**
    : 회원은 원하는 상품의 수량을 지정하여 장바구니에 저장할 수 있습니다.   
    : 장바구니에서 담았던 상품을 삭제할 수도 있습니다.

   **[ 상세 구조 ]**
    + **[CartsController](./bookmario/src/main/java/com/bookmario/controller/CartsController.java)**
      
    + **CartService**   
       : [CartService.java](./bookmario/src/main/java/com/bookmario/service/CartService.java) - [CartService.xml](./bookmario/src/main/java/com/bookmario/service/CartServiceImpl.java)의 구조를 가집니다.

    + **CartMapper**   
       : [CartMapper.java](./bookmario/src/main/java/com/bookmario/mapper/CartMapper.java) - [CartMapper.xml](./bookmario/src/main/resources/com/bookmario/mapper/CartMapper.xml)의 구조를 가집니다.

- [X] **구매**

   **[ 기능 설명 ]**
    : 장바구니에 있는 여러 상품들을 함께 주문할 수 있습니다.

   **[ 상세 구조 ]**
    + **[OrdersController](./bookmario/src/main/java/com/bookmario/controller/OrdersController.java)**

    + **OrderService**   
       : [OrderService](./bookmario/src/main/java/com/bookmario/service/OrderService.java) - [OrderServiceImpl](./bookmario/src/main/java/com/bookmario/service/OrderServiceImpl.java)의 구조를 가집니다.

    + **OrderMapper**   
       : [OrderMapper.java](./bookmario/src/main/java/com/bookmario/mapper/OrderMapper.java) - [OrderMapper.xml](./bookmario/src/main/resources/com/bookmario/mapper/OrderMapper.xml)의 구조를 가집니다.

## UI

### 메인페이지
![메인페이지](https://github.com/user-attachments/assets/07e01112-c869-4a24-8232-76c8b0b83b0f)
<hr/>

### 도서 리스트
![도서 리스트](https://github.com/user-attachments/assets/2f8662e6-c831-47e3-a3de-ec3f9420d7b2)
<hr/>

<!-- ### 회원 수정 -->

<!-- ### 관리자 페이지 -->
