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
		<table>
			<tr>
				<td>과목</td>
				<td>Java</td>
			</tr>
			<tr>
				<td>영상</td>
				<td>파일 업로드</td>
			</tr>
			<tr>
				<td>시간</td>
				<td>01:00:00</td>
			</tr>
			<tr>
				<td>강의명</td>
				<td>XXXX</td>
			</tr>
			<tr>
				<td>강사명</td>
				<td>OOO</td>
			</tr>
			<tr>
				<td>키워드</td>
				<td>#자바 #Java</td>
			</tr>
		</table>
		<div id="btn-container">
			<button onclick="alert('테스트메세지!');window.close();">확인</button>
			<button onclick="window.close()";>취소</button>
		</div>
	</div>
</body>
</html>