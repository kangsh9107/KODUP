<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link rel='stylesheet' href="css/mypage.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script defer src='js/mypage.js'></script>	
<meta charset="UTF-8">
<title>mypage_memberinfo.jsp</title>
</head>
<body>

	<div id="member_info">
		<h5 class='font'>회원정보</h5><br>
		<span class='box'>이름</span><input type='text'>
		<span class='box'>닉네임</span><input type='text'>
		<span class='box'>이메일</span><input type='text'>
		<span class='box'>나이</span><input type='text'>
		<span class='box'>성별</span><input type='text'>
	</div>
	<div id="member_picture">사진</div>
	<div id="member_control">
		<button type="button" class="btn btn-outline-primary">수정</button>
		<button type="button" class="btn btn-outline-secondary btnQuit">탈퇴</button>
	</div>
</body>
</html>