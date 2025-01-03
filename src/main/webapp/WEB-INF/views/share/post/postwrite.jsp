<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/red.png" type="image/x-icon"/>
<title>글쓰기</title>
</head>
<style>
	body{ display:flex;flex-direction:column;align-items:center;height:100vh; }
	form{ width:60%;height:90%;margin-top:5%;text-align:center; }
	input#title{ width:99%;height:50px;font-size:32px;border:1px solid #9e9e9e;padding:0 5px 0 5px;margin:0 0 10px 0; }
	button{ background-color:#eeeeee;border:1px solid #cccccc; }
	.ql-size-small { font-size: 12px; }
	.ql-size-large { font-size: 24px; }
	.ql-size-huge { font-size: 32px; }
</style>
<body>
	<form action="${pageContext.request.contextPath}/share/postwriteend.do" method="post" enctype="multipart/form-data" onsubmit="return addContent();">
		<h2>자유 게시판 글쓰기</h2>
		<input type="hidden" name="uploader" value="${user.userinfo.stuCode}">
		<input type="text" name="title" id="title" placeholder="제목">
		<div id="editor" style="width:100%;height:60%;"></div>
		<input type="hidden" name="contents" id="contents">
		<div style="display:flex;justify-content:center;align-items:center;margin-top:10px;">
			<div style="width:50%;text-align:left;">
				<input type="file" name="upload">
			</div>
			<div style="width:50%;text-align:right;">
				<button type="submit" style="width:55px;height:28px;margin:3px;">작성</button>
			</div>
		</div>
	</form>
	<button onclick="test();">테스트</button>
	<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
	<script>
		const quill = new Quill('#editor', {
			theme: 'snow',
			modules: {
				toolbar: [
					[{ 'size': ['small', false, 'large', 'huge'] }],
					['bold', 'italic', 'underline'],
					['image', 'video']
				]
			}
		});
		const test=()=>{
			const contents = quill.getSemanticHTML();
			document.getElementById("contents").value=contents;
			console.log(document.getElementById("title").value);
			console.log(document.getElementById("contents").value);
		}
		const addContent=()=>{
			const contents = quill.getSemanticHTML();
			document.getElementById("contents").value=contents;
			if(document.getElementById("title").value==""){
				alert("제목을 입력해주세요!");
				return false;
			}
			if(document.getElementById("contents").value=="<p></p>"){
				alert("내용을 입력해주세요!");
				return false;
			}
		}
	</script>
</body>
</html>