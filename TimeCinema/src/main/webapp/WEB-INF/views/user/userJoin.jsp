<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- link file css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userJoin.css" />

<!-- Link font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<title></title>
</head>
<body>
    <div class="login-wrapper">
        <h2>회원가입</h2>
        <form method="post" action="#" class="login-form">
            <input type="text" name="userName" placeholder="이름(2글자 이상)">
            <input type="text" name="userId" placeholder="아이디"></input>
            <input type="text" name="userPw" placeholder="비밀번호(영문, 숫자, 특수문자 중 2개 조합 10자 이상)">
            <input type="text" name="userPwCheck" placeholder="비밀번호 확인"> 
            <input type="text" name="userEmail" placeholder="이메일(example.gmail.com)"> 
            <input type="submit" value="SignUp">

        </form>
    </div>
</body>
</html>