<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_chatlist.jsp</title>
</head>
<body>
<div class='slide_in'>
	<div class='chatlist'>
		<div class='chat_user separator'>
			<img src="../images/basic_profile.jpg" class="mentor_profileImg">
			<div class='clickSection'>
				<span class='profile_nickname'>옥다방고양이</span>
				<span class='nal'>2023-01-07 17:38</span><br>
				<span class='last_talk'>네 다음에 또 얘기해요!</span>
			</div>
		</div>
		<div class='chat_user separator'>
			<img src="../images/devil_profile.png" class="mentor_profileImg">
			<div class='clickSection'>
				<span class='profile_nickname'>딥러닝악마</span>
				<span class='nal'>2023-01-07 17:38</span><br>
				<span class='last_talk'>고생하셨습니다!</span>
			</div>
		</div>
		<div class='chat_user separator'>
			<img src="../images/cat_profile.png" class="mentor_profileImg">
			<div class='clickSection'>
				<span class='profile_nickname'>min2us</span>
				<span class='nal'>2023-01-07 17:38</span><br>
				<span class='last_talk'>넹 안녕히주무세요!</span>
			</div>
		</div>
	</div>
</div>
<script>
$('.mentor_profileImg').on('click',function() {
	var title  = "member/member_profile_chat.jsp";
	var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=400, left=870"; 
    window.open("/profile/member_profile_chat", title, status);
});

$('.clickSection').on('click', function() {
	$(".slide").load('/mantoman/mantoman_chatview');
});
</script>
</body>
</html>