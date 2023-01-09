<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/freetalking.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/freetalking.js"></script>
<title>freetalking/freetalking_insert.jsp</title>
</head>
<body>
	<!-- BOARDTYPE -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 board_header">
				<span>행복을 나누면 두배!</span>
			</div>
			<div class="col-md-12 board_menual">
				<span>a001</span> 님 KODUP에서 다양한 사람들과 행복을 나눠보세요.
			</div>
		</div>
	</div>
	
	<!-- FORM -->
	<form name="board_insert_form" class="board_insert_form" method="post">
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select name="freetalking_horsehead" class="form-select" aria-label="Default select example">
				<option selected>말머리를 선택해주세요.</option>
				<option value="1">스포츠</option>
				<option value="2">게임</option>
				<option value="3">일상</option>
				<option value="4">연예</option>
				<option value="5">기타</option>
				<option value="6">전체</option>
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
			<!-- HASHTAG -->
			<input name="basic" class="form-control some_class_name" placeholder="태그를 입력해주세요.">
		</div>
		<div class="input-group form-group">
			<!-- SUMMERNOTE -->
			<div id="summernote"></div>
		</div>
		<div class="input-group form-group" style="justify-content: end;">
			<input type="button" value="취소" class="btn btnList">
			<input type="button" value="등록" class="btn btnFreetalkingInsertR">
		</div>
		
		<input type="hidden" name="nowPage" value="">
		<input type="hidden" name="findStr" value="">
	</form>
	
	<!-- HASHTAG -->
	<script>
		var input = document.querySelector('input[name=basic]');
		var tagify = new Tagify(input);
		
		tagify.on('add', function() {
			console.log(tagify.value); //입력된 태그 확인용
		});
	</script>
</body>
</html>