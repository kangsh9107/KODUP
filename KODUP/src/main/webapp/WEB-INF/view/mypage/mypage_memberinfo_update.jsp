<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script defer src='js/mypage_memberinfo_2.js'></script>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<div id='memberinfo_modify'>
	<h5>회원정보 수정</h5><br>
	<span class='mm_text'>이름</span><input type='text' class='name' placeholder='고박사'><br/>
	<span class='mm_text'>닉네임</span><input type='text' class='name' placeholder='고덥지박령'><br/>
	<span class='mm_text'>이메일</span><input type='text' class='name' placeholder='where_am_i@kodup.kr'><br/>
	<span class='mm_text'>나이</span><input type='text' class='name' placeholder='만 3세'><br/>
	<span class='mm_text'>성별</span><input type='text' class='name' placeholder='???'><br/>
	<br>
	<span class='mm_text'></span><button class='mypage_update_complete'>수정완료</button>
	<button class='mypage_update_cancel'>수정취소</button>
</div>
</body>
</html>