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
	<h1>강의 제목</h1>
	<div style="text-align:center;border:0;">
		<img src="${pageContext.request.contextPath}/resources/images/community.png" alt="강의 사진">
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div style="display:flex;justify-content:space-around;align-items:center;padding:5px;border:0;">
			<button>수강신청</button>
			<button>관심강의</button>
			<button>관심강사</button>
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
			<table>
				<tr>
					<td>닉네임닉네임</td>
					<td>후기</td>
					<td>2024-12-20</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>후기</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>후기</td>
					<td>날짜</td>
				</tr>
			</table>
		</div>
	</c:if>
	<div style="display:flex;justify-content:space-around;align-items:center;padding:5px;border:0;">
		<c:if test="${not empty sessionScope.user}">
			<button>수강신청</button>
		</c:if>
		<button onclick="window.close();">나가기</button>
	</div>
</body>
</html>