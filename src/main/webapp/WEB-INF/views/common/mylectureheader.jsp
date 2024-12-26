<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    div#infoMenu{ width:40%;height:50px;display:flex;justify-content:space-around;align-items:center; }
</style>
<c:if test="${user.userType eq '학생'}">
	<div id="infoMenu">
		<h3><a href="${pageContext.request.contextPath}/member/mylecturelist.do">강의 목록</a></h3>
		<h3>관심 강의</h3>
		<h3>관심 강사</h3>
	</div>
</c:if>
<c:if test="${user.userType eq '강사'}">
	<div id="infoMenu">
		<h3><a href="${pageContext.request.contextPath}/member/mylecturelist.do">강의 목록</a></h3>
		<h3>과제 확인</h3>
		<h3>Q&A 댓글 작성</h3>
		<h3>학생 관리</h3>
	</div>
</c:if>