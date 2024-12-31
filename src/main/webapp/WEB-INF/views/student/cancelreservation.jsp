<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section{
		height:80vh;
		min-height:500px;
		display:flex;
		flex-direction:column;
		align-items:center;
	}
	#teacher-container{
		width:80%;
		height:100%;
	}
	form#searchForm{ width:35%;max-height:30px;overflow:visible;margin:auto;margin-top:10px;margin-bottom:10px;z-index:15; }
	div#search{ display:flex; justify-content: center;align-items: center;width:100%;height:30px; }
	div#search *{ font-size:18px; }
	div#search a{ width:60px;height:30px;text-align:center;border:1px solid #ffccbc;border-radius:3px;background-color:#fbe9e7; }
	div#search input{ width:80%;height:25px;margin:0 10px 0 10px;border:1px solid #ffccbc;border-radius:3px; }
	div#search button{ width:60px;height:30px;border:1px solid #ffccbc;border-radius:3px;background-color:#fbe9e7; }
	div#filter{ position:absolute;display:none;justify-content:center;align-items:center;width:30%;min-width:400px;padding:15px;margin-top:10px;background-color:#fbe9e7;z-index:15; }
	div#filter>div.filter-container{ background-color:white;margin:5px; }
	.filter-container *{ margin:3px; }
	.subject{ min-width:160px;height:130px;border:1px solid #ffccbc;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.subject label{ margin:0; }
	.time{ width:140px;height:130px;border:1px solid #ffccbc;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.time div{ margin:0; }
	.searchName{ min-width:100px;height:130px;border:1px solid #ffccbc;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.searchName input{ width:85%;padding:0 0 0 3px;margin:0; }
	div#filter h4{ margin:5px;text-align:center;background-color:#ffccbc;width:90%;height:24px; }
	div#filter p{ margin:0;text-align:center; }
	#record-container{
		width:100%;
		padding:20px 0 20px 0;
		border-top:1px;
		border-bottom:1px;
		border-top-style:solid;
		border-bottom-style:solid;
		border-top-color:#ffccbc;
		border-bottom-color:#ffccbc;
		margin:20px 0 30px 0;
	}
	#recordList{ width:80%;margin:auto;z-index:-1; }
	#recordList .contents{ display:inline-block;width:23%;padding:0;margin:10px;z-index:-1;cursor:pointer; }
	.contents img{ width:60%;min-width:100px;max-height:180px;min-height:70px; }
	.contents h4{ margin:5px 0 5px 0; }
	.contents p{ margin:0; }
</style>
<section>
	<jsp:include page="/WEB-INF/views/student/realtimelectureheader.jsp"/>
	<div id="teacher-container">
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>