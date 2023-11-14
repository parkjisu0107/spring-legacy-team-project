<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/search.css" />
</head>
<body>

	<div class="keyword">KEYWORD : ${query}</div>

	<ul class="search">
		<c:forEach var="r" items="${result}">
			<li class="box_basic">
				<div class="item_related">
					<a
						href="${pageContext.request.contextPath}/movie/detail/${r.title}/${r.openDt}">
						<div class="info_poster">
							<img src="${r.poster}" />
						</div>
						<div class="info_detail">

							<div class="detail_tit">
								<h3>${r.title}</h3>
								<h5>${r.titleEng}</h5>
							</div>

							<div class="inner_cont">
								<dl class="list_cont">
									<dt>제작</dt>
									<dd>${r.prodYear}년도</dd>
								</dl>
								<dl class="list_cont">
									<dt>장르</dt>
									<dd>${r.type}/${r.genre}</dd>
								</dl>
								<dl class="list_cont">
									<dt>등급</dt>
									<dd>${r.rating}</dd>
								</dl>
								<dl class="list_cont">
									<dt>러닝타임</dt>
									<dd>${r.runtime}분</dd>
								</dl>
							</div>

						</div>
					</a>

				</div>
			</li>
		</c:forEach>
	</ul>

</body>
</html><%@ include file="../include/footer.jsp"%>
