<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/profile.css">
<script defer src="js/profile.js"></script>
<title>profile/member_profile.jsp</title>
</head>
<body>
<div class="profile_wrapper">
	<div class="profile_main">
		<img src="images/basic_profile.jpg" class="basic_profile">
		<div class="setting_iconDiv">
			<img src="images/setting_icon.png" class="setting_icon">
		</div>
		
		<div class="profile_nicknameDiv">
			<span class="profile_nickname">옥다방고양이</span>
			<span class="profile_grade">멘토</span>
		</div>
		<div class="profile_Phrases">주 활동시간 : 월~금 12:00~19:00</div>
		<div class="profile_nav">
			<nav class="profile_atags">
				<div id="horizontal-underline"></div>
	        	<a href="#" id="btnMyarticle" class='atag'>내 게시글</a>
	        	<a href="#" id="btnMyrepl" class='atag'>내 댓글</a>   
	        	<a href="#" class='atag'>인스타그램</a>
			</nav>
		</div>
	</div>
	
	<div id="profile_innerSection">
	</div>
</div>
</body>
</html>