<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mantoman/mantoman_mentorlist</title>
</head>
<body>
<div class='partnerMentorList slide_out'>
	<div class='partnerType separator'>파트너 멘토</div>
	<!--파트너 멘토 DB데이터  -->
	<c:forEach var='mtmVo' items='${list }'>
		<c:if test='${mtmVo.grade eq 3 }'>
			<form class='chat_user separator' name='mentorForm'>
				<img src="../images/${mtmVo.profile_img}" class="mentoProfile_img">
				<span class='profile_nickname'>${mtmVo.nickname }</span>
				<span class='profile_phrases'>${mtmVo.introduce }</span>
				<input type='hidden' value='${mtmVo.id }' name='mentorId'>
				<input type='hidden' value='${mtmVo.nickname }' name='mentoNickname'>
				<input type='hidden' value='${mtmVo.profile_img}' name='mentoProfile_img_hidden'>
				<c:if test='${param.mentiId ne mtmVo.id}'>
					<input type='button' class='btnCall' value='멘토 요청'>
				</c:if>
			</form>
		</c:if>
	</c:forEach>
	<!--파트너 멘토 공갈데이터  -->
	<form class='chat_user separator'>
		<img src="../images/devilcookie.png" class="mentoProfile_img">
		<span class='profile_nickname'>자몽리</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentoProfile_img">
		<span class='profile_nickname'>Minojava</span><br>
		<span class='profile_phrases'>주 활동시간 : 월수금 19:00~24:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
</div>
<div class='plusMentorList'>
	<div class='partnerType separator'>플러스 멘토</div>
	<!--플러스 멘토 DB데이터  -->
	<c:forEach var='mtmVo' items='${list }'>
		<c:if test='${mtmVo.grade eq 2 }'>
			<form class='chat_user separator' name='mentorForm'>
				<img src="../images/${mtmVo.profile_img}" class="mentoProfile_img">
				<span class='profile_nickname'>${mtmVo.nickname }</span>
				<span class='profile_phrases'>${mtmVo.introduce }</span>
				<input type='hidden' value='${mtmVo.id }' name='mentorId'>
				<input type='hidden' value='${mtmVo.nickname }' name='mentoNickname'>
				<input type='hidden' value='${mtmVo.profile_img}' name='mentoProfile_img_hidden'>
				<c:if test='${param.mentiId ne mtmVo.id}'>
					<input type='button' class='btnCall' value='멘토 요청'>
				</c:if>
			</form>
		</c:if>
	</c:forEach>
	<!--플러스 멘토 공갈데이터  -->
	<form class='chat_user separator'>
		<img src="../images/angel.png" class="mentoProfile_img">
		<span class='profile_nickname'>작별왕바이킹</span><br>
		<span class='profile_phrases'>주 활동시간 : 금~일 21:00~01:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/girlchar.png" class="mentoProfile_img">
		<span class='profile_nickname'>이리나이</span><br>
		<span class='profile_phrases'>요새 바빠져서 자주 못해요ㅠ</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/default.png" class="mentoProfile_img">
		<span class='profile_nickname'>병맛나는병</span><br>
		<span class='profile_phrases'>주 활동시간 : 그때그때 달라요</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
</div>
<div class='personalMentorList'>
	<div class='partnerType separator'>퍼스널 멘토</div>
	<!--퍼스널 멘토 DB데이터  -->
	<c:forEach var='mtmVo' items='${list }'>
		<c:if test='${mtmVo.grade eq 1 }'>
			<form class='chat_user separator' name='mentorForm'>
				<img src="../images/${mtmVo.profile_img}" class="mentoProfile_img">
				<span class='profile_nickname'>${mtmVo.nickname }</span>
				<span class='profile_phrases'>${mtmVo.introduce }</span>
				<input type='hidden' value='${mtmVo.id }' name='mentorId'>
				<input type='hidden' value='${mtmVo.nickname }' name='mentoNickname'>
				<input type='hidden' value='${mtmVo.profile_img}' name='mentoProfile_img_hidden'>
				<c:if test='${param.mentiId ne mtmVo.id}'>
					<input type='button' class='btnCall' value='멘토 요청'>
				</c:if>
			</form>
		</c:if>
	</c:forEach>
	<!--퍼스널 멘토 공갈데이터  -->
	<form class='chat_user separator'>
		<img src="../images/devilcookie.png" class="mentoProfile_img">
		<span class='profile_nickname'>강하게개발맨</span><br>
		<span class='profile_phrases'>무리한 요구 사절입니다.</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/basic_profile.jpg" class="mentoProfile_img">
		<span class='profile_nickname'>JD-pro</span><br>
		<span class='profile_phrases'>주 활동시간 : 월~금 12:00~19:00</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
	<form class='chat_user separator'>
		<img src="../images/angel.png" class="mentoProfile_img">
		<span class='profile_nickname'>미녕짱123</span><br>
		<span class='profile_phrases'>주말 오후에 주로 접속함</span>
		<input type='button' class='btnCall' value='멘토 요청'>
	</form>
</div>
<script>

$('.mentoProfile_img').on('click',function() {
	var title  = "member/member_profile_chat.jsp";
	var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=400, left=870"; 
    window.open("/profile/member_profile_chat", title, status);
});
</script>
</body>
</html>