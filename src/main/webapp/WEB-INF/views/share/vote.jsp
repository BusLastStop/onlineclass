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
	}
	#content-container h2{
		margin:20px;
	}
	#vote{
		width:100%;
		height:900px;
		text-align:center;
	}
	#vote-container{
		display:inline-block;
		width:24%;
		height:48%;
	}
	#content{
		min-width:227px;
		height:98%;
		margin:3px;
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
		<div>
			<h2>투표</h2>
		</div>
		<div id="vote">
			<div id="vote-container">
				<div id="content">
					<h3 style="margin:5px;">투표 제목</h3>
					<div style="margin:5px;height:89%;display:flex;flex-direction:column;justify-content:space-around;align-items:center;">
						<p style="width:98%;height:90%;margin:0;text-align:left;">투표 내용</p>
						<button style="width:70px;height:30px;background-color:#ffccbd;" onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
					</div>
				</div>
			</div>
			<div id="vote-container">
				<div id="content">
					<h3 style="margin:5px;">투표 제목</h3>
					<div style="margin:5px;height:89%;display:flex;flex-direction:column;justify-content:space-around;align-items:center;">
						<p style="width:98%;height:90%;margin:0;text-align:left;">투표 내용</p>
						<button style="width:70px;height:30px;background-color:#ffccbd;" onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
					</div>
				</div>
			</div><div id="vote-container">
				<div id="content">
					<h3 style="margin:5px;">투표 제목</h3>
					<div style="margin:5px;height:89%;display:flex;flex-direction:column;justify-content:space-around;align-items:center;">
						<p style="width:98%;height:90%;margin:0;text-align:left;">투표 내용</p>
						<button style="width:70px;height:30px;background-color:#ffccbd;" onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
					</div>
				</div>
			</div><div id="vote-container">
				<div id="content">
					<h3 style="margin:5px;">투표 제목</h3>
					<div style="margin:5px;height:89%;display:flex;flex-direction:column;justify-content:space-around;align-items:center;">
						<p style="width:98%;height:90%;margin:0;text-align:left;">투표 내용</p>
						<button style="width:70px;height:30px;background-color:#ffccbd;" onclick="window.open('about:blank','_blank','width=500,height=600');">투표하기</button>
					</div>
				</div>
			</div>
			<div id="vote-container">
				<div id="content">
					
				</div>
			</div>
			<div id="vote-container">
				<div id="content">
					
				</div>
			</div>
			<div id="vote-container">
				<div id="content">
					
				</div>
			</div>
			<div id="vote-container">
				<div id="content">
					
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