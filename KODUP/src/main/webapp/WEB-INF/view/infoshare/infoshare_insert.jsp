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
<script defer src="js/common_board.js"></script>
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
				<span>${sessionScope.nickname }</span> 님 KODUP에서 개발자들에게 정보를 공유해보세요.
			</div>
		</div>
	</div>
	
	<!-- FORM -->
	<form name="board_insert_form" class="board_insert_form" method="post">
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select id="infoshare_horsehead" class="form-select" aria-label="Default select example">
				<option value="말머리" selected>말머리를 선택해주세요.</option>
				<option value="팁">팁</option>
				<option value="리뷰">리뷰</option>
				<option value="기타">기타</option>
				<option value="">전체</option>
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
			<div id="summer" style="display: inline-block !important; width: 100% !important;">
				<div id="summernote"></div>
			</div>
		</div>
		<div class="input-group form-group" style="justify-content: end;">
			<input type="button" value="취소" class="btn btnList" style="border-radius: 5px 0 0 5px;">
			<input type="button" value="등록" class="btn btnInfoshareInsertR">
		</div>
		
		<!-- HIDDEN -->
		<input type="hidden" name="sno" value="${cbpVo.sno }">
		<input type="hidden" name="sort" value="${cbpVo.sort }">
		<input type="hidden" name="boardtype" value="${cbpVo.boardtype }">
		<input type="hidden" name="horsehead" value="${cbpVo.horsehead }">
		<input type="hidden" name="hashtag" value="${cbpVo.hashtag }">
		<input type="hidden" name="nowPage" value="${cbpVo.nowPage }">
		<input type="hidden" name="findStr" value="${cbpVo.findStr }">
		<input type="hidden" name="id" value="${sessionScope.sessionId }">
		<input type="hidden" name="infoshare_horsehead" id="horsehead" value="">
		<textarea name="doc" style="display: none;"></textarea>
		<!-- HORSEHEAD -->
		<input style="display: none;" type="radio" onclick="runQna('팁')" class="btn-check" name="horsehead_radio" id="horsehead_radio1" ${cbpVo.horsehead eq '팁' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio1">팁</label>
		<input style="display: none;" type="radio" onclick="runQna('리뷰')" class="btn-check" name="horsehead_radio" id="horsehead_radio2" ${cbpVo.horsehead eq '리뷰' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio2">리뷰</label>
		<input style="display: none;" type="radio" onclick="runQna('기타')" class="btn-check" name="horsehead_radio" id="horsehead_radio3" ${cbpVo.horsehead eq '기타' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio3">기타</label>
		<input style="display: none;" type="radio" onclick="runQna('')" class="btn-check" name="horsehead_radio" id="horsehead_radio4"  ${cbpVo.horsehead eq '' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio4">전체</label>
		<!-- SORT -->
		<select style="display: none;" id="sort" name="sort" onchange="changeSort()" class="form-select" aria-label="Default select example">
			<option value="1" ${cbpVo.sort == 1 ? 'selected' : '' }>최신순</option>
			<option value="2" ${cbpVo.sort == 2 ? 'selected' : '' }>추천순</option>
			<option value="3" ${cbpVo.sort == 3 ? 'selected' : '' }>댓글순</option>
			<option value="4" ${cbpVo.sort == 4 ? 'selected' : '' }>조회순</option>
		</select>
	</form>
	
	<!-- HASHTAG -->
	<script>
		var input = document.querySelector('input[name=basic]');
		var tagify = new Tagify(input);
	</script>
</body>
</html>