<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/header.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@400;600&display=swap"
      rel="stylesheet"
    />
    <title>header</title>
    <script
      src="https://kit.fontawesome.com/eebff08403.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="${pageContext.request.contextPath}/js
    /header.js"
      defer
    ></script>
  </head>
  <body>
    <nav class="navbar">
      <div class="navbar__log">
        <i class="fa-solid fa-laptop" style="color: #9c9c9c"></i>
        <a href="#">TimeCinema</a>
      </div>
      <ul class="navbar__menu">
        <li><a href="#">70s</a></li>
        <li><a href="#">80s</a></li>
        <li><a href="#">90s</a></li>
        <li><a href="#">00s</a></li>
        <li><a href="#">10s</a></li>
        <li><a href="#">20s</a></li>
      </ul>
      <div class="box">
        <input type="text" placeholder="Search..." />
        <a href="#">
          <i class="fa-solid fa-magnifying-glass" style="color: #9c9c9c"></i>
        </a>
      </div>
      <ul class="navbar__login">
        <li><a href="#">SIGN IN</a></li>
        <li><a href="#">SIGN UP</a></li>
      </ul>
      <a href="#" class="navbar__toogleBtn">
        <i class="fa-solid fa-bars" style="color: #9c9c9c"></i>
      </a>
    </nav>
  </body>
</html>
>>>>>>> 99916022b0ad718e9374af8ad900a9a10b55e799
