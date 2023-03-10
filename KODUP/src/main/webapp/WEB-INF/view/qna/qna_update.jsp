<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/qna.js"></script>
<script defer src="js/common_board.js"></script>
<style>
.panel-body {
	min-height: 400px !important;
}
</style>
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
				<span>${sessionScope.sessionId }</span> 님 KODUP에서 최고의 개발자들과 함께 궁금증을 해결하세요.
			</div>
		</div>
	</div>
	
	<!-- FORM -->
	<form name="board_update_form" class="board_update_form" method="post">
		<!-- FORM DATA -->
		<div class="input-group form-group">
			<span class="input-group-text">말머리</span>
			<br/>
			<select name="qna_horsehead" id="qna_horsehead" class="form-select" aria-label="Default select example">
				<option value="말머리" ${ibVo.qna_horsehead eq '말머리' ? 'selected' : '' }>말머리를 선택해주세요.</option>
				<option value="기술" ${ibVo.qna_horsehead eq '기술' ? 'selected' : '' }>기술</option>
				<option value="커리어" ${ibVo.qna_horsehead eq '커리어' ? 'selected' : '' }>커리어</option>
				<option value="기타" ${ibVo.qna_horsehead eq '기타' ? 'selected' : '' }>기타</option>
				<option value="" ${ibVo.qna_horsehead eq '' ? 'selected' : '' }>전체</option>
			</select>
		</div>
		<div class="input-group form-group">
			<span class="input-group-text">제목</span>
			<br/>
			<input type="text" name="subject" class="form-control" value="${ibVo.subject }" placeholder="제목을 입력해주세요." autocomplete="off">
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
			<span class="input-group-text">보상픽셀</span>
			<input type="text" readOnly name="qna_pixel_reward" class="qna_pixel_reward" value="${cbpVo.qna_pixel_reward }" style="margin-right: 60px; width: 60px !important; border-radius: 0 5px 5px 0; border: 1px solid #ccc; text-align: center;">
			<input type="button" value="취소" class="btn btnListView" style="border-radius: 5px 0 0 5px;">
			<input type="button" value="수정" class="btn btnQnaUpdateR">
		</div>
		
		<!-- HIDDEN -->
		<input type="hidden" name="sno" value="${cbpVo.sno }">
		<input type="hidden" name="sort" value="${cbpVo.sort }">
		<input type="hidden" name="boardtype" value="${cbpVo.boardtype }">
		<input type="hidden" name="horsehead" value="${cbpVo.horsehead }">
		<input type="hidden" name="hashtag" value="${cbpVo.hashtag }">
		<input type="hidden" name="qna_pixel_reward" value="${cbpVo.qna_pixel_reward }">
		<input type="hidden" name="nowPage" value="${cbpVo.nowPage }">
		<input type="hidden" name="findStr" value="${cbpVo.findStr }">
		<input type="hidden" name="id" value="${sessionScope.sessionId }">
		<input type="hidden" name="qna_horseheadK" id="horsehead" value="">
		<textarea name="doc" id="getDoc" style="display: none;">${ibVo.doc }</textarea>
		<!-- HORSEHEAD -->
		<input style="display: none;" type="radio" onclick="runQna('기술')" class="btn-check" name="horsehead_radio" id="horsehead_radio1" ${cbpVo.horsehead eq '기술' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio1">기술</label>
		<input style="display: none;" type="radio" onclick="runQna('커리어')" class="btn-check" name="horsehead_radio" id="horsehead_radio2" ${cbpVo.horsehead eq '커리어' ? 'checked' : '' }>
		<label style="display: none;" for="horsehead_radio2">커리어</label>
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
</body>
</html>