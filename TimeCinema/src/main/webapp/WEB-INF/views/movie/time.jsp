<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp"  %>
<html>
  <head>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <title>Home</title>
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <!-- Link font -->
    <link
      rel="preconnect"
      href="https://fonts.googleapis.com"
    />
    <link
      rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin
    />
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Noto+Sans+KR:wght@300&family=Nunito:wght@300&display=swap" rel="stylesheet">
    <!-- link file css -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/time.css"
    />
  </head>

  <body>
    <div class="title-box">
      <h2>70's CINEMA</h2>
      <span id="title-sub">From 1970 to 1979</span>
      </div>
    </div>

    <!-- Swiper Box Office -->
    <div class="swiper mySwiper">
      <div class="swiper-button swiper-button-next"></div>
      <div class="swiper-button swiper-button-prev"></div>

      <div class="swiper-wrapper">
        <c:forEach var="b" items="${box}">
            <div class="swiper-slide">
              <img src="${pageContext.request.contextPath}/movie/${b.openDt}/${b.title}" alt=""/>
              <span class="box-rank">${b.rank}</span>
              <span class="box-title">${b.title}</span>
            </div>
          </c:forEach>
      </div>
    </div>

        <!-- Swiper   -->
        <div class="swiper mySwiper">
          <div class="swiper-button swiper-button-next"></div>
          <div class="swiper-button swiper-button-prev"></div>
    
          <div class="swiper-wrapper">
            <div
              class="swiper-slide"
              data-era="20's"
            >
              <img
                src="${pageContext.request.contextPath}/img/20's.jpg"
                alt=""
              />
              <span class="box-rank">
                1
              </span>
              <span class="box-title">
                제목
              </span>
            </div>
            <div
              class="swiper-slide"
              data-era="10's"
            >
              <img
                src="${pageContext.request.contextPath}/img/10's.jpg"
                alt=""
              />
              <span class="box-rank">
                1
              </span>
              <span class="box-title">
                제목
              </span>
            </div>
            <div
              class="swiper-slide"
              data-era="00's"
            >
              <img
                src="${pageContext.request.contextPath}/img/00's.jpg"
                alt=""
              />
              <span class="box-rank">
                1
              </span>
              <span class="box-title">
                제목
              </span>
            </div>
            <div
              class="swiper-slide"
              data-era="90's"
            >
              <img
                src="${pageContext.request.contextPath}/img/90's.jpg"
                alt=""
              />
              <span class="box-rank">
                1
              </span>
              <span class="box-title">
                제목
              </span>
            </div>
            <div
              class="swiper-slide"
              data-era="80's"
            >
              <img
                src="${pageContext.request.contextPath}/img/80's.jpg"
                alt=""
              />
              <span class="box-rank">
                1
              </span>
              <span class="box-title">
                제목
              </span>
            </div>
            <div
              class="swiper-slide"
              data-era="70's"
            >
              <img
                src="${pageContext.request.contextPath}/img/70's.jpg"
                alt=""
              />
              <span class="box-rank">
                1
              </span>
              <span class="box-title">
                제목
              </span>
            </div>
          </div>
        </div>
        
        <%@ include file="../include/footer.jsp"  %>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      const swiper = new Swiper('.mySwiper', {
        effect: 'slide',
        spaceBetween: '15px',
        slidesPerView: 5,
        slidesPerGroup: 5,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
        allowTouchMove: false,
      });


    </script>
  </body>
</html>
