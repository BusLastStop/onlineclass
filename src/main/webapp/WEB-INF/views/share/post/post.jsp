<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section{ display:flex;flex-direction:column;align-items:center;min-height:700px; }
	div#boardList{ width:80%;min-height:600px;}
	div#boardList>h2{ display:inline-block;margin:10px 0 10px 10%; }
	div#boardList>table{ margin:auto;width:80%; }
	div#boardList>#board-category{ height:25px;margin:0 0 10px 10%; }
	table .category{ width:10%;text-align:center; }
	table .title{ width:auto;padding-left:5px; }
	table .nickname{ width:10%;padding-left:5px; }
	table .date{ width:10%;padding-left:5px; }
	table .readCount{ width:5%;text-align:center; }
	table .commentCount{ width:5%;text-align:center; }
	div.board-container{ width:80%; }
	div#write{ text-align:right;height:30px; }
	div#write>button{ margin:0 10% 0 3px;width:70px;height:30px; }
	div#search{ display:flex;justify-content:center;align-items:center; }
	div#search>input{ width:40%;height:25px;margin:3px; }
	div#search>button{ width:50px;height:30px; }
	div#search>select{ height:25px; }
	.pagination{ display:flex;justify-content:center;align-items:center;height:25px; }
	.page-item{ display:inline-block; }
	p{ margin:0;text-align:center; }
	button{ background-color:#ffccbd;border-radius:3px; }
</style>
<section>
	<jsp:include page="/WEB-INF/views/common/shareheader.jsp"/>
	<div id="boardList">
		<h2>전체 글보기</h2><br>
		<select id="board-category">
			<option value="category">카테고리</option>
		</select>
		<table>
			<c:if test="${not empty postList}">
				<c:forEach var="post" items="${postList}">
					<tr>
						<td class="category">카테고리</td>
						<td class="title"><a href="${path}/share/postdetail.do?posCode=${post.posCode}">${post.posTitle}</a></td>
						<td class="nickname">${post.student.stuName}</td>
						<td class="date">${post.posDateTime}</td>
						<td class="readCount">조회수</td>
						<td class="commentCount">댓글수</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<%-- <table>
			<tr>
				<td class="category">카테고리</td>
				<td class="title"><a href="${path}/share/postdetail.do">게시글 확인 페이지 들어가기</a></td>
				<td class="nickname">닉네임</td>
				<td class="date">날짜</td>
				<td class="readCount">조회수</td>
				<td class="commentCount">댓글수</td>
			</tr>
			<tr>
				<td class="category">카테고리</td>
				<td class="title">제목</td>
				<td class="nickname">닉네임</td>
				<td class="date">날짜</td>
				<td class="readCount">조회수</td>
				<td class="commentCount">댓글수</td>
			</tr>
		</table> --%>
	</div>
	<div class="board-container">
		<div id="write">
			<c:if test="${user.userType eq '학생'}">
				<button onclick="location.assign('${path}/post/postwrite.do')">글쓰기</button>
			</c:if>
		</div>
		${pageBar}
		<div id="search">
			<select>
				<option>게시글 제목</option>
			</select>
			<input type="text" placeholder="검색어를 입력하세요">
			<button type="submit">검색</button>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>