<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    div#infoMenu{ width:40%;height:50px;display:flex;justify-content:space-around;align-items:center; }
</style>
<div id="infoMenu">
	<h3><a href="${pageContext.request.contextPath}/student/searchteacher.do">강사 탐색</a></h3>
	<h3><a href="${pageContext.request.contextPath}/student/sentrequest.do">보낸 개별 요청</a></h3>
	<h3><a href="${pageContext.request.contextPath}/student/waitreservation.do">대기 예약 목록</a></h3>
	<h3><a href="${pageContext.request.contextPath}/student/cancelreservation.do">나의 예약 취소</a></h3>
</div>