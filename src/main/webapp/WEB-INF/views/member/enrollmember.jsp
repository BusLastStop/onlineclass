<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/red.png" type="image/x-icon"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>회원가입</title>
</head>
<style>
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		min-height:110vh;
 		overflow-y:scroll;
 		margin:0;
	}
	#login-container{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		width:40%;
		height:110vh;
		min-width:500px;
		min-height:1000px;
		background-color:#fbe9e7;
	}
	#enroll{
		display:flex;
		flex-direction:column;
		width:350px;
	}
	#enroll p{
		padding:0;
		margin:0;
		margin-bottom:3px;
	}
	#enroll input{
		margin-bottom:5px;
		height:30px;
		border:1px solid #fbe9e7;
	}
</style>
<body>
	<div id="login-container">
		<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/red.png" width="100" height="60"></a>
		<h1>회원가입! 환영합니다!</h1>
		<form id="enroll" action="${pageContext.request.contextPath}/member/enrollend.do" method="post">
			<input type="hidden" name="userType" value="${param.type}">
			<p>아이디</p>
			<div style="display:flex;justify-content:center;align-items:center;">
				<input type="text" name="userId" required id="userId" style="width:75%;" placeholder="영어 소문자, 숫자 포함 8~12자리">
				<button type="button" id="idCheck" style="width:80px;height:30px;margin-left:5px;background-color:#ffccbc">중복확인</button>
				<input type="hidden" id="idDuplicate" value="false">
			</div>
			<p>비밀번호</p>
			<input type="password" name="userPw" id="pw" required placeholder="영어 대소문자, 숫자, 특수문자 포함 8~12자리">
			<p>비밀번호 확인</p>
			<input type="password" name="userPwCheck" id="pwCheck">
			<p id="pwResultText"></p>
			<input type="hidden" id="pwCheckResult" value="false">
			<p>이름</p>
			<input type="text" name="name" required>
<!-- 			<p>닉네임</p>
			<input type="text" name="nickname"> -->
			<p>생년월일</p>
			<input type="date" name="birthDate" required>
			<p>이메일</p>
			<div style="display:flex;justify-content:center;align-items:center;">
				<input type="text" name="email" required id="email" style="width:75%;">
				<button type="button" id="emailCheck" style="width:80px;height:30px;margin-left:5px;background-color:#ffccbc">중복확인</button>
				<input type="hidden" id="emailDup" value="false">
			</div>
			<p>연락처</p>
			<input type="text" name="phone" required>
			<p>성별</p>
			<div style="display:flex;">
				<label style="display:flex;align-items:center;"><input type="radio" name="gender" value="M" required>남</label>
				<label style="display:flex;align-items:center;"><input type="radio" name="gender" value="F" required>여</label>
			</div>
			<p>주소</p>
			<input type="text" name="address">
			<p>학교명</p>
			<input type="text" name="school">
			<c:if test="${param.type eq 'student'}">
				<p>선호 학교(선택)</p>
				<input type="text" name="interestedUniversity">
				<p>선호 학과(선택)</p>
				<input type="text" name="interestedMajor">
			</c:if>
			<c:if test="${param.type eq 'teacher'}">
				<p>과목</p>
				<input type="text" name="subject" required>
			</c:if>
			<label style="display:flex;align-items:center;"><input type="checkbox" name="agreeTerms" required>약관 동의</label>
			<input type="submit" value="회원가입" style="background-color:#ffccbc">
		</form>
	</div>
	<script>
		$("#idCheck").click(e=>{
			const userId = document.getElementById("userId").value;
			if(userId=="") alert("아이디를 입력하세요!");
			else{
				$.post("${pageContext.request.contextPath}/${param.type}/selectone${param.type}.do",{"userId":userId},data=>{
					if(data!=null){
						alert("중복되는 아이디입니다!");
						document.getElementById("idDuplicate").value="false";
						document.getElementById("userId").focus();
					}else{
						alert("사용가능한 아이디입니다!");
						document.getElementById("idDuplicate").value="true";
					}
				});
			}
		});
		$("#userId").keypress(e=>{
			document.getElementById("idDuplicate").value="false";
		});
		$("#pwCheck").blur(e=>{
			if(document.getElementById("pw").value==""){
				document.getElementById("pwResultText").innerText="비밀번호를 입력하세요!";
				document.getElementById("pwCheckResult").value="false";
			}else if(document.getElementById("pw").value!=document.getElementById("pwCheck").value){
				document.getElementById("pwResultText").innerText="비밀번호가 다릅니다!";
				document.getElementById("pwCheckResult").value="false";
			}else{
				document.getElementById("pwResultText").innerText="비밀번호 일치!";
				document.getElementById("pwCheckResult").value="true";
			}
		});
		$("#pw").keypress(e=>{
			document.getElementById("pwCheckResult").value="false";
		});
		$("#emailCheck").click(e=>{
			const email = document.getElementById("email").value;
			if(email=="") alert("이메일을 입력하세요!");
			else{
				$.post("${pageContext.request.contextPath}/${param.type}/selectone${param.type}.do",{"email":email},data=>{
					if(data!=null){
						alert("중복!");
						document.getElementById("emailDup").value="false";
						document.getElementById("email").focus();
					}else{
						alert("사용가능!");
						document.getElementById("emailDup").value="true";
					}
				});
			}
		});
		$("#email").keypress(e=>{
			document.getElementById("emailDup").value="false";
		})
		$("#enroll").submit(e=>{
			if(document.getElementById("idDuplicate").value=="false"){
				alert("아이디 중복체크를 해주세요!");
				return false;
			}
			const idReg=/(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}/;
			const id=document.getElementById("userId").value;
			if(!idReg.test(id)){
				alert("아이디가 올바르지 않습니다! 영문자, 숫자를 포함하여 8글자 이상 12글자 이하로 만들어 주세요!");
				return false;
			}
			if(document.getElementById("pwCheckResult").value=="false"){
				alert("비밀번호가 일치하지 않습니다!");
				return false;
			}
			const pwReg=/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{8,12}/;
			const pw=document.getElementById("pw").value;
			if(!pwReg.test(pw)){
				alert("비밀번호가 올바르지 않습니다! 영문자 숫자, 특수문자를 포함하여 8글자 이상 12글자 이하로 만들어 주세요!");
				return false;
			}
			if(document.getElementById("emailDup").value=="false"){
				alert("이메일 중복체크를 해주세요!");
				return false;
			}
		});
	</script>
</body>
</html>