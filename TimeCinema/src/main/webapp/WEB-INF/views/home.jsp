<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<style>
		select {
			width: 100;
		}
	</style>
</head>
<body>
	<h1>
		Back In Time Cinema
	</h1>

	<div>
		<p>Sed ut perspiciatis unde omnis<br> iste natus error sit<br> voluptatem accusantium<br> doloremque laudantium, to</p>
	</div>

	<div>
		<select name="year" id="year"></select>
		<select name="month" id="month"></select>
		<select name="day" id="day"></select>
		<button id="travelBtn">GO</button>
	</div>
	
	<script>

		// year option 생성
		const $year = document.getElementById('year');
		const startYear = 1971;
		const endYear = new Date().getFullYear();
		const yearOption = setOptions($year, startYear, endYear);

		// month option 생성
		const $month = document.getElementById('month');
		const monthOption = setOptions($month, 1, 12);

		// day option 생성
		const $day = document.getElementById('day');
		setOptions($day, 1, 31);

		// 년, 월에 따라 일 범위 변경 이벤트
		$month.onchange = function(e){
			console.log(e.target.options[$month.selectedIndex].value);
			const selectedYear = e.target.options[$year.selectedIndex].value;
			const selectedMonth = e.target.options[$month.selectedIndex].value;
			const endDate = new Date(selectedYear, selectedMonth, 0).getDate();
			setOptions($day, 1, endDate);
		}

		// select option 반복문 함수
		function setOptions(target, start, end){

			for(let i=start; i<=end; i++){
				target.options[target.options.length] = new Option(i, i);
			}

		}

		// 버튼 클릭 시 이벤트
		document.getElementById('travelBtn').onclick = function(){
			const year = $year.options[$year.selectedIndex].value;
			const month = $month.options[$month.selectedIndex].value;
			const day = $day.options[$day.selectedIndex].value;

			if(year<2011){
				location.href = '${pageContext.request.contextPath}/retro/' + year + '/' + month + '/' + day;
			} else {
				location.href = '${pageContext.request.contextPath}/now/' + year + '/' + month + '/' + day;
			}

		}


	</script>

</body>
</html>
