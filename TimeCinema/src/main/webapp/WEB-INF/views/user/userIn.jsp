<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- link file css -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/userIn.css"
    />

    <!-- Link font -->
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet"
    />
    <title></title>
  </head>
  <body>
    <%@ include file="../include/header.jsp" %>
    <div class="login-wrapper">
      <h2>Login</h2>
      <form method="post" name="loginForm" class="login-form">
        <input type="text" name="userId" placeholder="아이디" />
        <input type="password" name="userPw" placeholder="비밀번호" />
        <input type="submit" value="Login" id="loginBtn" />
        <ul>
          <li>
            <a
              href="${pageContext.request.contextPath}/user/userUp"
              id="joinBtn"
              >회원가입</a
            >
          </li>
        </ul>
      </form>
    </div>
    <%@ include file="../include/footer.jsp" %>
    <script>
      // 회원 가입 완료 후 addFlashAttribute로 msg라는 이름의 데이터가 전달됐는지 확인
      const msg = '${msg}';
      if (msg === 'joinSuccess') {
        alert('회원 가입을 환영합니다!');
      } else if (msg === 'loginFail') {
        alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');
      }

      //id, pw 입력란이 공백인지 아닌지 확인한 후, 공백이 아니라면 submit을 진행하세요.
      //요청 url은 /user/userIn -> post로 갑니다. (비동기 아니에요!)
      document.getElementById('loginBtn').onclick = () => {
        if (document.loginForm.userId.value === '') {
          alert('아이디를 입력하세요.');
          return;
        }
        if (document.loginForm.userPw.value === '') {
          alert('비밀번호를 입력하세요.');
          return;
        }

        document.loginForm.submit();
      };
    </script>
  </body>
</html>
