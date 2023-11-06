<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- link file css -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/userLogin.css"
    />

    <!-- Link font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet"
    />

    <title></title>
  </head>
  <body>
    <div class="login-wrapper">
      <h2>Login</h2>
      <h4>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</h4>
      <form method="post" action="#" class="login-form">
        <input type="text" name="userName" placeholder="아이디" />
        <input type="password" name="userPassword" placeholder="비밀번호" />
        <input type="submit" value="Login" />
        <ul>
          <li><a href="#">회원가입</a></li>
          <li><a href="#">pw찾기</a></li>
        </ul>
      </form>
    </div>
  </body>
</html>
