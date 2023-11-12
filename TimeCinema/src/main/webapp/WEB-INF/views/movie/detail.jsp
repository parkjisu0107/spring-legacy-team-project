<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<!-- link file css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css" />

<!-- Link font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet" />

<title></title>
</head>
<body>

	<div class="detail">

		<div class="box_basic">
			<div class="info_poster">
				<img src="${detail.poster}" />
			</div>
			<div class="info_detail">
				<div class="detail_tit">
					<h3>${detail.title}</h3>
					<h5>${detail.titleEng}</h5>
				</div>
				<div class="detail_cont">
					<div class="inner_cont">
						<dl class="list_cont">
							<dt>개봉</dt>
							<dd>${detail.openDt}</dd>
						</dl>
						<dl class="list_cont">
							<dt>장르</dt>
							<dd>${detail.type}/${detail.genre}</dd>
						</dl>
						<dl class="list_cont">
							<dt>국가</dt>
							<dd>${detail.nation}</dd>
						</dl>
						<dl class="list_cont">
							<dt>등급</dt>
							<dd>${detail.rating}</dd>
						</dl>
						<dl class="list_cont">
							<dt>러닝타임</dt>
							<dd>${detail.runtime}분</dd>
						</dl>
					</div>
					<div class="inner_cont ic2">
						<dl class="list_cont">
							<dt>감독</dt>
							<dd>${detail.directorNm}</dd>
						</dl>
						<dl class="list_cont">
							<dt>출연진</dt>
							<dd>
								<c:forEach var="actor" items="${detail.actorList}">
									${actor}
								</c:forEach>
							</dd>
						</dl>
						<dl class="list_cont">
							<dt>제작사</dt>
							<dd>${detail.company}</dd>
						</dl>
						<dl class="list_cont">
							<dt>키워드</dt>
							<dd># ${detail.keywords}</dd>
						</dl>
					</div>
				</div>
			</div>

		</div>

		<div class="content">
			<div class="categorize">
				<h4>줄거리</h4>
			</div>
			<div class="text-wrapper">
				<span class="text"> ${detail.plotText} </span>
				<!-- 더보기, 줄이기 텍스트 -->
				<span class="more-text">더보기</span> <span class="less-text">줄이기</span>
			</div>
		</div>

	</div>


	<div class="stillcut">
		<div class="categorize">
			<h4>스틸컷</h4>
		</div>

		<div class="slide_wrapper ">

			<ul class="slides flex">

				<c:forEach var="stll" items="${detail.stllList}">
					<li><img src="${stll}" alt="스틸이미지" /></li>
				</c:forEach>
			</ul>
			<p class="controls">
				<span class="prev"><i class="fas fa-chevron-left"></i></span> <span
					class="next"><i class="fas fa-chevron-right"></i></span>
			</p>
		</div>

	</div>





	<div class="container">
		<div class="categorize">
			<h4>review</h4>
		</div>
		<div class="review">

			<div class="reviewinput">
				<div>
					<span>유훈모</span> <span>humno@gmail.com</span>
				</div>
				<div>
					<textarea name="" id="" cols="30" rows="10"
						placeholder="내용을 입력하세요."></textarea>
				</div>
			</div>

			<div class="reviewlist">
				<div>
					<span>유훈모</span> <span>(humno@gmail.com)</span>
				</div>
				<div>남자친구와 헤어졌습니다,,,,,</div>
				<div>2023.11.10</div>
			</div>

		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
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


        /* 예고편 */
        function play() {

            var mvideo = document.getElementById("mvideo");
            mvideo.play();

        }

        /* 스틸컷 */
        var slides = document.querySelector('.slides'),
            slide = document.querySelectorAll('.slides li'),
            currentIdx = 0,
            slideCount = slide.length,
            slideWidth = 300,
            slideMargin = 30,
            prevBtn = document.querySelector('.prev'),
            nextBtn = document.querySelector('.next');

        slides.style.width =
            (slideWidth + slideMargin) * slideCount - slideMargin + 'px';

        function moveSlide(num) {
            slides.style.left = -num * 330 + 'px';
            currentIdx = num;
        }

        nextBtn.addEventListener('click', function () {
            if (currentIdx < slideCount - 3) {
                moveSlide(currentIdx + 1);
            } else {
                moveSlide(0);
            }
        });

        prevBtn.addEventListener('click', function () {
            if (currentIdx > 0) {
                moveSlide(currentIdx - 1);
            } else {
                moveSlide(slideCount - 3);
            }
        });
    </script>
</html>
