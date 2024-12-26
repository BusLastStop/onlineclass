<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section{
		display:flex;
		flex-direction:column;
		align-items:center;
	}
	#content-container{
		width:80%;
		height:110%;
		min-height:1000px;
		max-height:1500px;
	}
	#content-container #title{
		width:90%;
		margin:auto;
	}
	div#boardList{ min-height:600px;}
	div#boardList>h2{ display:inline-block;margin:10px 0 10px 10%; }
	div#boardList>table{ margin:auto;width:90%; }
	div#boardList>#board-category{ height:25px;margin:0 0 10px 10%; }
	table .title{ width:auto;padding-left:5px; }
	table .nickname{ width:10%;padding-left:5px;text-align:center; }
	table .createDate{ width:10%;padding-left:5px;text-align:center; }
	table .closed{ width:5%;text-align:center; }
	#vote{
		width:90%;
		height:900px;
		margin:auto;
	}
	.content{
		display:inline-block;
		border:1px solid #fbe9e7;
		background-color:#fbe9e7;
		width:24%;
		height:400px;
		min-width:150px;
		margin:3px;
		margin-top:10px;
	}
	.content h3{
		text-align:center;
		background-color:#ffccbc;
		padding:5px;
		margin:0;
	}
	.content div{
		padding:5px;
		height:89%;
		display:flex;
		flex-direction:column;
		justify-content:space-evenly;
		align-items:center;
		background-color:#fbe9e7;
	}
	.content p{
		width:95%;
		height:85%;
		margin:5px;
		text-align:left;
	}
	.content button{
		width:70px;
		height:30px;
		background-color:#ffccbd;
		margin-top:3px;
	}
	button#vote-generator{
		width:70px;
		height:30px;
		margin:5px 10px 5px 0;
		background-color:#ffccbd;
		border-radius:3px;
	}
</style>
<section>
	<jsp:include page="/WEB-INF/views/common/shareheader.jsp"/>
	<div id="content-container">
		<div id="boardList">
			<div id="title">
				<h2>투표</h2>
			</div>
			<table>
				<tr>
					<td class="title"><a href="#">투표 확인 페이지 들어가기(링크 만들어야 함)</a></td>
					<td class="nickname">작성자</td>
					<td class="createDate">생성일</td>
					<td class="closed">마감여부</td>
				</tr>
				<tr>
					<td class="title">투표함 만들기(링크없음)</td>
					<td class="nickname">작성자</td>
					<td class="createDate">생성일</td>
					<td class="closed">마감여부</td>
				</tr>
			</table>
		</div>
		<div style="text-align:right;">
			<button id="vote-generator">투표 생성</button>
		</div>
		<div style="text-align:center;">
			<p style="margin:5px 0 5px 0;">페이지네이션 공간</p>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>