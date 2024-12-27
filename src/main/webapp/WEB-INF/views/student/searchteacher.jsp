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
</style>
<section>
	<jsp:include page="/WEB-INF/views/student/realtimelectureheader.jsp"/>
	<div id="teacher-container">
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>