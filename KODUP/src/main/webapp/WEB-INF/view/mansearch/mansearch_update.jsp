<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mansearch/mansearch.update.jsp</title>
<link rel='stylesheet' href='css/mansearch.css'>
<script src='js/mansearch.js'></script>
</head>
<body>
<h3 class="mansearch_insert_title">정보수정</h3>

<form name="mansearch_input_form">
	<label class="info_label">회사로고 등록</label><br/>
	<input type="file" name="corp_logo" class="corp_logo_insert" onchange='preview()'/>
	<img src='/images/corp_logo_insert.png' id='corp_logo' style="width:144px; height:144px; margin:0 0 20px 0; border:2px double #d2d4d9; cursor:pointer;"/>		
	<div class="container text-left" style="padding-left:0;">
		<div class="row corp_info" style="padding:0; margin-left:0;">
			<label class="info_label">회사정보</label>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>회사명</label>
	    		<br/><input type="text" name="corp_name" class="form-control mansearch_board_insert_form" autocomplete="off">    		
	    	</div>
	    	<div class="col-12 col-sm-6" >
	    		<label>대표 연락처</label>
	    		<br/><input type="text" name="corp_phone" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>대표 이메일</label>
	    		<br/><input type="text" name="corp_email" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="margin-bottom:20px;">
	    		<label>사업자 등록증</label>
	    		<br/><input type="file" name="corp_license" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>    	
	  	</div>
	</div>
	<div class="container text-left">
		<div class="row manager_info">
			<label class="info_label">담당자정보</label>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>담당자명</label>
	    		<br/><input type="text" name="manager_name" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6">
	    		<label>담당자 연락처</label>
	    		<br/><input type="text" name="manager_phone" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="margin-bottom:20px; padding-left:0;">
	    		<label>담당자 이메일</label>
	    		<br/><input type="text" name="manager_email" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>   	
	    	<div class="col-12 col-sm-6" style="visibility:hidden;">hidden이라 안보임!</div>
	  	</div>
	</div>
	<div class="container text-left">
		<div class="row work_info">
			<label class="info_label">근무정보</label>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무시작일</label>
	    		<br/><input type="date" name="work_start" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6">
	    		<label>급여</label>
	    		<br/><input type="text" name="pay" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무지역</label>
	    		<br/><input type="text" name="corp_location" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6">
	    		<label>포지션</label>
	    		<br/><input type="text" name="position" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>계약형태</label>
	    		<br/><input type="text" name="job_type" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6">
	    		<label>필요경력</label>
	    		<br/><input type="text" name="required_career" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>학력사항</label>
	    		<br/><input type="text" name="education_level" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6">
	    		<label>근무방식</label>
	    		<br/><input type="text" name="work_type" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
		    		<label>급여지급일</label>
	    		<br/><input type="text" name="pay_date" class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div> 
	    	<div class="col-12 col-sm-6" style="margin-bottom:20px;">
	    		<label>필수스킬</label>
		    		<br/><input type="text" name="required_skill" class="form-control mansearch_board_insert_form" place autocomplete="off">
	    	</div>       	    	     	    	
	  	</div>
	</div>
	<div class="container text-left" style="padding-left:0;">
		<label class="info_label" style="padding-left:0;">글 작성</label>
		<div class="row">
			<div class="col">
				<div class="input-group form-group" style="margin:0 0 30px 0;">
					<div id="summernote"></div>
				</div>		
			</div>
		</div>
	</div>
</form>	
<div class="grid text-center" style="--bs-columns: 1;">
	<div>
  		<button type='button' class="mansearch_board_cancel">취소</button>
  		<button type='button' class="mansearch_board_insertR">저장</button>
  	</div>
</div>
<script>
var logofile = document.querySelector('.corp_logo_insert');
var logo = document.querySelector('#corp_logo');
logo.onclick = function(){
	logofile.click();
}

function preview(ev){
	let event = ev || window.event;
	let file = event.srcElement.files[0];
	
	let reader = new FileReader();
	reader.onload = function(){
		let pre_img = logo
		let img = new Image();
		img.src = reader.result;
		pre_img.src = img.src;
	}
	reader.readAsDataURL(file);
}
</script>
</body>
</html>