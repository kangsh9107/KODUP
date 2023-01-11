<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script defer src='js/mypage_certification.js'></script>
<meta charset="UTF-8">
<title>멤버 인증</title>
</head>
<body>

<div id='certification'>
	
	<span class='mypage_subject_text'>인증</span>
	<br><br>
	<div class='mypage_certification_box'>
		<span>* 이메일인증</span><br>
		<div class="form-floating mb-3">
		  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
		  <label for="floatingInput" class='label_name'>Email을 입력하세요</label>
		</div>
		<button type='button' class='btnC btn_email_certification' style="background-color:#bb2649;">인증</button><br>
		<br>
		<span>* 계좌인증</span><br>
		<div class="form-floating">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
		  <label for="floatingPassword" class='label_name '>계좌번호를 입력하세요</label>
		</div> 
		  <button type='button' class='btnC btn_account_certification' style="background-color:#bb2649;">인증</button><br>
		
		<br>
		
		<span>* 멘토인증</span><br>
		<div class="form-floating">
		  <input type="file" class="form-control" id="floatingPassword" placeholder="Password">
		  <label for="floatingPassword" class='label_name'>경력증명서를 첨부하세요</label>
		</div>
		  <button type="button" class='btnC btn_mentor_certification' style="background-color:#bb2649;">인증</button><br>
	
		<br>
		<span>* 기업인증</span><br>
			<form class='corp_certification'>
				<div class="form-floating bottom">
					<input type="text" class="form-control" id="floatingPassword" placeholder="Password">
					<label for="floatingPassword" class='label_name'>기업명</label>
				</div> 
				<br>
				<div class="form-floating bottom">
				  <input type="file" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword" class='label_name'>사업자 등록증을 첨부하세요</label>
				</div>
				<br>
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingPassword" placeholder="Password">
					<label for="floatingPassword" class='label_name'>담당자</label>
				</div> 
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingPassword" placeholder="Password">
					<label for="floatingPassword" class='label_name'>담당자 연락처</label>
				</div> 
				<button type="button" class='btnC btn_corp_certification' style="background-color:#bb2649;">인증</button><br>
			</form>
			<br><br>
		</div>
	</div>
</body>
</html>