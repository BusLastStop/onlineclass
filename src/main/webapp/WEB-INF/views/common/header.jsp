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
		/* border:1px solid #ff8a65; */
		color:#212121;
	}
	body{ overflow-y:scroll;overflow-x:hidden; }
	header{display:flex;flex-direction:column;align-items:center;}
	div#headerUser{display:flex;justify-content:flex-end;align-items:center;width:80%;padding:3px}
	div#headerMenu{display:flex; justify-content: space-around;align-items: center;width:80%}
	div#footer{display:flex;justify-content:space-around;align-items:center}
	#headerUser a{ margin-right:10px; }
	#headerMenu>*{cursor:pointer;}
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
				<a href="#" onclick="dropdownList()" id="userMenu">${user.userType}님</a>
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
		<h2><a href="${path}/member/recordlecturelist.do">녹화 강의</a></h2>
		<h2><a href="">실시간 강의</a></h2>
		<h2>나의 강의정보</h2>
		<h2>정보공유</h2>
		<h2>마이페이지</h2>
	</div>
	<script>
		const dropdownList=()=>{
			document.querySelectorAll(".dropdownList").forEach(v=>{
				console.log(v.style.display);
				if(v.style.display=="none" || v.style.display=="") v.style.display="block";
				else v.style.display="none";
			})
		}
	</script>
</header>