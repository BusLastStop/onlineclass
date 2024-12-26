<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    div#infoMenu{ width:40%;height:50px;display:flex;justify-content:space-around;align-items:center; }
</style>
<div id="infoMenu">
	<h3><a href="${pageContext.request.contextPath}/share/board.do">자유 게시판</a></h3>
	<h3>학원 정보</h3>
	<h3><a href="${pageContext.request.contextPath}/share/vote.do">투표</a></h3>
	<h3>입시 뉴스</h3>
</div>