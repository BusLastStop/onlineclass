<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section{
		display:flex;
		flex-direction:column;
		align-items:center;
		width:80%;
		height:70vh;
		min-width:500px;
		min-height:500px;
		margin:auto;
	}
</style>
<section>
	<jsp:include page="/WEB-INF/views/common/mypageheader.jsp"/>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>