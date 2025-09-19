![bookmario_logo1 (1)](https://github.com/user-attachments/assets/727bbc78-f04c-4f0f-8f15-c9fe721cde32)

# Spring을 활용한 인터넷 서점 개발
> Spring Freamwork, JSP, JQuery등의 정부 표준 프레임 워크를 적극 활용한 전통적인 MVC패턴의 Spring Web app 입니다.

<br>

## 🗨 프로젝트 소개

### 프로젝트를 간단하게 소개한다면?
사용자들이 중고 도서를 등록, 검색, 거래할 수 있는 웹 기반 플랫폼을 만들기 위한 프로젝트입니다.<br>
온라인에서 손쉽게 중고 책을 사고 팔 수 있도록 돕는 서비스가 목표입니다.

### 이 프로젝트를 시작하게 된 배경은?
개발 공부 중에 단순한 예제가 아닌, 실생활과 연결된 프로젝트로 중고 거래(책 정리, 저렴한 구매)를 할 수 있는 실용적인 서비스를 만들어 보고싶었습니다<br>
특히 책을 좋아하는 제 경험에서 출발하여, 중고 도서를 더 쉽게 사고 팔 수 있는 온라인 플랫폼이 있으면 좋겠다고 생각해 시작하게 되었습니다.

### 현재 어느 정도 진행되었고, 진행 과정은?
+ 회원가입 / 로그인
+ 책 등록, 수정, 삭제 (CRUD)
+ 책 목록 조회 및 페이징 처리
+ 리뷰 등록
+ 카테고리 / 검색 기능
+ 장바구니 / 주문 및 배송상태 추적까지 구현된 상태입니다.

## ⚙ 사용기술
+	Frontend: JSP, Jquery, JavaScript
+	Backend: Spring Framework (Spring Security), MyBatis
+	Database: PostgreSQL
+	Server: Apache Tomcat 9.0

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

![리뷰](https://github.com/user-attachments/assets/773ed9ce-3b04-4ebf-af3d-852ec78b00eb)<br>
![도서등록](https://github.com/user-attachments/assets/15276f22-7037-46bd-b50b-eb4bcd5a54a0)
![도서 수정](https://github.com/user-attachments/assets/82340aaa-8087-471a-a60e-311f1256b84b)

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
![메인페이지](https://github.com/user-attachments/assets/70c682af-ef96-4f3d-893e-c9b801b29e15)
<hr/>

### 도서 리스트
![도서 리스트](https://github.com/user-attachments/assets/eb61607b-807a-4ff1-8e2b-2b11525d1d9a)
<hr/>

### 상품 상세보기
![도서 상세보기](https://github.com/user-attachments/assets/1fd7111c-6111-4410-abe4-de506ee96307)<br>
<hr/>

<!-- ### 회원 수정 -->


<!-- ### 관리자 페이지 -->
