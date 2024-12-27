<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${path}/resources/images/red.png" type="image/x-icon"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>관리자 강의 목록 대시보드</title>
<style>
	body{
		margin:0;
	}
	#dashboard-menu{
		display:flex;
		flex-direction:column;
		justify-content:flex-start;
		align-items:center;
		text-align:center;
		width:10%;
		height:100vh;
		border-right:1px solid #ff8a65;
	}
	#dashboard-menu>*{
		width:100%;
		border-bottom:1px solid #ff8a65;
	}
	#dashboard-menu>h3{
		padding:20px 0 20px 0;
		margin:0;
	}
	#lecture-dashboard{
		width:90%;
		text-align:center;
	}
	#lecture-dashboard>h1{
		font-size:48px;
	}
	#lecture-dashboard table{
		font-size:20px;
	}
	#lecture-dashboard tr:first-child>th{
		background-color:#ffab91;
	}
	#lecture-dashboard tr:nth-child(2n+1)>td{
		background-color:#ffccbc;
	}
	div#btn-container{
		width:80%;
		text-align:right;
		padding-top:25px;
		margin:auto;
	}
	button{
		width:80px;
		height:25px;
		border:1px solid #ff8a65;
		background-color:#ffccbd;
	}
</style>
</head>
<body>
	<div style="display:flex;">
		<div id="dashboard-menu">
			<div>
				<a href="${pageContext.request.contextPath}" style="height:60px;"><img src="${pageContext.request.contextPath}/resources/images/red.png" width="100" height="60"></a>	
			</div>
			<h3 onclick="lectureinfo();">강의 정보</h3>
			<h3 onclick="lectureupload();">강의 업로드 승인</h3>
			<h3>녹화 강의 영상</h3>
			<h3>실시간 강의 링크</h3>
		</div>
		<div id="lecture-dashboard">
			<h1>강의 정보</h1>
			<div style="display:inline-block;">
				<table>
					<tr>
						<th>강의 번호</th>
						<th>수업 종류</th>
						<th>과목</th>
						<th>강의명</th>
						<th>수업료</th>
						<th>기간 / 일시</th>
						<th>총 누적 시간(1인 평균 시간)/동일 매칭 횟수</th>
						<th>수강 인원</th>
						<th>학생 번호</th>
						<th>강사 번호</th>
					</tr>
					<tr>
						<th colspan=10 style="height:3px;"></th>
					</tr>
					<tr>
						<td>SEM00001</td>
						<td>실시간 강의</td>
						<td>JAVA</td>
						<td>1:1</td>
						<td>\10,000</td>
						<td>2024.12.08 10:00~12:00</td>
						<td>68회</td>
						<td>1</td>
						<td>STU00001</td>
						<td>TEA00001</td>
					</tr>
					<tr>
						<td>SEM00002</td>
						<td>실시간 강의</td>
						<td>SQL</td>
						<td>1:n</td>
						<td>\10,000</td>
						<td>2024.12.09 10:00~12:00</td>
						<td>42회</td>
						<td>5</td>
						<td>STU00002, STU00003,...</td>
						<td>TEA00002</td>
					</tr>
					<tr>
						<td>SEM00001</td>
						<td>실시간 강의</td>
						<td>JAVA</td>
						<td>1:1</td>
						<td>\10,000</td>
						<td>2024.12.08 10:00~12:00</td>
						<td>68회</td>
						<td>1</td>
						<td>STU00001</td>
						<td>TEA00001</td>
					</tr>
					<tr>
						<td>SEM00002</td>
						<td>실시간 강의</td>
						<td>SQL</td>
						<td>1:n</td>
						<td>\10,000</td>
						<td>2024.12.09 10:00~12:00</td>
						<td>42회</td>
						<td>5</td>
						<td>STU00002, STU00003,...</td>
						<td>TEA00002</td>
					</tr>
					<tr>
						<td>SEM00001</td>
						<td>실시간 강의</td>
						<td>JAVA</td>
						<td>1:1</td>
						<td>\10,000</td>
						<td>2024.12.08 10:00~12:00</td>
						<td>68회</td>
						<td>1</td>
						<td>STU00001</td>
						<td>TEA00001</td>
					</tr>
					<tr>
						<td>SEM00002</td>
						<td>실시간 강의</td>
						<td>SQL</td>
						<td>1:n</td>
						<td>\10,000</td>
						<td>2024.12.09 10:00~12:00</td>
						<td>42회</td>
						<td>5</td>
						<td>STU00002, STU00003,...</td>
						<td>TEA00002</td>
					</tr>
				</table>
			</div>
			<div id="btn-container">
				<button>신규 작성</button>
			</div>
		</div>
	</div>
	<script>
		const lectureinfo=()=>{
			$.post("${path}/admin/lecturelist.do",{menu:"info"},data=>{
				const $h1 = $("<h1>").text("강의 정보");
				const $div = $("<div>").css("display","inline-block");
				const $table = $("<table>");
				let $tr = $("<tr>");
				let $th = $("<th>").text("강의 번호")
				$tr.append($th);
				$th = $("<th>").text("수업 종류")
				$tr.append($th);
				$th = $("<th>").text("과목")
				$tr.append($th);
				$th = $("<th>").text("강의명")
				$tr.append($th);
				$th = $("<th>").text("수업료")
				$tr.append($th);
				$th = $("<th>").text("기간 / 일시")
				$tr.append($th);
				$th = $("<th>").text("총 누적 시간(1인 평균 시간)/동일 매칭 횟수")
				$tr.append($th);
				$th = $("<th>").text("수강 인원")
				$tr.append($th);
				$th = $("<th>").text("학생 번호")
				$tr.append($th);
				$th = $("<th>").text("강사 번호")
				$tr.append($th).appendTo($table);
				/* if(data!=null){
					data.forEach(info=>{
						$tr = $("<tr>");
						info.forEach(v=>{
							const $td = $("<td>").text(v);
							$tr.append($td);
						});
						$table.append($tr);
					});
				} */
				$div.append($table);
				$("#lecture-dashboard").html("");
				$("#lecture-dashboard").append($h1);
				$("#lecture-dashboard").append($div);
			});
		}
		const lectureupload=()=>{
			$.post("${path}/admin/lecturelist.do",{menu:"upload"},data=>{
				console.log(data);
				const $h1 = $("<h1>").text("업로드 요청 목록");
				const $div = $("<div>").css("display","inline-block");
				const $table = $("<table>");
				let $tr = $("<tr>");
				let $th = $("<th>").text("요청 코드");
				$tr.append($th);
				$th = $("<th>").text("녹화 강의 코드");
				$tr.append($th);
				$th = $("<th>").text("강사 코드(강사명으로 해도 됨 근데 귀찮다)");
				$tr.append($th).appendTo($table);
				/* if(data!=null){
					data.forEach(upload=>{
						$tr = $("<tr>");
						upload.forEach(v=>{
							const $td = $("<td>").text(v);
							$td.append($td);
						});
						$table.append($tr);
					});
				} */
				$div.append($table);
				$("#lecture-dashboard").html("");
				$("#lecture-dashboard").append($h1);
				$("#lecture-dashboard").append($div);
			});
		}
		const recordlecture=()=>{
			$.post("${path}/admin/lecturelist.do",{menu:"record"},data=>{
				const $h1 = $("<h1>").text("녹화 강의 목록");
				const $div = $("<div>").css("display","inline-block");
				/* if(data!=null){
					data.forEach(record=>{
						const recordContainer = $("<div>").css("display","inline-block");
						const $img = $("<img>").attr("src","");
						const title = $("<h4>").text("강의 제목");
						const container = $("<div>");
						const instructor = $("<h4>").text("강사명");
						const date = $("<h4>").text("날짜");
						container.append(instructor);
						container.append(date);
						recordContainer.append($img);
						recordContainer.append(title);
						recordContainer.append(container);
						$div.append(recordContainer);
					});
				} */
				$("#lecture-dashboard").html("");
				$("#lecture-dashboard").append($h1);
				$("#lecture-dashboard").append($div);
			});
		}
		const realtimelecture=()=>{
			$.post("${path}/admin/lecturelist.do",{menu:"realtime"},data=>{
				const $h1 = $("<h1>").text("녹화 강의 목록");
				const $div = $("<div>").css("display","inline-block");
				/* if(data!=null){
					data.forEach(record=>{
						const recordContainer = $("<div>").css("display","inline-block");
						const $img = $("<img>").attr("src","");
						const title = $("<h4>").text("강의 제목");
						const container = $("<div>");
						const instructor = $("<h4>").text("강사명");
						const date = $("<h4>").text("날짜");
						container.append(instructor);
						container.append(date);
						recordContainer.append($img);
						recordContainer.append(title);
						recordContainer.append(container);
						$div.append(recordContainer);
					});
				} */
				$("#lecture-dashboard").html("");
				$("#lecture-dashboard").append($h1);
				$("#lecture-dashboard").append($div);
			});
		}
	</script>
</body>
</html>