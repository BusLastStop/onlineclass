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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<title>강사 상세 페이지</title>
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
	img#lecturePic{
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
	<h1>${teacher.tutorial.tutSubject}</h1><!-- 임시로 subject를 넣음 -->
	<div style="text-align:center;border:0;">
		<img src="${pageContext.request.contextPath}/resources/images/community.png" alt="강의 사진" id="lecturePic">
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div style="display:flex;justify-content:space-around;align-items:center;padding:5px;border:0;">
			<button id="registLecture" onclick="">수업일정</button>
			<button id="cancelRegist" onclick="confirm('수강신청을 취소하시겠습니까?')?location.assign('${pageContext.request.contextPath}/student/cancelregist.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}'):''" style="display:none;">수강취소</button>
			<button id="lectureList" onclick="">강의목록</button>
			<button id="interestedTeacher" onclick="interestedTeacher();">관심강사</button>
			<button>수업계획서</button>
		</div>
	</c:if>
	<div>
		<h4>수업 개요</h4>
		<p>수업 개요에 대한 내용을 적는 곳</p>
	</div>
	<div>
		<h4>수업 소개</h4>
		<p>대충 2~3줄 적어주세요! 😊</p>
	</div>
	<div style="display:flex;justify-content:space-around;border:0;">
		<img src="${pageContext.request.contextPath}/resources/images/teacher(${teacher.teaGender}).jpeg" alt="강의 사진" width="300px" height="300px">
		<div style="width:50%;">
			<p>
				<span>${teacher.teaName}</span>
				<span>/</span>
				<span>${teacher.teaUniversity}</span>
				<span>/</span>
				<span>${teacher.teaSubject}</span>
			</p>
			<br>
			<p>경력</p>
			<p>경력사항1</p>
			<p>경력사항2</p>
			<p>경력사항3</p>
			<p>경력사항4</p>
			<br>
			<p>연락처</p>
			<p>
				<span>${teacher.teaEmail}</span>
				<span>/</span>
				<span>${teacher.teaPhone}</span>
			</p>
		</div>
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div>
			<h4>강의후기</h4>
			<c:if test="${not empty teacher.tutorial.reviews}">
				<table>
					<c:forEach var="review" items="${teacher.tutorial.reviews}">
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
			<button id="registLectureBottom" onclick="">수강신청</button>
			<button id="cancelRegistBottom" onclick="confirm('수강신청을 취소하시겠습니까?')?location.assign('${pageContext.request.contextPath}/student/cancelregist.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}'):''" style="display:none;">수강취소</button>
		</c:if>
		<button onclick="window.close();">나가기</button>
	</div>
	<script>
		const interestedTeacher=()=>{
			$.post("${pageContext.request.contextPath}/student/interestedteacher.do",{stuCode:${user.userinfo.stuCode},teaCode:${teacher.teaCode}},data=>{
				if(data!=""){
					const color = data.split(",");
					document.getElementById("interestedTeacher").style.backgroundColor=color[0];
					document.getElementById("interestedTeacher").style.borderColor=color[1];
				}else{
					alert("오류!");
				}
			});
		};
		
		/* const registLecture=()=>{
			IMP.init("imp02587333");
			IMP.request_pay(
				{
					channelKey:"channel-key-a181aea8-d36b-4be3-8985-2cc2d0a01afb",
					pay_method:"card",
					merchant_uid:`test-${Math.floor(Math.random()*1000000000)}`,	// 임의의 값. 나중에 수정하기.
					name:"${lecture.lecCode}-${lecture.lecName}",
					amount:1,
					buyer_email: "gildong@gmail.com",
				    buyer_name: "홍길동",
				    buyer_tel: "010-4242-4242",
				    buyer_addr: "서울특별시 강남구 신사동",
				    buyer_postcode: "01181",
				},
				async (response) => {
					if (response.error_code != null) {
					    console.log(response.error_code);
					    return alert("결제에 실패하였습니다. 에러 내용: "+response.error_msg);
				    }
					if(response.success){
						location.assign("${pageContext.request.contextPath}/student/registlecture.do?lecCode=${lecture.lecCode}&stuCode=${user.userinfo.stuCode}");
					}else{
						alert("결제가 진행되지 않았습니다!");
					}
				}
			);
		}; */
		
		$.post("${pageContext.request.contextPath}/student/checkinterestedteacher.do",{stuCode:${user.userinfo.stuCode},teaCode:${teacher.teaCode}},data=>{
			if(data!=""){
				const color = data.split(",");
				document.getElementById("interestedTeacher").style.backgroundColor=color[0];
				document.getElementById("interestedTeacher").style.borderColor=color[1];
			}else{
				alert("오류!");
			}
		});
		
		/* $.post("${pageContext.request.contextPath}/student/checkregistlecture.do",{stuCode:${user.userinfo.stuCode},lecCode:${lecture.lecCode}},data=>{
			if(data!=""){
				const display = data.split(",");
				document.getElementById("registLecture").style.display=display[0];
				document.getElementById("registLectureBottom").style.display=display[0];
				document.getElementById("cancelRegist").style.display=display[1];
				document.getElementById("cancelRegistBottom").style.display=display[1];
			}else{
				alert("오류!");
			}
		}); */
	</script>
</body>
</html>