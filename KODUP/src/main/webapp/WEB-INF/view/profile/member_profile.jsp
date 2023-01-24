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
		<img src="/upload/${pfVo.profile_img }" class="profileImg">
		<div class="setting_iconDiv">
			<img src="images/setting_icon.png" class="setting_icon">
		</div>
		
		<div class="profile_nicknameDiv">
			<span class="profile_nickname">${pfVo.nickname }</span>
			<span class="profile_grade">${pfVo.grade }</span>
		</div>
		<div class="profile_phrases">${pfVo.introduce }</div>
		<div class="profile_nav">
			<nav class="profile_atags">
				<div id="horizontal-underline"></div>
	        	<a href="#" id="btnMyarticle" class='atag' onclick="return false">내 게시글</a>
	        	<a href="#" id="btnMyrepl" class='atag' onclick="return false">내 댓글</a>   
	        	<a href="#" class='atag' onclick="return false">인스타그램</a>
			</nav>
		</div>
	</div>
	
	<div id="profile_innerSection">
	</div>
	
</div>
</body>
</html>