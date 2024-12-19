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
	#login-container h2{
		width:50%;
		height:30px;
		text-align:center;
		padding:20px 0 20px 0;
		margin:0;
		cursor:pointer;
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
		<div style="display:flex;justify-content:center;align-items:center;width:100%;">
			<h2 id="student" style="background-color:#fbe9e7">학생</h2>
			<h2 id="instructor" style="background-color:#ffccbc">강사</h2>
		</div>
		<h1>로그인!</h1>
		<form id="login" class="point" action="${pageContext.request.contextPath}/member/login.do" method="post">
			<input type="hidden" id="userType" name="userType" value="학생">
			<input type="text" name="userId">
			<input type="password" name="userPwd">
			<label style="display:flex;align-items:center;"><input type="checkbox" name="saveId">로그인 상태 유지</label>
			<input type="submit" value="로그인" style="background-color:#ffccbc">
		</form>
		<div class="point">
			<a href="#">아이디 찾기</a>
			<a href="#">비밀번호 찾기</a>
			<a href="#">회원가입</a>
		</div>
		<div class="point">
			<img src="" alt="소셜 로그인 아이콘">
			<img src="" alt="소셜 로그인 아이콘">
			<img src="" alt="소셜 로그인 아이콘">
		</div>
	</div>
	<script>
		$("#student").click(e=>{
			$("#student").css("background-color","#fbe9e7");
			$("#instructor").css("background-color","#ffccbc");
			$("#userType").attr("value","학생");
		});
		$("#instructor").click(e=>{
			$("#student").css("background-color","#ffccbc");
			$("#instructor").css("background-color","#fbe9e7");
			$("#userType").attr("value","강사");
		});
	</script>
</body>
</html>