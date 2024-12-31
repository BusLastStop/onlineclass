<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    div#infoMenu{ width:40%;height:50px;display:flex;justify-content:space-around;align-items:center; }
</style>
<div id="infoMenu">
	<h3><a href="${pageContext.request.contextPath}/teacher/lectureslot.do">수업 슬롯</a></h3>
	<h3><a href="${pageContext.request.contextPath}/teacher/changereservation.do">예약 변경</a></h3>
	<h3><a href="${pageContext.request.contextPath}/teacher/recievedrequestlist.do">받은 개별 요청 목록</a></h3>
	<h3><a href="${pageContext.request.contextPath}/teacher/uploadlecturedata.do">수업 자료 업로드</a></h3>
</div>