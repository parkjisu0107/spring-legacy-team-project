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
      <h2>${era.era}'s CINEMA</h2>
      <span id="title-sub">From ${era.yearFrom} to ${era.yearTo}</span>
      </div>
    </div>

    <!-- Swiper Box Office List -->
    <h3>Box Office List</h3>
    <div class="swiper mySwiper">
      <div class="swiper-button swiper-button-next"></div>
      <div class="swiper-button swiper-button-prev"></div>
      <div class="swiper-wrapper">
         <c:forEach var="b" items="${box}">
            <div class="swiper-slide">
              <a href="${pageContext.request.contextPath}/movie/detail/${b.movieId}" class="wrap-poster">
                <img src="${b.poster}" alt=""/>
              </a>
	            <span class="box-rank">${b.rank}</span>
	            <span class="box-title">${b.title}</span>
            </div>
          </c:forEach> 
      </div>
    </div>

    <!-- Swiper Populariy List -->
    <h3>Popularity List</h3>
    <div class="swiper mySwiper">
      <div class="swiper-button swiper-button-next"></div>
      <div class="swiper-button swiper-button-prev"></div>
      <div class="swiper-wrapper">
         <c:forEach var="p" items="${pop}">
            <div class="swiper-slide">
              <a href="${pageContext.request.contextPath}/movie/detail/${p.title}/${p.openDt}" class="wrap-poster">
                <img src="${p.poster}" alt=""/>
              </a>
	            <span class="box-rank">${p.rank}</span>
	            <span class="box-title">${p.title}</span>
            </div>
          </c:forEach> 
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
