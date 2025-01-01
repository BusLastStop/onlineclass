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
<title>강의 업로드 요청하기</title>
<style>
	*{
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 500;
		font-style: normal;
		/* border:1px solid #ff8a65; */
		color:#212121;
	}
	div#lecture-container{
		text-align:center;
	}
	#lecture-container table{
		 display:inline-block;
	}
	#lecture-container table td{
		width:50%;
		padding:5px 20px 5px 20px;
		background-color:#ffccbd;
	}
	#btn-container{
		display:flex;
		justify-content:space-around;
		align-items:center;
		margin:20px 0 20px 0;
	}
	#btn-container button{
		width:60px;
		height:30px;
		font-size:16px;
		background-color:#ffccbd;
		border:1px solid #ff8a65;
	}
</style>
</head>
<body>
	<div id="lecture-container">
		<h1>강의 업로드 요청</h1>
		<form action="${path}/teacher/lectureuploadend.do" method="post" onsubmit="return uploadResult();">
			<table>
				<tr>
					<td>과목</td>
					<td>
						<select name="subject" id="subject">
							<option selected disabled hidden>선택</option>
							<option value="Java">Java</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>영상</td>
					<td>
						<input type="file" name="uploadLecture" accept="video/*" id="uploadLecture">
					</td>
				</tr>
				<tr>
					<td>시간</td>
					<td><input type="text" name="lectureTime" id="lectureTime" value="00:00:00" readonly></td>
				</tr>
				<tr>
					<td>강의명</td>
					<td><input type="text" name="lectureTitle" id="lectureTitle"></td>
				</tr>
				<tr>
					<td>강사명</td>
					<td>
						<input type="hidden" name="teacherCode" value="${user.userinfo.teaCode}">
						<input type="text" name="teacherName" value="${user.userinfo.teaName}" readonly>
					</td>
				</tr>
				<tr>
					<td>키워드</td>
					<td>
						<input type="text" name="keyword" id="keyword" readonly>
						<input type="text" id="inputKeyword"><button type="button" id="addKeyword">추가</button>
					</td>
				</tr>
			</table>
			<div id="btn-container">
				<button type="submit">확인</button>
				<button type="reset" onclick="window.close()";>취소</button>
			</div>
		</form>
	</div>
	<script>
		if(${user==null}){
			alert("다시 로그인 해 주세요!");
			window.close();
		}
		const upload = document.getElementById("uploadLecture");
		upload.addEventListener("change",e=>{
			const file = upload.files[0];
			if(file){
				const fileURL = URL.createObjectURL(file);
				const videoElement = document.createElement("video");
				videoElement.style.display = "none";
				videoElement.src = fileURL;
				
				videoElement.onloadedmetadata = () => {
					const duration = videoElement.duration;
					const hours = Math.floor(duration / 60 / 60);
					const minutes = Math.floor(duration / 60 % 60);
					const seconds = Math.floor(duration % 60);
					
					document.getElementById("lectureTitle").value=file.name;
					if(hours>0){
						if(hours>=10) document.getElementById("lectureTime").value=hours+":";
						else document.getElementById("lectureTime").value="0"+hours+":";
					}
					if(minutes>=10) document.getElementById("lectureTime").value+=minutes+":";
					else document.getElementById("lectureTime").value+="0"+minutes+":";
					
					if(seconds>=10) document.getElementById("lectureTime").value+=seconds;
					else document.getElementById("lectureTime").value+="0"+seconds;
					
					URL.revokeObjectURL(fileURL);
					
					document.body.removeChild(videoElement);
				};
				document.body.appendChild(videoElement);
			}else{
				document.getElementById("lectureTitle").value="";
				document.getElementById("lectureTime").value="00:00:00";
			}
		});
		document.getElementById("addKeyword").addEventListener("click",e=>{
			const input = document.getElementById("inputKeyword").value;
			const keyword = document.getElementById("keyword");
			if(input!=""){
				if(keyword.value.includes(input)){
					console.log(input+" 존재함!");
				}else{
					if(keyword.value!=""){
						keyword.value+=","
					}
					keyword.value+="#"+input;
				}
			}
		});
		const uploadResult=()=>{
			const subject = document.getElementById("subject").value;
			const file = document.getElementById("uploadLecture").files[0];
			const title = document.getElementById("lectureTitle").value;
			if(subject=="선택"){
				alert("과목을 선택해 주세요!");
				return false;
			}
			if(file==null){
				alert("영상을 업로드해 주세요!");
				return false;
			}
			if(title==""){
				alert("영상 제목을 입력해주세요!");
				return false;
			}
		}
	</script>
</body>
</html>