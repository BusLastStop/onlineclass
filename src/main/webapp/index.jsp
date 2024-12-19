<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.promotion{ position:absolute;top:50%;left:15%; }
	.promotion *{ margin:0 }
	.promotion h2{ font-size:2vw; }
	.promotion h3{ font-size:2vw; }
	.promotion button{ width:8vw;height:3vw;font-size:1.5vw;border-radius:10px; }
	.promotion2{ position:absolute;top:50%;right:15%; }
	.promotion2 *{ margin:0 }
	.promotion2 h2{ font-size:2vw; }
	.promotion2 h3{ font-size:2vw; }
	.promotion2 button{ width:10vw;height:3vw;font-size:1.5vw;border-radius:10px; }
	.video-class{ width:80%;height:800px;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;height:40%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:5%; }
	.video-class .video-contents{ display:inline-block;width:24%;padding:10px;margin:0; }
	.video-contents img{ width:60%;min-width:100px;max-height:100px;min-height:70px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	.lecture-review{ width:90%;height:10%;margin:auto;border-bottom:1px solid #ff8a65; }
	.lecture-review .instructor{ width:10%;padding-left:5px; }
	.lecture-review .review-content{ width:80%;padding-left:5px; }
	.lecture-review .review-date{ width:10%;text-align:center; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div style="display:flex;justify-content:center;align-items:center;height:90vh">
		<div style="display:flex;justify-content:center;align-items:flex-start;overflow:hidden;height:100%;">
			<img src="${pageContext.request.contextPath}/resources/images/onlineclass2.jpeg" width="1887px" style="opacity:70%;">
			<div class="promotion">
				<h2 style="color:#212121;">무한한 학습 기회</h2>
				<h3 style="color:#212121;">언제 어디서나 온라인 강의</h3>
				<button style="color:#212121;">강의보기</button>
			</div>
		</div>
		<div style="display:flex;justify-content:center;align-items:flex-start;overflow:hidden;height:100%;">
			<img src="${pageContext.request.contextPath}/resources/images/onlineclass.jpeg" width="1887px" style="opacity:70%;">
			<div class="promotion2">
				<h2 style="color:#212121;">디지털 시대의 교육 혁신</h2>
				<h3 style="color:#212121;">실시간 강의 도구와 플랫폼</h3>
				<button style="color:#212121;">실시간 강의</button>
			</div>
		</div>
	</div>
	<%-- <div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<h2 class="title">인기 강의</h2><br>
				<div style="width:90%;margin:auto;display:flex;justify-content:flex-start;align-items:center;">
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
	</div> --%>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
