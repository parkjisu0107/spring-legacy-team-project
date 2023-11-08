<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
        src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87407/87407_320.jpg"
      />
    </div>
    <div class="detail">
      <div class="detailposter">
        <img
          src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87407/87407_320.jpg"
        />
      </div>
      <div class="div2">
        <div class="details">
          <!-- 영화명 -->
          <p class="title1">30일</p>
          <!-- 영화명(영문) -->
          <p class="title2">Love Reset</p>
          <!-- 개봉 -->
          <p class="title3">개봉 &emsp; &emsp; 2023.10.3</p>
          <!-- 국가 -->
          <p class="title3">국가 &emsp; &emsp; 한국</p>
          <!-- 등급 -->
          <p class="title3">등급 &emsp; &emsp; 12세이상관람가</p>
          <!-- 장르 -->
          <p class="title3">장르 &emsp; &emsp; 코미디</p>
          <!-- 러닝타임 -->
          <p class="title3">러닝타임 &nbsp; 119분</p>
        </div>

        <div class="content">
          <h4>줄거리</h4>
          <div class="text-wrapper">
            <span class="text">
              “완벽한 저에게 신은 저 여자를 던지셨죠” 지성과 외모 그리고
              찌질함까지 타고난, '정열'(강하늘). “모기 같은 존재죠. 존재의
              이유를 모르겠는?”능력과 커리어 그리고 똘기까지 타고난,
              '나라'(정소민). 영화처럼 만나 영화같은 사랑을 했지만서로의
              찌질함과 똘기를 견디다 못해 마침내 완벽한 남남이 되기로
              한다.그러나!완벽한 이별을 딱 D-30 앞둔 이들에게 찾아온 것은
              줄거리끝 “완벽한 저에게 신은 저 여자를 던지셨죠” 지성과 외모
              그리고 찌질함까지 타고난, '정열'(강하늘). “모기 같은 존재죠.
              존재의 이유를 모르겠는?”능력과 커리어 그리고 똘기까지 타고난,
              '나라'(정소민). 영화처럼 만나 영화같은 사랑을 했지만서로의
              찌질함과 똘기를 견디다 못해 마침내 완벽한 남남이 되기로
              한다.그러나!완벽한 이별을 딱 D-30 앞둔 이들에게 찾아온 것은
              줄거리끝
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
              <div class="slider">
                <img
                  src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000087/87407/87407220141_727.jpg"
                  alt="이미지1"
                />
              </div>
              <div class="slider">
                <img
                  src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000087/87407/87407220485_727.jpg"
                  alt="이미지2"
                />
              </div>
              <div class="slider">
                <img
                  src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000087/87407/87407220407_727.jpg"
                  alt="이미지3"
                />
              </div>
              <div class="slider">
                <img
                  src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000087/87407/87407220330_727.jpg"
                  alt="이미지4"
                />
              </div>
              <div class="slider">
                <img
                  src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000087/87407/87407220329_727.jpg"
                  alt="이미지5"
                />
              </div>
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
