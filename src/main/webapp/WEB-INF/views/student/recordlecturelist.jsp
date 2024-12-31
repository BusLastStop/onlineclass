<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	form#searchForm{ width:35%;max-height:30px;overflow:visible;margin:auto;margin-top:10px;z-index:15; }
	div#search{ display:flex; justify-content: center;align-items: center;width:100%;height:30px; }
	div#search *{ font-size:18px; }
	div#search a{ width:60px;height:30px;text-align:center;border:1px solid #ffccbc;border-radius:3px;background-color:#fbe9e7; }
	div#search input{ width:80%;height:25px;margin:0 10px 0 10px;border:1px solid #ffccbc;border-radius:3px; }
	div#search button{ width:60px;height:30px;border:1px solid #ffccbc;border-radius:3px;background-color:#fbe9e7; }
	div#filter{ position:absolute;display:none;justify-content:center;align-items:center;width:30%;min-width:400px;padding:15px;margin-top:10px;background-color:#fbe9e7;z-index:15; }
	div#filter>div.filter-container{ background-color:white;margin:5px; }
	.filter-container *{ margin:3px; }
	.subject{ min-width:160px;height:130px;border:1px solid #ffccbc;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.subject label{ margin:0; }
	.time{ width:140px;height:130px;border:1px solid #ffccbc;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.time div{ margin:0; }
	.searchName{ min-width:100px;height:130px;border:1px solid #ffccbc;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.searchName input{ width:85%;padding:0 0 0 3px;margin:0; }
	div#filter h4{ margin:5px;text-align:center;background-color:#ffccbc;width:90%;height:24px; }
	div#filter p{ margin:0;text-align:center; }
	#record-container{
		width:100%;
		padding:20px 0 20px 0;
		border-top:1px;
		border-bottom:1px;
		border-top-style:solid;
		border-bottom-style:solid;
		border-top-color:#ffccbc;
		border-bottom-color:#ffccbc;
		margin:20px 0 30px 0;
	}
	#recordList{ width:80%;margin:auto;z-index:-1; }
	#recordList .contents{ display:inline-block;width:23%;padding:0;margin:10px;z-index:-1;cursor:pointer; }
	.contents img{ width:60%;min-width:100px;max-height:180px;min-height:70px; }
	.contents h4{ margin:5px 0 5px 0; }
	.contents p{ margin:0; }
</style>
<section>
	<form id="searchForm" action="" method="get">
		<div id="search">
			<a href="#" onclick="openFilter();">필터</a>
			<input type="hidden" id="useFilter" name="useFilter" value="false">
			<input type="text" name="search">
			<button type="submit">검색</button>
		</div>
		<div id="filter">
			<div class="filter-container subject" style="display:flex;flex-direction:column;">
				<h4>과목</h4>
				<div style="display:flex;">
					<div style="display:flex;flex-direction:column;">
						<label><input type="checkbox" name="kor" value="국어">국어</label>
						<label><input type="checkbox" name="kor" value="영어">영어</label>
						<label><input type="checkbox" name="kor" value="수학">수학</label>
					</div>
					<div style="display:flex;flex-direction:column;">
						<label><input type="checkbox" name="kor" value="한국사">한국사</label>
						<label><input type="checkbox" name="kor" value="사회">사회</label>
						<label><input type="checkbox" name="kor" value="과학">과학</label>
					</div>
				</div>
			</div>
			<div class="filter-container time">
				<h4>시간</h4>
				<div style="display:flex;">
					<select name="hour">
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
					<p>시</p>
					<select name="minute">
						<option value="00">00</option>
						<option value="30">30</option>
					</select>
					<p>분</p>
				</div>
				<p>~</p>
				<div style="display:flex;">
					<select name="hour2">
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
					<p>시</p>
					<select name="minute2">
						<option value="00">00</option>
						<option value="30">30</option>
					</select>
					<p>분</p>
				</div>
			</div>
			<div class="filter-container searchName">
				<h4>강의명</h4>
				<input type="text" name="lectureName">
				<h4>강사명</h4>
				<input type="text" name="instructorName">
			</div>
		</div>
	</form>
	<div id="record-container">
		<div style="width:80%;margin:auto;">
			<h1>녹화강의 목록</h1>
		</div>
		<div id="recordList">
			<div class="contents" onclick="window.open('${path}/student/lecturedetails.do','_blank','width=1000,height=800');">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
			<div class="contents">
				<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
				<h4>녹화강의</h4>
				<div style="display:flex;">
					<p>강사명</p>
					<p>|</p>
					<p>날짜</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<p style="text-align:center;border:1px solid #ffccbc;margin:0;">페이지네이션</p>
	</div>
	<script>
		const openFilter=()=>{
			if($("#filter").css("display")=="none"){
				$("#filter").css("display","flex");
			}else{
				$("#filter").css("display","none");
			}
			if($("#useFilter").attr("value")=="false"){
				$("#useFilter").attr("value","true");
			}else{
				$("#useFilter").attr("value","false");
			}
		}
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>