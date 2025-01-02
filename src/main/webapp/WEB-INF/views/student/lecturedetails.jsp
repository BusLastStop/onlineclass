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
<title>강의 상세 페이지</title>
<style>
	*{
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 500;
		font-style: normal;
		/* border:1px solid #ff8a65; */
		color:#212121;
	}
	h1{
		font-size:48px;
		text-align:center;
		padding:5px;
		border:1px solid #ff8a65;
		margin:0;
	}
	img{
		width:80%;
		margin:auto;
	}
	div{
		border:1px solid #ff8a65;
	}
	button{
		width:95px;
		height:35px;
		font-size:16px;
		background-color:#ffccbd;
		border:1px solid #ff8a65;
	}
	h4{
		padding:3px 3px 3px 6px;
		border-bottom:1px solid #ff8a65;
		margin:0;
	}
	ul{
		padding-left:30px;
		border-bottom:1px solid #ff8a65;
		margin:0;
	}
	p{
		padding-left:3px;
		margin:3px;
	}
	table{
		width:100%;
	}
	tr:nth-child(2n){
		background-color:#ffccbd;
	}
	tr td:nth-child(1){
		width:15%;
		text-align:center;
	}
	tr td:nth-child(2){
		width:75%;
		padding-left:3px;
	}
	tr td:nth-child(3){
		width:10%;
		text-align:center;
	}
</style>
</head>
<body>
	<h1>${lecture.lecName}</h1>
	<div style="text-align:center;border:0;">
		<img src="${pageContext.request.contextPath}/resources/images/community.png" alt="강의 사진">
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div style="display:flex;justify-content:space-around;align-items:center;padding:5px;border:0;">
			<button id="registLecture" onclick="confirm('수강신청 하시겠습니까?')?location.assign('${pageContext.request.contextPath}/student/registlecture.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}'):'';">수강신청</button>
			<button id="cancelRegist" onclick="confirm('수강신청을 취소하시겠습니까?')?location.assign('${pageContext.request.contextPath}/student/cancleregist.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}'):''" style="display:none;">수강취소</button>
			<button id="interestedLecture" onclick="interestedLecture();">관심강의</button>
			<button id="interestedTeacher" onclick="interestedTeacher();">관심강사</button>
			<button>수업계획서</button>
		</div>
	</c:if>
	<div>
		<h4>수업 개요</h4>
		<p>수업 개요에 대한 내용을 적는 곳</p>
	</div>
	<div>
		<h4>수업 목차</h4>
		<ul>
			<li>목차</li>
			<li>목차</li>
			<li>목차</li>
		</ul>
		<h4>수업 방향</h4>
		<p>수업 방향에 대한 내용을 적는 곳</p>
	</div>
	<div>
		<h4>강사소개</h4>
		<p>강사 소개에 대한 내용을 적는 곳</p>
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div>
			<h4>강의후기</h4>
			<c:if test="${not empty lecture.review}">
				<table>
					<c:forEach var="review" items="${lecture.review}">
						<tr>
							<td>${review.student.stuName}</td>
							<td>${review.revComment}</td>
							<td>${review.revDateTime}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</c:if>
	<div style="display:flex;justify-content:space-around;align-items:center;padding:5px;border:0;">
		<c:if test="${not empty sessionScope.user}">
			<button id="registLectureBottom" onclick="confirm('수강신청 하시겠습니까?')?location.assign('${pageContext.request.contextPath}/student/registlecture.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}'):'';">수강신청</button>
			<button id="cancelRegistBottom" onclick="confirm('수강신청을 취소하시겠습니까?')?location.assign('${pageContext.request.contextPath}/student/cancleregist.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}'):''" style="display:none;">수강취소</button>
		</c:if>
		<button onclick="window.close();">나가기</button>
	</div>
	<script>
		const interestedLecture=()=>{
			$.post("${pageContext.request.contextPath}/student/interestedlecture.do",{stuCode:${user.userinfo.stuCode},lecCode:${lecture.lecCode}},data=>{
				if(data!=""){
					const color = data.split(",");
					document.getElementById("interestedLecture").style.backgroundColor=color[0];
					document.getElementById("interestedLecture").style.borderColor=color[1];
				}else{
					alert("오류!");
				}
			});
		};
		
		const interestedTeacher=()=>{
			$.post("${pageContext.request.contextPath}/student/interestedteacher.do",{stuCode:${user.userinfo.stuCode},teaCode:${lecture.teacher.teaCode}},data=>{
				if(data!=""){
					const color = data.split(",");
					document.getElementById("interestedTeacher").style.backgroundColor=color[0];
					document.getElementById("interestedTeacher").style.borderColor=color[1];
				}else{
					alert("오류!");
				}
			});
		};
		
		$.post("${pageContext.request.contextPath}/student/checkinterestedlecture.do",{stuCode:${user.userinfo.stuCode},lecCode:${lecture.lecCode}},data=>{
			if(data!=""){
				const color = data.split(",");
				document.getElementById("interestedLecture").style.backgroundColor=color[0];
				document.getElementById("interestedLecture").style.borderColor=color[1];
			}else{
				alert("오류!");
			}
		});
		
		$.post("${pageContext.request.contextPath}/student/checkinterestedteacher.do",{stuCode:${user.userinfo.stuCode},teaCode:${lecture.teacher.teaCode}},data=>{
			if(data!=""){
				const color = data.split(",");
				document.getElementById("interestedTeacher").style.backgroundColor=color[0];
				document.getElementById("interestedTeacher").style.borderColor=color[1];
			}else{
				alert("오류!");
			}
		});
		
		$.post("${pageContext.request.contextPath}/student/checkregistlecture.do",{stuCode:${user.userinfo.stuCode},lecCode:${lecture.lecCode}},data=>{
			if(data!=""){
				const display = data.split(",");
				document.getElementById("registLecture").style.display=display[0];
				document.getElementById("registLectureBottom").style.display=display[0];
				document.getElementById("cancelRegist").style.display=display[1];
				document.getElementById("cancelRegistBottom").style.display=display[1];
			}else{
				alert("오류!");
			}
		});
	</script>
</body>
</html>