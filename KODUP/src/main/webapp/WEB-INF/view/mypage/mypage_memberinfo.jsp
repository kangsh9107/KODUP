<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script defer src='js/mypage_memberinfo.js'></script>
<link rel='stylesheet' href='css/mypage.css'>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script> -->
<meta charset="UTF-8">
<title>mypage_memberinfo.jsp</title>
</head>
<body>

<div id="mypage_memberinfo">
	<span class='mypage_subject_text'>회원정보</span>
		<br><br>
		<div class='mypage_member_profile'>
			<div class='mypage_member_profile_item'>
					<img src="https://s3.orbi.kr/data/file/united2/ee9383d48d17470daf04007152b83dc0.png"
					style='width: 280px;'>
			</div>

			<div class='mypage_member_profile_item'>
				<span class='mm_text'>이름</span><span>고박사</span><br>
				<span class='mm_text'>닉네임</span><span>코덥지박냥</span><br>
				<span class='mm_text'>이메일</span><span>where_am_i@kodup.kr</span><br>
				<span class='mm_text'>나이</span><span>만 3세</span><br>
				<span class='mm_text'>성별</span><span>알수없음askdfja;kdfas</span>
				<br><br><br>
				<button type="button" class="btn btn-outline-primary btnModify">내 정보수정</button><br>
				<button type="button" class="btn btn-outline-secondary btnQuit">탈퇴</button>
			</div>		

			<div class='mypage_member_profile_item'>
			</div>
		</div>
</div>	
	
</body>
</html>