<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/infoshare.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/infoshare.js"></script>
<title>infoshare/infoshare_insert.jsp</title>
</head>
<body>
	<!-- BOARDTYPE -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 board_header">
				<span>정보를 나누면 돈이 된다?!</span>
			</div>
			<div class="col-md-12 board_menual">
				<span>a001</span> 님 KODUP에서 개발자들에게 정보를 공유해보세요.
			</div>
		</div>
	</div>
	
	<!-- FORM -->
	<form name="board_insert_form" class="board_insert_form" method="post">
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select name="infoshare_horsehead" class="form-select" aria-label="Default select example">
				<option selected>말머리를 선택해주세요.</option>
				<option value="1">팁</option>
				<option value="2">리뷰</option>
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
			<input type="button" value="취소" class="btn btnList">
			<input type="button" value="등록" class="btn btnInfoshareInsertR">
		</div>
		
		<input type="hidden" name="nowPage" value="">
		<input type="hidden" name="findStr" value="">
	</form>
	
	<!-- HASHTAG -->
	<script>
		var input = document.querySelector('input[name=basic]');
		let tagify = new Tagify(input);
		
		tagify.on('add', function() {
			console.log(tagify.value); //입력된 태그 확인용
		});
	</script>
</body>
</html>