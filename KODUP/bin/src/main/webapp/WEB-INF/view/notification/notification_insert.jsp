<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/notification.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/notification.js"></script>
<title>notification/notification_insert.jsp</title>
</head>
<body>
	<!-- BOARDTYPE -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 board_header">
				<span>공지사항</span>
			</div>
			<div class="col-md-12 board_menual">
				<span>MASTER</span> 님 오늘도 즐거운 하루되세요.
			</div>
		</div>
	</div>
	
	<!-- FORM -->
	<form name="board_insert_form" class="board_insert_form" method="post">
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select name="notification_horsehead" class="form-select" aria-label="Default select example">
				<option selected>말머리를 선택해주세요.</option>
				<option value="1">공지사항</option>
				<option value="2">이벤트</option>
				<option value="3">전체</option>
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
			<input type="button" value="등록" class="btn btnNotificationInsertR">
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