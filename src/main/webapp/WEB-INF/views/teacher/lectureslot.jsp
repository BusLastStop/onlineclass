<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section{
		height:100vh;
		display:flex;
		flex-direction:column;
		align-items:center;
	}
</style>
<section>
	<jsp:include page="/WEB-INF/views/teacher/realtimelectureheader.jsp"/>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>