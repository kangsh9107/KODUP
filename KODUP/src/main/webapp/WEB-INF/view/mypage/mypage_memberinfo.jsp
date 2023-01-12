<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<%-- <c:set var="grade" value="abc"/>
	<c:choose>
	
	</c:choose> --%>
	<span>${mpVo.id } 님의 회원 등급은 <%-- ${grade } --%> 입니다. </span>
	<br><br>
	
		<div class='mypage_member_profile'>
			<div class='mypage_member_profile_item'>
				<img src='/upload/${mpVo.profile_img }' style='width: 280px;'>
			</div>
	
			<div class='mypage_member_profile_item'>
				<span class='mm_text'>닉네임</span><span>${mpVo.nickname }</span><br>
				<span class='mm_text'>이메일</span><span>${mpVo.email }</span><br>
				<span class='mm_text'>나이</span><span>${mpVo.age }</span><br>
				<span class='mm_text'>성별</span><span>${mpVo.gender }</span>
				<br><br><br>
				<button type="button" class="btn btn-outline-primary btnUpdate">내 정보수정</button><br>
				<button type="button" class="btn btn-outline-secondary btnQuit">탈퇴</button>
			</div>		

			<div class='mypage_member_profile_item'>
			</div>
		</div>
</div>	
	
</body>
</html>