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
<form class="mansearch_update_form" method='post'>
	<input type='hidden' name='sno' value='${mbVo.sno }'><input type='hidden' name='id' class='member_id' value='${mbVo.id }'/><input type='hidden' name='mansearch_sno' value="${mbVo.mansearch_sno }"/>			
	<input type='hidden' name='id' class='member_id' value=''/>
	<input type='hidden' name='nowPage' value='${pVo.nowPage }'>
	<input type='hidden' name='findStr' value='${pVo.findStr }'>
	<div class="container text-left">
		<div class="row work_info">
			<label class="info_label">근무정보</label>
			<div class="col" style="padding-left:0;">
	    		<label>제목</label><br/>
	    		<input type="text" name="subject" value='${mbVo.subject }' class="form-control mansearch_board_insert_form" autocomplete="off">    		
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무시작일</label><br/>
	    		<input type="date" name="work_start" value='${mbVo.work_start }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>지원마감일</label><br/>
	    		<input type="date" name="deadline" value='${mbVo.deadline }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>급여(만원)</label><br/>
	    		<input type="text" name="pay" value='${mbVo.pay }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>	    	
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>메인직무</label><br/>
				<div class="form-floating">
					<select class="form-select" name='main_task' id="floatingSelect" aria-label="Floating label select example">
				    	<option value="SI" ${(mbVo.main_task eq 'SI')? 'selected' : '' }>SI</option>
				    	<option value="SM" ${(mbVo.main_task eq 'SM')? 'selected' : '' }>SM</option>
				  	</select>
				  	<label for="floatingSelect">메인직무를 선택하세요</label>
				</div>
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>서브직무</label><br/>
				<div class="form-floating">
					<select class="form-select" name='sub_task' id="floatingSelect" aria-label="Floating label select example">
				    	<option value="금융" ${(mbVo.sub_task eq '금융')? 'selected' : '' }>금융</option>
				    	<option value="인터넷/서비스" ${(mbVo.sub_task eq '인터넷/서비스')? 'selected' : '' }>인터넷/서비스</option>
				    	<option value="교육" ${(mbVo.sub_task eq '교육')? 'selected' : '' }>교육</option>
				    	<option value="통신" ${(mbVo.sub_task eq '통신')? 'selected' : '' }>통신</option>
				    	<option value="제조" ${(mbVo.sub_task eq '제조')? 'selected' : '' }>제조</option>
				  	</select>
				  	<label for="floatingSelect">서브직무를 선택하세요</label>
				</div>
	    	</div>	    	
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무지역</label><br/>
	    		<input type="text" name="corp_location" value='${mbVo.corp_location }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>포지션</label><br/>
	    		<input type="text" name="position" value='${mbVo.position }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>계약형태</label><br/>
	    		<input type="text" name="job_type" value='${mbVo.job_type }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>필요경력</label><br/>
	    		<input type="text" name="required_career" value='${mbVo.required_career }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>학력사항</label><br/>
	    		<input type="text" name="education_level" value='${mbVo.education_level }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무방식</label><br/>
	    		<input type="text" name="work_type" value='${mbVo.work_type }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
		    	<label>급여지급일</label><br/>
		    	<input type="text" name="pay_date" value='${mbVo.pay_date }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div> 
	    	<div class="col-12 col-sm-6" style="margin-bottom:20px; padding-left:0;">
	    		<label>필수스킬</label><br/>
	    		<input type="text" name="required_skill" value='${mbVo.required_skill }' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>       	    	     	    	
	  	</div>
	</div>
	<div class="container text-left" style="padding-left:0; margin-bottom:20px;">
		<label class="info_label" style="padding-left:0;">글 작성</label>
		<div class="row">
			<div class="col">
				<textarea id="summernote" name='doc'>${mbVo.doc }</textarea>
			</div>
		</div>
	</div>
</form>	
<div class="grid text-center" style="--bs-columns: 1;">
	<div>
  		<button type='button' class="mansearch_board_cancel">취소</button>
  		<button type='button' class="mansearch_board_updateR">수정</button>
  	</div>
</div>
</body>
</html>