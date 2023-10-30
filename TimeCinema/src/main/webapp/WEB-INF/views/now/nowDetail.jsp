<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <style>
body{
    margin-top: 100px;
    font-family: 'Trebuchet MS';
    line-height: 1.6
}

.container{
    width: 800px;
    margin: 0 auto;
}
.teb_menu{
    width: 800px;
    margin: 0 auto;
    text-align: center;
}

ul.tabs{
    margin: 0px;
    padding: 0px;
    list-style: none;
}
ul.list{
    margin: 0px;
    padding: 0px;
    list-style: none;
}

ul.tabs li{
    background: none;
    color: #222;
    display: inline-block;
    padding: 10px 15px;
    cursor: pointer;
}
ul.list li{
    background: none;
    color: #222;
    display: inline-block;
    padding: 10px 15px;
    cursor: pointer;
}

ul.tabs li.current{
    background: #ededed;
    color: #222;
}

.tab-content{
    display: none;
    background: #ededed;
    padding: 15px;
}

.tab-content.current{
    display: block;
}

.wrap {
    margin: auto;
    text-align: center;
}

.tab_menu{position:relative;}

.tab_menu .list{overflow:hidden;}

.tab_menu .list li{float:left; margin-right:100px;}

.tab_menu .list .btn{font-size:20px;}

.tab_menu .list .cont{display:none; position:absolute; background:#ededed; color:#222; text-align:center; width:790px; height:500px; line-height:100px;}

.tab_menu .list li.is_on .btn{font-weight:bold; color:black;}

.tab_menu .list li.is_on .cont{display:block;}
    </style>

<body>
<table>

    <div class="wrap" style="border: 1px dashed #000000; width: 340px; height: 350px; float: left;">포스터<img src="#"></div>

    <div class="wrap2">
			<thead>
				<h1>제목</h1>
                <h2>영문 제목</h2>
			</thead>
			<tr>
				<td><b>개봉</b></td>
				<td name="movie" property="premiere"></td>
			</tr>
			<tr>
				<td><b>장르</b></td>
				<td name="movie" property="genre"></td>
			</tr>
			<tr>
				<td><b>국가</b></td>
				<td name="movie" property="nation"></td>
			</tr>
			<tr>
				<td><b>등급</b></td>
				<td name="movie" property="rated"></td>
			</tr>
			<tr>
				<td><b>러닝타임</b></td>
				<td name="movie" property="runningtime "></td>
			</tr>
			<tr>
				<td><b>평점</b></td>
				<td name="movie" property="grade"></td>
			</tr>
            <tr>
				<td><b>누적관객</b></td>
				<td name="movie" property="attendance"></td>
			</tr>
            <tr>
				<td><b>박스오피스</b></td>
				<td name="movie" property="boxoffice"></td>
			</tr>

    </div>
		</table>

        <!-- <div class="container">

            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1">주요정보</li>
                <li class="tab-link" data-tab="tab-2">출연/제작</li>
                <li class="tab-link" data-tab="tab-3">영상/포토</li>
                <li class="tab-link" data-tab="tab-4">평점</li>
                
                <div id="tab-1" class="tab-content current">
                    화재로 어머니를 잃은 11살 소년 ‘마히토’는 아버지와 함께 어머니의 고향으로 간다. </br>
                    어머니에 대한 그리움과 새로운 보금자리에 적응하느라 힘들어하던 ‘마히토’ 앞에 정체를 알 수 없는 왜가리 한 마리가 나타나고, 저택에서 일하는 일곱 할멈으로부터 왜가리가 살고 있는 탑에 대한 신비로운 이야기를 듣게 된다. </br>
                    그러던 어느 날, ‘마히토’는 사라져버린 새엄마 ‘나츠코’를 찾기 위해 탑으로 들어가고, </br>
                    왜가리가 안내하는 대로 이세계(異世界)의 문을 통과하는데…!
                </div>
                <div id="tab-2" class="tab-content">
                    미야자키 하야오
                </div>
                <div id="tab-3" class="tab-content">
                    영상 아직 넣을지 말지 안정함.
                </div>
                <div id="tab-4" class="tab-content">
                    평점
            </ul>
        </div> -->
        
        </div><!-- container -->

        <div class="tab_menu">
            <ul class="list">
              <li class="is_on">
                <a href="#tab1" class="btn">주요정보</a>
                <div id="tab1" class="cont">화재로 어머니를 잃은 11살 소년 ‘마히토’는 아버지와 함께 어머니의 고향으로 간다. </br>
                    어머니에 대한 그리움과 새로운 보금자리에 적응하느라 힘들어하던 ‘마히토’ 앞에 정체를 알 수 없는 왜가리 한 마리가 나타나고, 저택에서 일하는 일곱 할멈으로부터 왜가리가 살고 있는 탑에 대한 신비로운 이야기를 듣게 된다. </br>
                    그러던 어느 날, ‘마히토’는 사라져버린 새엄마 ‘나츠코’를 찾기 위해 탑으로 들어가고, </br>
                    왜가리가 안내하는 대로 이세계(異世界)의 문을 통과하는데…!</div>
              </li>
              <li>
                <a href="#tab2" class="btn">출연/제작</a>
                <div id="tab2" class="cont">미야자키 하야오</div>
              </li>
              <li>
                <a href="#tab3" class="btn">영상/포토</a>
                <div id="tab3" class="cont">영상 아직 넣을지 말지 안정함.</div>
              </li>
              <li>
                <a href="#tab3" class="btn">평점</a>
                <div id="tab3" class="cont">평점</div>
              </li>
            </ul>
          </div>
          

        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

        <script>
            const tabList = document.querySelectorAll('.tab_menu .list li');
  
            for(var i = 0; i < tabList.length; i++){
                tabList[i].querySelector('.btn').addEventListener('click', function(e){
                e.preventDefault();
                for(var j = 0; j < tabList.length; j++){
                    tabList[j].classList.remove('is_on');
                }
                this.parentNode.classList.add('is_on');
                });
            }

            //상세 정보
            //function show(movieCd) {

                // console.log(movieCd);

            //     var url = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=f5eef3421c602c6cb7ea224104795888"
            //     url = url + "&movieCd=" + movieCd ;

            //     $.ajax({
            //         type : "GET", //요청방식
            //         url : url,
            //         success : function(data) {
            //             var str = "" ;
            //             str = str + "<h1>"+$(data).find("movieNm").text() + "</h1>";
            //             str = str + "<h2>"+$(data).find("movieNmEn").text() + "</h2>";
            //             str = str + "<td>"+$(data).find("showTm").text() + "</td>";
            //             str = str + "<td>"+$(data).find("openDt").text() + "</td>";
            //             str = str + "<td>"+$(data).find("nationNm").text() + "</td>";
            //             str = str + "<td>"+$(data).find("genreNm").text() + "</td>";
            //             $data.find("actor").each(function() {
            //                 str = str + "<td>" + $(this).find("peopleNm").text() + "</td>";
            //                 console.log(str);
            //             });
            //             str = str + "<td>"+$(data).find("actors").text() + "</td>";
            //             str = str + "<td>"+$(data).find("directors").text() + "</td>";
            //             str = str + "<td>"+$(data).find("watch_grade_nm").text() + "</td>";
            //         } ,
            //         error : function() {
            //             alert("자료를 가지고 올 수 없습니다.");
            //         }
            //     });


            // }
        </script>
</body>
</html>