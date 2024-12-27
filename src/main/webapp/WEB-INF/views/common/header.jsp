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
<style>
	*{
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 500;
		font-style: normal;
		border:1px solid #ff8a65;
		color:#212121;
	}
	body{ overflow-y:scroll;overflow-x:hidden; }
	header{display:flex;flex-direction:column;align-items:center;}
	div#headerUser{display:flex;justify-content:flex-end;align-items:center;width:80%;padding:3px}
	div#headerMenu{display:flex; justify-content: space-around;align-items: center;width:80%}
	div#footer{display:flex;justify-content:space-around;align-items:center}
	#headerUser a{ margin-right:10px; }
	#headerMenu *{cursor:pointer;min-width:75px;}
	#category{display:flex;padding:0;margin-right:5%;justify-contents:center;align-items:center;}
	#category>li{margin-left:10px;margin-right:10px}
	.writer-container{background-color:f5f5f5;}
	.writer-header{display:flex;justify-content:space-between;align-items:center;}
	ul>li{list-style-type:none;}
	a{ text-decoration:none; }
	.dropdown{ overflow:visible;max-height:24px;text-align:right;z-index:10; }
	.dropdown>ul{ padding:0;margin:10px 0 0 0;display:flex;flex-direction:column;justify-content:center;background-color:white; }
	.dropdown li{ padding:2px;text-align:center;width:90px;height:24px; }
	.dropdownList{ display:none;cursor:pointer; }
</style>
<title>온라인 강의 사이트</title>
</head>
<body>
<header>
	<c:if test="${empty sessionScope.user}">
		<div id="headerUser">
			<a href="${path}/member/loginpage.do">로그인</a>
			<a href="${path}/member/enrollpage.do">회원가입</a>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.user}">
		<div id="headerUser">
			<div class="dropdown">
				<a href="#" onclick="dropdownList()" id="userMenu">
					<c:if test="${user.userType eq '학생'}">
						${user.userinfo.stuName}님
					</c:if>
					<c:if test="${user.userType eq '강사'}">
						${user.userinfo.teaName}님
					</c:if>
				</a>
				<ul>
					<li class="dropdownList">마이페이지</li>
					<li class="dropdownList">알림</li>
				</ul>
			</div>
			<a href="${path}/member/logout.do">로그아웃</a>
		</div>
	</c:if>
	<div id="headerMenu">
		<a href="${path}" style="height:60px;"><img src="${path}/resources/images/red.png" width="100" height="60"></a>
		<h2>
			<c:if test="${empty sessionScope.user || sessionScope.user.userType=='학생'}">
				<a href="${path}/member/recordlecturelist.do">녹화 강의</a>
			</c:if>
			<c:if test="${not empty sessionScope.user && sessionScope.user.userType=='강사'}">
				<a href="#" onclick="window.open('${path}/teacher/lectureupload.do','_blank','width=500,height=400')">녹화 강의</a>
			</c:if>
		</h2>
		<h2><a href="${path}/member/realtimelecturelist.do">실시간 강의</a></h2>
		<h2><a href="${path}/member/mylecturelist.do">나의 강의정보</a></h2>
		<h2><a href="${path}/share/post.do">정보공유</a></h2>
		<h2><a href="${path}/member/mypage.do">마이페이지</a></h2>
	</div>
	<script>
		const dropdownList=()=>{
			document.querySelectorAll(".dropdownList").forEach(v=>{
				console.log(v.style.display);
				if(v.style.display=="none" || v.style.display=="") v.style.display="block";
				else v.style.display="none";
			})
		};
	</script>
</header>