<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    div#infoMenu{ width:40%;height:50px;display:flex;justify-content:space-around;align-items:center; }
</style>
<div id="infoMenu">
	<h3><a href="${pageContext.request.contextPath}/member/mypage.do">나의 정보</a></h3>
	<h3>알람 설정</h3>
	<c:if test="${user.userType eq '학생'}">
		<h3>나의 결제</h3>
		<h3><a href="${pageContext.request.contextPath}/student/mypost.do">내가 쓴 글</a></h3>
	</c:if>
	<c:if test="${user.userType eq '강사'}">
		<h3>나의 급여</h3>
		<h3><a href="${pageContext.request.contextPath}/teacher/myreply.do">내가 쓴 댓글</a></h3>
	</c:if>
</div>