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

- [X] **[ 로그인 ]**  

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

## UI

### 메인페이지
![메인페이지](https://github.com/user-attachments/assets/07e01112-c869-4a24-8232-76c8b0b83b0f)
<hr/>

### 도서 리스트
![도서 리스트](https://github.com/user-attachments/assets/2f8662e6-c831-47e3-a3de-ec3f9420d7b2)
<hr/>

### 도서 상세보기
![도서 상세보기](https://github.com/user-attachments/assets/9351dd00-c649-41b4-a9a1-990ac109617a)
<hr/>

### 도서 등록
![도서등록](https://github.com/user-attachments/assets/ec44ebfd-635f-48fe-9cfd-5914552ffb60)
<hr/>

### 도서 수정하기
![도서 수정](https://github.com/user-attachments/assets/5532d64c-0488-4c7b-a076-c6efbcb0fa89)
<hr/>

### 장바구니
![장바구니](https://github.com/user-attachments/assets/51ce2993-3bb8-4c2d-9cd3-9f2b0b928e2e)
<hr/>

### 주문정보
![주문내역](https://github.com/user-attachments/assets/2ca6635a-b1ea-4a9b-a040-d4d41de0fa56)
<hr/>

<!-- ### 회원 수정 -->

<!-- ### 관리자 페이지 -->
