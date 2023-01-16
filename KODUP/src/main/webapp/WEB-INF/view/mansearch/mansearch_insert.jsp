<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mansearch/mansearch.insert.jsp</title>
<link rel='stylesheet' href='css/mansearch.css'>
<script src='js/mansearch.js'></script>
</head>
<body>
<h3 class="mansearch_insert_title">회사등록</h3>

<div class="container corp_enroll_container">
	<div class="row">
    	<div class="col-sm corp_enroll_step">
		    <span>
		    	<img class="corp_enroll_step_icon" src="/images/corp_enroll_step_icon.png"/>
		    	<label class="corp_enroll_step_top">
		    		회사등록 절차 안내
		    	</label>
		    </span>	
		    <p style="margin-bottom:16px;">
		    	<strong>KODUP에 가입한 개인 회원 계정 중</strong> 회사 정보 등록 및 인증을 받은 <strong>회사 관리자</strong> 회원만 구인 게시판에 등록이 가능하며 별도의 인증 절차가 필요하오니 구인 게시판을 이용하실 기업 회원분들은 사전에 등록 및 인증을 받으시기를 바랍니다.
		    </p>
		    <p>
		    	구인 게시판을 이용하시는 모든 회원분들께 보다 많은 혜택과 서비스를 제공하기 위함이니 적극적으로 협조 부탁드립니다.
		    </p>
		    <p style="margin:0;">
		    	항목은 필수 입력입니다.
		    </p>
		    <p style="font-weight:bold; margin:0;">
		    	온라인 일자리 중개 서비스를 운영 중인 회사에 대해서는 신규인증이 불가하며 기존 인증 회사 또한 인증 취소 처리 됩니다.(2021.10.1일 차단 조치)
		    </p>
		    <p style="font-weight:bold; margin:0;">
				기존에 온라인 일자리 중개 서비스 운영 회사 계정으로 작성된 게시물과 외부 플랫폼으로 유도하는 구인글은 비공개 또는 삭제 처리되며 이후 작성되는 구인글 또한 온라인 일자리 중개 서비스 링크가 포함될 수 없습니다. (2021.10.1 ~ 8일까지 조치)	    
			</p>		
		</div>
	</div>
</div>
<form class="mansearch_input_form" method='post' enctype='multipart/form-data'>
			
	<input type='hidden' name='id' class='member_id' value=''/>
	<input type='hidden' name='nowPage' value='${pVo.nowPage }'>
	<input type='hidden' name='findStr' value='${pVo.findStr }'>
	
	<div class="container text-left">
		<div class="row work_info">
			<label class="info_label">근무정보</label>
			<div class="col" style="padding-left:0;">
	    		<label>제목</label>
	    		<br/><input type="text" name="subject" value='가족같은 분위기에서 일하실 분 구합니다' class="form-control mansearch_board_insert_form" autocomplete="off">    		
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무시작일</label>
	    		<br/><input type="date" name="work_start" value='2023-02-25' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>지원마감일</label>
	    		<br/><input type="date" name="deadline" value='2023-02-10' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>급여(만원)</label>
	    		<br/><input type="text" name="pay" value='500' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>	    	
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>메인직무</label><br/>
				<div class="form-floating">
					<select class="form-select" name='main_task' id="floatingSelect" aria-label="Floating label select example">
				    	<option value="SI">SI</option>
				    	<option value="SM" selected>SM</option>
				  	</select>
				  	<label for="floatingSelect">메인직무를 선택하세요</label>
				</div>
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>서브직무</label><br/>
				<div class="form-floating">
					<select class="form-select" name='sub_task' id="floatingSelect" aria-label="Floating label select example">
				    	<option value="금융">금융</option>
				    	<option value="인터넷/서비스">인터넷/서비스</option>
				    	<option value="교육" selected>교육</option>
				    	<option value="통신">통신</option>
				    	<option value="제조">제조</option>
				  	</select>
				  	<label for="floatingSelect">서브직무를 선택하세요</label>
				</div>
	    	</div>	    	
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무지역</label>
	    		<br/><input type="text" name="corp_location" value='서울 서초구' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>포지션</label>
	    		<br/><input type="text" name="position" value='백엔드개발, 팀원' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>계약형태</label>
	    		<br/><input type="text" name="job_type" value='계약직' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>필요경력</label>
	    		<br/><input type="text" name="required_career" value='경력무관' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>학력사항</label>
	    		<br/><input type="text" name="education_level" value='학력무관' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
	    		<label>근무방식</label>
	    		<br/><input type="text" name="work_type" value='상근' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div>
	    	<div class="col-12 col-sm-6" style="padding-left:0;">
		    		<label>급여지급일</label>
	    		<br/><input type="text" name="pay_date" value='매월 32일' class="form-control mansearch_board_insert_form" autocomplete="off">
	    	</div> 
	    	<div class="col-12 col-sm-6" style="margin-bottom:20px; padding-left:0;">
	    		<label>필수스킬</label>
		    		<br/><input type="text" name="required_skill" value='java,spring,mysql,고기굽기' class="form-control mansearch_board_insert_form" place autocomplete="off">
	    	</div>       	    	     	    	
	  	</div>
	</div>
		<label class="info_label" style="padding-left:0;">글 작성</label>
		<div class="input-group form-group" style="margin:0 0 30px 0;">
			<textarea id='summernote' name='doc' class='doc' style=""></textarea>
		</div>
		
				
</form>	
<div class="grid text-center" style="--bs-columns: 1;">
	<div>
  		<button type='button' class="mansearch_board_cancel">취소</button>
  		<button type='button' class="mansearch_board_insertR">저장</button>
  	</div>
</div>
</body>
</html>