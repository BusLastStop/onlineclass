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
		<div id="title">
			<h2>투표</h2>
		</div>
		<div id="vote">
			<div class="content">
				<h3>투표 제목</h3>
				<div>
					<p>투표 내용</p>
					<button onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
				</div>
			</div>
			<div class="content">
				<h3>투표 제목</h3>
				<div>
					<p>투표 내용</p>
					<button onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
				</div>
			</div>
			<div class="content">
				<h3>투표 제목</h3>
				<div>
					<p>투표 내용</p>
					<button onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
				</div>
			</div>
			<div class="content">
				<h3>투표 제목</h3>
				<div>
					<p>투표 내용</p>
					<button onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
				</div>
			</div><div class="content">
				<h3>투표 제목</h3>
				<div>
					<p>투표 내용</p>
					<button onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
				</div>
			</div>
			<div class="content">
				<h3>투표 제목</h3>
				<div>
					<p>투표 내용</p>
					<button onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
				</div>
			</div>
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