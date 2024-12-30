<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	body>h1{
		width:80%;
		margin:auto;
		margin-top:20px;
		margin-bottom:20px;
	}
	#login-container{
		display:flex;
		flex-direction:column;
		justify-content:flex-start;
		align-items:center;
		width:700px;
		height:500px;
		background-color:#fbe9e7;
		margin:auto;
		margin-top:70px;
		margin-bottom:70px;
	}
	#login-container h2{
		width:50%;
		height:30px;
		text-align:center;
		padding:20px 0 20px 0;
		margin:0;
		cursor:pointer;
	}
	#findPw{
		display:flex;
		flex-direction:column;
		width:300px;
	}
	#findPw input{
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
	<h1>비밀번호 찾기</h1>
	<div id="login-container">
		<div style="display:flex;justify-content:center;align-items:center;width:100%;">
			<h2 id="student" style="background-color:#fbe9e7">학생</h2>
			<h2 id="instructor" style="background-color:#ffccbc">강사</h2>
		</div>
		
		<%-- <form id="login" class="point" action="${pageContext.request.contextPath}/member/login.do" method="get"> --%>
		<div style="width:100%;height:100%;display:flex;flex-direction:column;justify-content:center;align-items:center;">
			<form id="findPw" class="point" action="${pageContext.request.contextPath}/member/findpwend.do" method="post">
				<input type="hidden" id="userType" name="userType" value="학생">
				아이디<input type="text" id="userId" name="userId" placeholder="아이디 입력">
				이름<input type="text" id="name" name="name" placeholder="이름 입력">
				이메일로 찾기<input type="text" id="email" name="email" placeholder="이메일 입력">
				전화번호로 찾기<input type="text" id="phone" name="phone" placeholder="전화번호 입력">
				<input type="submit" value="비밀번호 찾기" style="background-color:#ffccbc">
			</form>
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
		$("#findPw").submit(e=>{
			if(document.getElementById("userId").value==""){
				alert("아이디를 입력하세요!");
				return false;
			}else if(document.getElementById("name").value==""){
				alert("이름을 입력하세요!");
				return false;
			}else if((document.getElementById("email").value=="") && (document.getElementById("phone").value=="")){
				alert("이메일 또는 전화번호를 입력하세요!");
				return false;
			}else if((document.getElementById("email").value!="") && (document.getElementById("phone").value!="")){
				alert("이메일과 전화번호 중 하나만 입력하세요!");
				document.getElementById("email").value="";
				document.getElementById("phone").value="";
				return false;
			}
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>