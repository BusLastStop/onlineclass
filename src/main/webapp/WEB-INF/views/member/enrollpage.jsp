<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/red.png" type="image/x-icon"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>로그인</title>
<style>
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		min-height:100vh;
 		overflow:hidden;
 		margin:0;
	}
	#login-container{
		display:flex;
		flex-direction:column;
		justify-content:flex-start;
		align-items:center;
		width:700px;
		height:400px;
		background-color:#fbe9e7;
	}
	#login-container h1,h3{
		margin:20px 0 0 0;
	}
	#login-container .select{
		width:150px;
		height:180px;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		background-color:#ffccbc;
		cursor:pointer;
	}
	.select h2{
		margin:10px 0 10px 0;
	}
	.select img{
		width:100px;
		height:100px;
		margin:10px 0 10px 0;
		border-radius:50px;
	}
	#login{
		display:flex;
		flex-direction:column;
		width:300px;
	}
	#login input{
		margin-bottom:5px;
		height:30px;
		border:1px solid #fbe9e7;
	}
	.point *{
		cursor:pointer;
	}
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/red.png" width="100" height="60"></a>
	<div id="login-container">
		<h1>회원가입을 환영합니다!</h1>
		<h3>당신은 학생인가요? 강사인가요?</h3>
		<div style="display:flex;justify-content:space-around;align-items:center;width:100%;margin:auto;">
			<div class="select" onclick="location.assign('${pageContext.request.contextPath}/member/enrollmember.do?type=student')">
				<img src="${pageContext.request.contextPath}/resources/images/colorful.png" alt="학생">
				<h2 id="student">학생</h2>
			</div>
			<div class="select" onclick="location.assign('${pageContext.request.contextPath}/member/enrollmember.do?type=instructor')">
				<img src="${pageContext.request.contextPath}/resources/images/colorful.png" alt="강사">
				<h2 id="instructor">강사</h2>
			</div>
		</div>
	</div>
	<script>

	</script>
</body>
</html>