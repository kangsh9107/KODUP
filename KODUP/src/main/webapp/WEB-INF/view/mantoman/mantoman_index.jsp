<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mantoman.css">
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script defer src="../js/mantoman.js"></script>
<title>mantoman/mantoman_index.jsp</title>
</head>
<body>
<div class="mantoman_wrapper">
	<div class="mantoman_main">
		<img src="../images/corini.png" class="profileImg">
		<div class="setting_iconDiv">
			<img src="../images/setting_icon.png" class="setting_icon">
		</div>
		
		<div class="mantoman_nicknameDiv">
			<span class="mantoman_nickname">코린이</span>
			<span class="mantoman_grade">멘티</span>
		</div>
		<div class="mantoman_Phrases">안녕하세요! 코린이입니다.</div>
		<div class="mantoman_nav">
			<nav class="mantoman_atags">
				<div id="horizontal-underline"></div>
	        	<a href="#" id="btnMentorList" class='atag' onclick="return false">멘토 프로필</a>
	        	<a href="#" id="btnChatList" class='atag' onclick="return false">대화 내용</a>   
			</nav>
		</div>
	</div>
	
	<div id="mantoman_innerSection">
	</div>
</div>
	

</body>
</html>