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

						<ul class="list_cont">
							<li class="sp">출연진</li>
							<c:forEach var="actor" items="${detail.actorList}">
								<li>${actor},</li>
							</c:forEach>
						</ul>
						<dl class="list_cont">
							<dt>제작사</dt>
							<dd>${detail.company}</dd>
						</dl>
						<dl class="list_cont">
							<dt>키워드</dt>
							<dd>${detail.keywords}</dd>
						</dl>
					</div>
				</div>
			</div>

		</div>

		<div class="plot">
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


	<div id="reply">
		<div class="categorize">
			<h4>review</h4>
		</div>
		<c:if test="${In == null}">
			<p>
				댓글을 작성하려면 로그인 해주세요. <a
					href="${pageContext.request.contextPath}/user/userIn">Login
					바로가기</a>
			</p>
		</c:if>
		<c:if test="${In != null}">
			<section class="replyForm">
				<form method="post"
					action="${pageContext.request.contextPath}/reply/detail">
					<div class="input_area">
						<input type="hidden" value="${reply.regDate}" /> <input
							type="hidden" value="${reply.replyNo}" /> <input type="hidden"
							name="userId" value="${In}"> <input type="hidden"
							name="movieId" value="${detail.movieId}" />
						<textarea name="content" id="content" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="input_area">
						<button type="submit" id="reply_btn">등록</button>
					</div>
				</form>
			</section>
		</c:if>
		<div class="getList"></div>
	</div>


<%@ include file="../include/footer.jsp"%>
<script>


window.onload = function() {
    
    // 함수 선언
    function fetchComments(movieId) {
    fetch('${pageContext.request.contextPath}/reply/' + movieId)
        .then(res => res.json())
        .then(data => {
            const getList = document.querySelector('.getList');
            data.forEach(reply => {
              const date = new Date(reply.regDate);
              const formattedDate = new Intl.DateTimeFormat('ko-KR', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
              }).format(date);
              
              const commentDiv = document.createElement('div');
              commentDiv.className = 'comment';
              commentDiv.innerHTML = `
              <div class="replydiv">
              <div>
              	<span class="rname">\${reply.userName}</span><span> (\${reply.userId})</span>
              </div>
              <div>\${reply.content}</div>
              <div class="rdate">\${formattedDate}</div>
              </div>

              `;            
 
          const deleteButton = createDeleteButton(reply.replyNo); // reply.replyNo는 댓글의 고유 ID라고 가정합니다.
          commentDiv.appendChild(deleteButton);  
              getList.appendChild(commentDiv);
              
            });
            console.log(getList);
        })
        .catch(error => {
            console.log('댓글을 불러오는 중 에러 발생: ', error);
        });
}
function createDeleteButton(replyNo) {
	  const deleteButton = document.createElement('button');
	  deleteButton.innerText = '삭제';
	  deleteButton.addEventListener('click', () => {
	    console.log(`${pageContext.request.contextPath}/reply/${detail.movieId}/\${replyNo}`);
	    fetch(`${pageContext.request.contextPath}/reply/${detail.movieId}/\${replyNo}`, {
	      method: 'DELETE'
	    })
	    .then(response => response.text())
	    .then(data => {
	        const commentDiv = deleteButton.parentElement;
	        commentDiv.remove();
	    })
	  });

	  return deleteButton;
	}
    // 페이지 로드 시 실행
        fetchComments("${detail.movieId}");
    };

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

  </body>
</html>


