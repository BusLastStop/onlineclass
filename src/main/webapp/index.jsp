<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.promotion{ position:absolute;top:50%;left:20%; }
	.promotion *{ margin:0 }
	.promotion button{ width:80px;height:30px;font-size:16px;border-radius:10px; }
	.video-class{ width:80%;height:800px;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;height:40%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:40px; }
	.video-class .video-contents{ display:inline-block;width:20%;padding:10px;margin:0; }
	.video-contents img{ width:150px;height:100px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	.lecture-review{ width:95%;height:10%;margin:auto;border-bottom:1px solid #ff8a65; }
	.lecture-review .instructor{ width:10%;padding-left:5px; }
	.lecture-review .review-content{ width:80%;padding-left:5px; }
	.lecture-review .review-date{ width:10%;text-align:center; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div style="display:flex;justify-content:center;align-items:flex-start;overflow:hidden;height:900px;">
		<img src="${pageContext.request.contextPath}/resources/images/community.png" width="100%" style="opacity:70%;">
		<div class="promotion">
			<h2 style="color:#212121;">무한한 학습 기회</h2>
			<h3 style="color:#212121;">언제 어디서나 온라인 강의</h3>
			<button style="color:#212121;">강의보기</button>
		</div>
	</div>
	<div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<h2 class="title">인기 강의</h2><br>
				<div style="display:flex;justify-content:center;align-items:center;">
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>인기강의 제목</h4>
						<div style="display:flex;">
							<p>인기강의 강사명</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>인기강의 제목</h4>
						<div style="display:flex;">
							<p>인기강의 강사명</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>인기강의 제목</h4>
						<div style="display:flex;">
							<p>인기강의 강사명</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>인기강의 제목</h4>
						<div style="display:flex;">
							<p>인기강의 강사명</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
				</div>
			</div>
			<div style="height:10%;"></div>
			<div class="list-container">
				<h2 class="title">강의 후기</h2><br>
				<table class="lecture-review">
					<tr>
						<td class="instructor">강사님</td>
						<td class="review-content">강의 후기</td>
						<td class="review-date">2024-12-18</td>
					</tr>
				</table>
				<table class="lecture-review">
					<tr>
						<td class="instructor">강사님</td>
						<td class="review-content">강의 후기</td>
						<td class="review-date">2024-12-18</td>
					</tr>
				</table>
				<table class="lecture-review">
					<tr>
						<td class="instructor">강사님</td>
						<td class="review-content">강의 후기</td>
						<td class="review-date">2024-12-18</td>
					</tr>
				</table>
				<table class="lecture-review">
					<tr>
						<td class="instructor">강사님</td>
						<td class="review-content">강의 후기</td>
						<td class="review-date">2024-12-18</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>