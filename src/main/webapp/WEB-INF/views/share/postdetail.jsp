<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section{ display:flex;flex-direction:column;align-items:center;min-height:700px; }
	div#board-title{ width:80%;padding:10px 0 10px 0; }
	div#board-title>h2{ display:inline-block;margin:0 0 10px 10%; }
	div#board-title p{ margin:0;text-align:center; }
	div#board-title>#board-category{ height:25px;margin:0 0 10px 10%; }
	div.left-side{ display:inline-block;text-align:left;margin-left:10%;width:10%; }
	div.left-side>*{ display:inline-block; }
	div.right-side{ display:inline-block;text-align:right;margin-right:9%;width:70%; }
	div.right-side>*{ display:inline-block; }
	div.board-container{ width:80%;min-height:600px; }
	div.board-container #content{
		padding:10px;
		margin:0;
		width:80%;
		min-height:400px;
		font-size:18px;
		font-family: "Nanum Gothic", sans-serif;
		font-weight: 400;
		font-style: normal;
	}
	div.board-container p{ padding:3px;margin:0; }
	div.board-container #post{ width:80%;min-height:400px;margin:auto; }
	div.board-container #comment{ display:flex;flex-direction:column;justify-content:center;align-items:center;margin-top:50px; }
	div.board-container #comment form{ display:flex;justify-content:center;align-items:center;margin-bottom:20px; }
	div.board-container #comment form button{ width:80px;height:50px;margin-left:15px; }
	div.board-container #comment table{ width:80%; }
	div#buttons{ height:50px; }
	div#buttons button{ width:50px; }
	div#comment>table tr{ height:40px; }
	div#comment>table .comment-title{ width:15%;text-align:center; }
	div#comment>table .comment-content{ width:60%;padding-left:5px; }
	div#comment>table .comment-date{ width:10%;text-align:center; }
	div#comment>table .comment-report{ width:5%;text-align:center; }
	div#comment>table .comment-delete{ width:5%;text-align:center; }
	div#comment>table .comment-reply{ width:5%;text-align:center; }
	div#comment>table .comment-reply button{ width:50px; }
	div#comment>table .comment-delete button{ width:50px; }
	div#comment>table .comment-report button{ width:50px; }
	div#write{ text-align:right; }
	div#write>button{ margin:3px 10% 3px 3px;width:70px;height:25px; }
	div#search{ display:flex;justify-content:center;align-items:center; }
	div#search>input{ width:40%;height:25px;margin:3px; }
	div#search>button{ width:50px; }
	div#search>select{ height:25px; }
	#pagination{ height:25px; }
	button{ background-color:#ffccbd;height:30px; }
	button.report{ background-color:#ff9e80 }
	.ql-size-small { font-size: 12px; }
	.ql-size-large { font-size: 24px; }
	.ql-size-huge { font-size: 32px; }
</style>
<section>
	<jsp:include page="/WEB-INF/views/common/shareheader.jsp"/>
	<div id="board-title">
		<h2>${post.posTitle}</h2><br>
		<div class="left-side">
			<p>${post.student.stuName}</p>
		</div>
		<div class="right-side">
			<!-- <p>조회 0</p>
			<p>댓글 0</p> -->
			<p>${post.posDateTime}</p>
		</div>
	</div>
	<div class="board-container">
		<div id="post">
			${post.posContent}
		</div>
		<div id="buttons">
			<div class="left-side">
				<button onclick="location.assign('${pageContext.request.contextPath}/share/post.do')">목록</button>
			</div>
			<div class="right-side">
				<c:if test="${not empty sessionScope.user}">
					<button class="report" onclick="alert('신고!')">신고</button>
				</c:if>
				<c:if test="false">	<!-- 관리자 또는 게시글 -->
					<button onclick="alert('수정!')">수정</button>
					<button onclick="alert('삭제!')">삭제</button>
				</c:if>
			</div>
		</div>
		<div id="comment">
			<form action="#" method="post">
				<textarea rows="3" cols="120" placeholder="댓글을 입력해 주세요"></textarea>
				<button type="submit">댓글 입력</button>
			</form>
			<table>
				<tr>
					<td class="comment-title">BS어마스터</td>
					<td class="comment-content">닉네임님~ 졸면 안돼요~</td>
					<td class="comment-date">2024-12-17</td>
					<c:if test="${not empty sessionScope.user}">
						<td></td>
						<td class="comment-reply"><button>답글</button></td>
						<!-- <td class="comment-delete"><button>삭제</button></td> -->
						<td class="comment-report"><button class="report">신고</button></td>
					</c:if>
				</tr>
				<tr>
					<td class="comment-title">닉네임몇글자까지가능</td>
					<td class="comment-content">나는 하루종일 잘 수 있는데</td>
					<td class="comment-date">2024-12-17</td>
					<c:if test="${not empty sessionScope.user}">
						<td></td>
						<td class="comment-reply"><button>답글</button></td>
						<!-- <td class="comment-delete"><button>삭제</button></td> -->
						<td class="comment-report"><button class="report">신고</button></td>
					</c:if>
				</tr>
			</table>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>