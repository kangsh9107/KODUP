<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_mentorlist</title>
</head>
<body>
<div class='partnerMentorList slide_out'>
	<div class='partnerType separator'>파트너 멘토</div>
	
	
	
	
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
</div>
<div class='plusMentorList'>
	<div class='partnerType separator'>플러스 멘토</div>
	
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
</div>
<div class='personalMentorList'>
	<div class='partnerType separator'>퍼스널 멘토</div>
	
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentor_profileImg">
		<span class='profile_nickname'>옥다방고양이</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
</div>
<script>

$('.mentor_profileImg').on('click',function() {
	var title  = "member/member_profile_chat.jsp";
	var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=400, left=870"; 
    window.open("/profile/member_profile_chat", title, status);
});
</script>
</body>
</html>