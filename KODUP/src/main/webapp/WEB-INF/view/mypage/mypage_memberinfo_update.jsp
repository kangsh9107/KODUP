<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	window scrollTo(0,0);
</script>
<script defer src='js/mypage_memberinfo_update.js'></script>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<div id='memberinfo_update'>
	<form name='update_complete' class="memberinfo_update_complete">
		<span class='mypage_subject_text'>회원정보 수정</span><br><br>
		<span class='mm_text'>아이디</span><input type='text' name='id' class='name' value=${mpVo.id }><br/>
		<span class='mm_text'>닉네임</span><input type='text' name='nickname' class='name' value=${mpVo.nickname }><br/>
		<span class='mm_text'>이메일</span><input type='text' name='email' class='name' value=${mpVo.email }><br/>
		<span class='mm_text'>나이</span><input type='text' name='age' class='name' value=${mpVo.age }><br/>
		<span class='mm_text'>성별</span><input type='text' name='gender' class='name' value=${mpVo.gender } readonly><br/>
		<br>
		<span class='mm_text'></span><button class='mypage_update_complete'>수정완료</button>
		<button type='button' class='mypage_update_cancel'>수정취소</button>
	</form>
</div>
</body>
</html>