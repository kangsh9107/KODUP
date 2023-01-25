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
<script defer src="js/common_board.js"></script>
<style>
.panel-body {
	min-height: 400px !important;
}
</style>
<title>freetalking/freetalking_update.jsp</title>
</head>
<body>
	<!-- BOARDTYPE -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 board_header">
				<span>행복을 나누면 두배!</span>
			</div>
			<div class="col-md-12 board_menual">
				<span>${sessionScope.sessionId }</span> 님 KODUP에서 다양한 사람들과 행복을 나눠봐요.
			</div>
		</div>
	</div>
	<!-- FORM -->
	<form name="board_update_form" class="board_update_form" method="post">
		<!-- FORM DATA -->
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select id="freetalking_horsehead" class="form-select" aria-label="Default select example">
				<option value="말머리" ${ibVo.freetalking_horsehead eq '말머리' ? 'selected' : '' }>말머리를 선택해주세요.</option>
				<option value="스포츠" ${ibVo.freetalking_horsehead eq '스포츠' ? 'selected' : '' }>스포츠</option>
				<option value="게임" ${ibVo.freetalking_horsehead eq '게임' ? 'selected' : '' }>게임</option>
				<option value="일상" ${ibVo.freetalking_horsehead eq '일상' ? 'selected' : '' }>일상</option>
				<option value="연예" ${ibVo.freetalking_horsehead eq '연예' ? 'selected' : '' }>연예</option>
				<option value="기타" ${ibVo.freetalking_horsehead eq '기타' ? 'selected' : '' }>기타</option>
				<option value="" ${ibVo.freetalking_horsehead eq '' ? 'selected' : '' }>전체</option>
			</select>
		</div>
		<div class="input-group form-group">
			<span class="input-group-text">제목</span>
			<br/>
			<input type="text" name="subject" value="${ibVo.subject }" class="form-control" placeholder="제목을 입력해주세요." autocomplete="off">
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
			<input type="button" value="취소" class="btn btnListViewFreetalking">
			<input type="button" value="수정" class="btn btnFreetalkingUpdateR">
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
		<input type="hidden" name="freetalking_horseheadK" id="horsehead" value="">
		<textarea name="doc" id="getDoc" style="display: none;">${ibVo.doc }</textarea>
		<!-- HORSEHEAD -->
		<input style="display: none;" type="radio" onclick="runQna('스포츠')" class="btn-check" name="horsehead_radio" id="horsehead_radio1" ${cbpVo.horsehead eq '스포츠' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio1">스포츠</label>
		<input style="display: none;" type="radio" onclick="runQna('게임')" class="btn-check" name="horsehead_radio" id="horsehead_radio2" ${cbpVo.horsehead eq '게임' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio2">게임</label>
		<input style="display: none;" type="radio" onclick="runQna('일상')" class="btn-check" name="horsehead_radio" id="horsehead_radio3" ${cbpVo.horsehead eq '일상' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio3">일상</label>
		<input style="display: none;" type="radio" onclick="runQna('연예')" class="btn-check" name="horsehead_radio" id="horsehead_radio4" ${cbpVo.horsehead eq '연예' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio4">연예</label>
		<input style="display: none;" type="radio" onclick="runQna('기타')" class="btn-check" name="horsehead_radio" id="horsehead_radio5" ${cbpVo.horsehead eq '기타' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio5">기타</label>
		<input style="display: none;" type="radio" onclick="runQna('')" class="btn-check" name="horsehead_radio" id="horsehead_radio6"  ${cbpVo.horsehead eq '' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio6">전체</label>
		<!-- SORT -->
		<select style="display: none;" id="sort" name="sort" onchange="changeSort()" class="form-select" aria-label="Default select example">
			<option value="1" ${cbpVo.sort == 1 ? 'selected' : '' }>최신순</option>
			<option value="2" ${cbpVo.sort == 2 ? 'selected' : '' }>추천순</option>
			<option value="3" ${cbpVo.sort == 3 ? 'selected' : '' }>댓글순</option>
			<option value="4" ${cbpVo.sort == 4 ? 'selected' : '' }>조회순</option>
		</select>
	</form>
</body>
</html>