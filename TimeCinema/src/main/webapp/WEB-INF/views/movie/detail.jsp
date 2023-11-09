<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <!-- link file css -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/detail.css"
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
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet"
    />

    <title></title>
  </head>
  <body>
    <div class="image-box">
      <img
        class="image-thumbnail"
        src="${detail.poster}"
      />
    </div>
    <div class="detail">
      <div class="detailposter">
        <img
          src="${detail.poster}"
        />
      </div>
      <div class="div2">
        <div class="details">
          <!-- 영화명 -->
          <p class="title1">${detail.title}</p>
          <!-- 영화명(영문) -->
          <p class="title2">${detail.titleEng}</p>
          <!-- 개봉 -->
          <p class="title3">개봉 &emsp; &emsp; ${detail.openDt}</p>
          <!-- 국가 -->
          <p class="title3">국가 &emsp; &emsp; ${detail.nation}</p>
          <!-- 등급 -->
          <p class="title3">등급 &emsp; &emsp; ${detail.rating}</p>
          <!-- 장르 -->
          <p class="title3">장르 &emsp; &emsp; ${detail.type} / ${detail.genre}</p>
          <!-- 러닝타임 -->
          <p class="title3">러닝타임 &nbsp; ${detail.runtime}</p>
        </div>

        <div class="content">
          <h4>줄거리</h4>
          <div class="text-wrapper">
            <span class="text">
				${detail.plotText}
            </span>
            <!-- 더보기, 줄이기 텍스트 -->
            <span class="more-text">더보기</span>
            <span class="less-text">줄이기</span>
          </div>
        </div>
      </div>
    </div>

    <main id="main">
      <div class="still"><h2>스틸컷</h2></div>

      <section id="sliderType01">
        <div class="slider__wrap">
          <div class="slider__img">
            <div class="slider__inner">
              <c:forEach var="stll" items="${detail.stllList}">
	              <div class="slider">
	                <img
	                  src="${stll}"
	                  alt="스틸이미지"
	                />
	              </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </section>
    </main>

    <div class="container">
      <div class="row">
        <div class="col-xs-12 content-wrap">
          <form method="post">
            <div>
              <h2 class="review">
                ------------------------------ review
                -----------------------------
              </h2>
            </div>
            <table class="table">
              <tbody class="t-control">
                <tr>
                  <td>유훈모</td>
                </tr>
                <tr>
                  <td>
                    <textarea
                      placeholder="내용을 입력하세요."
                      class="form-control"
                      rows="7"
                      name="content"
                    ></textarea>
                  </td>
                  <td>
                    <button
                      type="submit"
                      class="btn"
                    >
                      등록
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </form>

          <table class="table table-bordered">
            <tbody>
              <c:forEach
                var="vo"
                items="${boardList}"
              >
                <tr>
                  <td>1</td>
                </tr>
                <tr>
                  <td>유훈모</td>
                </tr>
                <tr>
                  <td>남자친구어쩌구</td>
                </tr>
                <tr>
                  <td>23.11.03</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
  <script>
    // 코드에 필요한 요소들 변수에 할당
    const textWrapper = document.querySelector('.text-wrapper');
    const text = document.querySelector('.text');
    const moreText = document.querySelector('.more-text');
    const lessText = document.querySelector('.less-text');

    // 더보기 텍스트 클릭시 이벤트
    moreText.addEventListener('click', () => {
      moreText.style.display = 'none';
      lessText.style.display = 'inline-block';
      text.style.display = 'inline-block';
    });

    // 줄이기 텍스트 클릭시 이벤트
    lessText.addEventListener('click', () => {
      lessText.style.display = 'none';
      moreText.style.display = 'inline-block';
      text.style.display = '-webkit-box';
    });

    const sliderWrap = document.querySelector('.slider__wrap');
    const sliderImg = document.querySelector('.slider__img'); // 보여지는 영역
    const sliderInner = document.querySelector('.slider__inner'); // 움직이는 영역
    const slider = document.querySelectorAll('.slider'); // 각각의 이미지

    let currentIndex = 0; // 현재 보이는 이미지
    let sliderCount = slider.length; // 이미지 갯수
    let sliderWidth = sliderImg.offsetWidth; // 이미지 가로값
    let sliderClone = sliderInner.firstElementChild.cloneNode(true); // 첫번째 이미지 복사
    sliderInner.appendChild(sliderClone); // 첫번째 이미지를 마지막에 넣어줌

    function sliderEffect() {
      currentIndex++;
      sliderInner.style.transition = 'all 0.6s';

      sliderInner.style.transform =
        'translateX(-' + sliderWidth * currentIndex + 'px)';

      // sliderInner.style.transform = "translateX(-600px)";      600*1
      // sliderInner.style.transform = "translateX(-1200px)";     600*2
      // sliderInner.style.transform = "translateX(-1800px)";     600*3
      // sliderInner.style.transform = "translateX(-2400px)";     600*4
      // sliderInner.style.transform = "translateX(-3000px)";     600*5
      // sliderInner.style.transform = "translateX(-3600px)";     600*1

      // 마지막 사진에 위치했을 때
      if (currentIndex == sliderCount) {
        setTimeout(() => {
          sliderInner.style.transition = '0s';
          sliderInner.style.transform = 'translateX(0px)';
        }, 700);

        currentIndex = 0;
      }
    }
    setInterval(sliderEffect, 2000);
  </script>
</html>
