<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/search.css"
    />
</head>
<body>
<body>
    <ul class="search">
        <div class="keyword">키워드: ${query}</div>
        <li class="box_basic">
            <div class="item_related">
            	<c:forEach var="r" items="${result}">
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
                            <dd>${r.prodYear}</dd>
                        </dl>
                        <dl class="list_cont">
                            <dt>장르</dt>
                            <dd>${r.type}/ ${r.genre}</dd>
                        </dl>
                        <dl class="list_cont">
                            <dt>등급</dt>
                            <dd>${r.rating}</dd>
                        </dl>
                        <dl class="list_cont">
                            <dt>러닝타임</dt>
                            <dd>${r.runtime}</dd>
                        </dl>
                    </div>

                </div>
            	</c:forEach>
            </div>
        </li>
    </ul>
</body>
<%@ include file="../include/footer.jsp"%>
</html>