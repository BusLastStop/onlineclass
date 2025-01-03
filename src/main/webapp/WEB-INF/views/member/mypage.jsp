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
	#mypage{
		width:100%;
		height:100%;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	.mypage-container{
		width:90%;
		height:90%;
	}
	p{
		margin:0;
	}
	.info-circle{
		width:120px;
		height:120px;
		text-align:center;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
</style>
<section>
	<jsp:include page="/WEB-INF/views/common/mypageheader.jsp"/>
	<div id="mypage">
		<div style="width:90%;text-align:right;"><button>비밀번호 변경하고 싶다</button></div>
		<div class="mypage-container">
			<c:if test="${user.userType eq '학생'}">
				<div style="width:40%;margin:auto;">
					<p>이름 : ${user.userinfo.stuName}</p>
					<p>생년월일 : ${user.userinfo.stuBirthDate}</p>
					<p>이메일 : ${user.userinfo.stuEmail}</p>
					<p>전화번호 : ${user.userinfo.stuPhone}</p>
					<p>주소 : ${user.userinfo.stuAddress}</p>
					<p>성별 : 
						<c:if test="${user.userinfo.stuGender eq 'M'}">남</</c:if>
						<c:if test="${user.userinfo.stuGender eq 'F'}">여</</c:if>
					</p>
					<p>출신학교 : ${user.userinfo.stuSchool}</p>
					<c:if test="${not empty user.userinfo.stuInterestedUniversity}">
						<p>선호대학 : ${user.userinfo.stuInterestedUniversity}</p>
					</c:if>
					<c:if test="${not empty user.userinfo.stuInterestedMajor}">
						<p>선호학과 : ${user.userinfo.stuInterestedMajor}</p>
					</c:if>
				</div>
				<div style="display:flex;justify-content:space-evenly;align-items:center;margin:30px 0 30px 0;">
					<div class="info-circle"><p>총 결제액</p><p>${user.userinfo.stuTotalAccumFee}</p></div>
					<div class="info-circle"><p>녹화 강의</p><p>누적 결제액</p><p>${user.userinfo.stuLectureAccumFee}</p></div>
					<div class="info-circle"><p>실시간 강의</p><p>누적 결제액</p><p>${user.userinfo.stuTutAccumFee}</p></div>
				</div>
				<div style="display:flex;justify-content:space-evenly;align-items:center;margin:30px 0 30px 0;">
					<div class="info-circle"><p>녹화 강의</p><p>누적 시청시간</p><p>${user.userinfo.stuLectureAccumWatchTime}</p></div>
					<div class="info-circle"><p>실시간 강의</p><p>누적 시청시간</p><p>${user.userinfo.stuTutAccumMatchTime}</p></div>
					<div class="info-circle"><p>실시간 강의</p><p>누적 매칭 시간</p><p>${user.userinfo.stuTutAccumMatchCount}</p></div>
					<div class="info-circle"><p>실시간 강의</p><p>누적 매칭 횟수</p><p>${user.userinfo.stuTutIdenticalMatchCount}</p></div>
				</div>
			</c:if>
			<c:if test="${user.userType eq '강사'}">
				<div style="width:40%;margin:auto;">
					<p>이름 : ${user.userinfo.teaName}</p>
					<p>생년월일 : ${user.userinfo.teaBirthDate}</p>
					<p>이메일 : ${user.userinfo.teaEmail}</p>
					<p>전화번호 : ${user.userinfo.teaPhone}</p>
					<p>주소 : ${user.userinfo.teaAddress}</p>
					<p>성별 : 
						<c:if test="${user.userinfo.teaGender eq 'M'}">남</</c:if>
						<c:if test="${user.userinfo.teaGender eq 'F'}">여</</c:if>
					</p>
					<p>출신대학 : ${user.userinfo.teaUniversity}</p>
					<p>전공과목 : ${user.userinfo.teaSubject}</p>
				</div>
				<div style="display:flex;justify-content:space-evenly;align-items:center;margin:30px 0 30px 0;">
					<div class="info-circle"><p>총 누적</p><p>강의 수익</p><p>${user.userinfo.teaTotalAccumIncome}</p></div>
					<div class="info-circle"><p>녹화 강의</p><p>누적 강의 수익</p><p>${user.userinfo.teaLectureAccumIncome}</p></div>
					<div class="info-circle"><p>실시간 강의</p><p>누적 강의 수익</p><p>${user.userinfo.teaTutuorialAccumIncome}</p></div>
				</div>
				<div style="display:flex;justify-content:space-evenly;align-items:center;margin:30px 0 30px 0;">
					<div class="info-circle"><p>실시간 강의</p><p>누적 매칭 시간</p><p>${user.userinfo.teaTutuorialAccumMatchTime}</p></div>
					<div class="info-circle"><p>실시간 강의</p><p>누적 매칭 횟수</p><p>${user.userinfo.teaTutIdenticalMatchCount}</p></div>
					<div class="info-circle"><p>실시간 강의 누적</p><p>동일 매칭 횟수</p><p>${user.userinfo.teaTutIdenticalMatchCount}</p></div>
				</div>
			</c:if>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>