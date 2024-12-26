<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />
<title>글쓰기</title>
</head>
<body>
	<form action="#" method="get" style="width:80%;margin:auto;">
		<input type="text" name="title" style="width:100%;height:30px;font-size:16px;">
		<div id="editor" style="height:500px;"></div>
		<div style="text-align:right;">
			<input type="submit" value="작성">
		</div>
	</form>
	<button id="test">테스트</button>
	<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
	<script>
		const quill = new Quill('#editor', {
			theme: 'snow'
		});
		document.getElementById("test").addEventListener("click",e=>{
			const contents = quill.getSemanticHTML();
			console.log(contents)
		});
	</script>
</body>
</html>