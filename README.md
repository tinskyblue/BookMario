<div align="center"><img width="300" height="300" alt="BookMario logo" src="https://github.com/user-attachments/assets/8a5478c3-c5e3-4197-888b-ca7a3049814a" /></div>

# Spring을 활용한 인터넷 서점 개발
> Spring Framework, JSP, JQuery등의 정부 표준 프레임워크를 적극 활용한 전통적인 MVC패턴의 Spring Web app입니다.

<br>

## 🗨 프로젝트 소개

### 프로젝트를 간단하게 소개한다면?
CRUD 구현과 웹 애플리케이션 전 과정을 학습하고 경험하기 위해 진행한 개인 프로젝트입니다.
Spring MVC, JSP, MyBatis, Spring Security, PostgreSQL을 활용하여 백엔드 로직, DB 설계, 사용자 인증 등 웹 서비스 개발 과정을 숙지하는 것을 목표로 삼았습니다.

### 핵심 기능은?
#### User
+ Spring Security(세션 기반 로그인/권한 관리)를 이용한 회원가입과 로그인
+ 비밀번호는 bcrypt를 통해 암호화하였습니다. <!-- 이메일 인증 -->

#### Store
+ 도서 등록, 수정, 삭제 (CRUD)
+ 리뷰 등록, 수정, 삭제 (CRUD)
+ 도서 조회 / 도서 분류 / 검색 기능
+ 장바구니 / 주문
+ 주문 정보 확인 / 주문 취소
+ 페이징 처리

<br>

## ⚙ 사용기술
+	Frontend: JSP, Jquery, JavaScript
+	Backend: Spring Framework (Spring Security), MyBatis
+	Database: PostgreSQL
+	Server: Apache Tomcat 9.0

<br>

## ERD
<div align="center"><img width="1085" height="605" alt="ERD" src="https://github.com/user-attachments/assets/aed9aad7-ec06-40aa-8288-1424ba1bd232" /></div>

<br>

<hr/>

### [ 회원 관리 ]

<img width="300" height="600" alt="회원가입" src="https://github.com/user-attachments/assets/f4de1701-b693-4206-a31f-2079dc0f5d9e" />
<img width="500" height="300" alt="로그인" src="https://github.com/user-attachments/assets/c9fa1231-ca5b-49aa-a182-bb9fb8be32a2" />

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

<img width="400" height="800" alt="도서 등록" src="https://github.com/user-attachments/assets/a54b942d-acf1-4741-a4fe-37af68bebb2c" />
<img width="400" height="800" alt="도서 수정" src="https://github.com/user-attachments/assets/de5aa02a-4237-4301-b013-b774462d639b" />
<img width="502" height="300" alt="리뷰모달" src="https://github.com/user-attachments/assets/6b4291be-3937-4e24-9c17-386b4bad4e1c" />
<img width="800" height="400" alt="리뷰" src="https://github.com/user-attachments/assets/0b23a25a-422e-4246-918f-fbde594fadaf" />

- [X] **상품의 CRUD**

   **[ 기능 설명 ]**   
     : 관리자만이 게시물을 등록, 수정, 삭제할 수 있으며, 누구나 조회할 수 있습니다.   
     : 상품은 도서 분류 **카테고리**를 지정하거나 **검색**을 통하여 조회할 수 있습니다.

   **[ 상세 구조 ]**
    + **[BookController](./bookmario/src/main/java/com/bookmario/controller/BookController.java)**   
      : 이미지는 C:\Bookmario\resources\img 경로에 저장합니다.   
   
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

<img width="800" height="500" alt="장바구니" src="https://github.com/user-attachments/assets/ed98185f-eba4-47d0-b28b-d781fa405389" />
<img width="800" height="500" alt="주문 내역" src="https://github.com/user-attachments/assets/95d6e924-240d-4e27-ba9f-a770b02093a3" />

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

### [메인페이지]
<img width="600" height="1000" alt="메인 페이지" src="https://github.com/user-attachments/assets/c6357c3d-2260-432d-afa2-6c45d0d90a9e" />
<hr/>

### [도서 리스트]
<img width="600" height="600" alt="도서 리스트" src="https://github.com/user-attachments/assets/cdef4a1b-691e-4b81-a5dc-cf8336e71683" />
<hr/>

### [상품 상세보기]
<img width="600" height="600" alt="상품 상세보기" src="https://github.com/user-attachments/assets/59d9240c-3a5c-4ab6-bc66-7592b86abf8c" /><br>
<hr/>

<!-- ### 회원 수정 -->


<!-- ### 관리자 페이지 -->
