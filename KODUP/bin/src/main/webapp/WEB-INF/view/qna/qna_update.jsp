<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<title>qna/qna_update.jsp</title>
</head>
<body>
	<!-- BOARDTYPE -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 board_header">
				<span>궁금증 해결하기</span>
			</div>
			<div class="col-md-12 board_menual">
				<span>a001</span> 님 KODUP에서 최고의 개발자들과 함께 궁금증을 해결하세요.
			</div>
		</div>
	</div>
	<!-- FORM -->
	<form name="board_update_form" class="board_update_form" method="post">
		<!-- FORM DATA -->
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select name="qna_horsehead" class="form-select" aria-label="Default select example">
				<option selected>말머리를 선택해주세요.</option>
				<option value="1">기술</option>
				<option value="2">커리어</option>
				<option value="3">기타</option>
				<option value="4">전체</option>
			</select>
		</div>
		<div class="input-group form-group">
			<span class="input-group-text">제목</span>
			<br/>
			<input type="text" name="subject" class="form-control" placeholder="제목을 입력해주세요." autocomplete="off">
		</div>
		<div class="input-group form-group">
			<span class="input-group-text">태그</span>
			<br/>
			<input name="basic" class="form-control some_class_name" placeholder="태그를 입력해주세요.">
		</div>
		<div class="input-group form-group">
			<div id="summernote"></div>
		</div>
		<div class="input-group form-group" style="justify-content: end;">
			<input type="button" value="취소" class="btn btnCancle">
			<input type="button" value="수정" class="btn btnQnaUpdateR">
		</div>
		
		<!-- HIDDEN -->
		<input type="hidden" name="nowPage" value="">
		<input type="hidden" name="findStr" value="">
	</form>
	
	<!-- HASHTAG -->
	<script>
		const input = document.querySelector('input[name=basic]');
		let tagify = new Tagify(input);
		
		tagify.on('add', function() {
		  console.log(tagify.value); //입력된 태그 확인용
		});
	</script>
</body>
</html>